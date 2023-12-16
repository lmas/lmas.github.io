// Copyright © 2021 Alex
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

package main

import (
	"flag"
	"log"
	"os"
	"os/exec"
	"os/signal"
	"path/filepath"
	"strings"
	"syscall"
	"time"

	"github.com/rjeczalik/notify"
)

var (
	flagDir     = flag.String("dir", ".", "Directory to watch for file events")
	flagTimeout = flag.Int("timeout", 2000, "File event timeout in milliseconds")
	flagVerbose = flag.Bool("verbose", false, "Verbose output")
)

func main() {
	flag.Parse()
	args := flag.Args()
	if len(args) < 1 {
		printFatal("Missing command to run")
	}
	cmd, args := args[0], args[1:] // This is a nifty slice trick

	dir := filepath.Join(*flagDir, "...") // Makes it watch the dir recursively
	signals, cancelSignal := trapSignal()
	events, cancelWatch := watchDir(dir)
	defer func() {
		cancelSignal()
		cancelWatch()
		printVerbose("Done")
	}()

	timeout := time.Duration(*flagTimeout) * time.Millisecond
	lastTime := time.Now()
	cancel := runCommand(cmd, args...)
	for {
		// Blocks until a file was modified or a signal recieved.
		select {
		case _ = <-signals:
			cancel()
			return
		case ev := <-events:
			if (ev.Event() != notify.Write && ev.Event() != notify.Create) ||
				strings.HasSuffix(filepath.Dir(ev.Path()), ".git") {
				// - Ignore unwanted events, see comments in watchDir() below.
				// - Ignore useless git events (too much spam).
				continue
			}
			// printVerbose("%s: %s", ev.Event().String(), ev.Path())
		}

		now := time.Now()
		if now.Sub(lastTime) < timeout {
			continue // New event too soon, skip rerun
		}

		cancel()
		log.Println("################################################################################")
		cancel = runCommand(cmd, args...)
		lastTime = now
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////

func printVerbose(msg string, args ...interface{}) {
	if *flagVerbose {
		log.Printf(msg+"\n", args...)
	}
}

func printFatal(msg string, args ...interface{}) {
	log.Fatalf(msg+"\n", args...)
}

type cancelFunc func()

func trapSignal() (chan os.Signal, cancelFunc) {
	signals := make(chan os.Signal, 1)
	signal.Notify(signals, syscall.SIGHUP, syscall.SIGQUIT, syscall.SIGINT, syscall.SIGTERM)

	return signals, func() {
		signal.Stop(signals)
		close(signals)
	}
}

func watchDir(dir string) (chan notify.EventInfo, cancelFunc) {
	events := make(chan notify.EventInfo, 10)
	// Got to watch for ALL events 'cuz of some FreeBSD bug not properly sending watched events..?
	if err := notify.Watch(dir, events, notify.All); err != nil {
		printFatal("Failed to watch dir %s: %s", dir, err)
	}
	printVerbose("Watching %q", dir)

	return events, func() {
		notify.Stop(events)
		close(events)
	}
}

func runCommand(cmd string, args ...string) cancelFunc {
	c := exec.Command(cmd, args...)
	c.Stdout, c.Stderr = os.Stdout, os.Stderr
	// Sometimes the process might spawn children, so have to set a whole process group (which the children will
	// belong to too). Otherwise we will be left with orphaned children when the parent is killed.
	// For more detailed info, see:
	// https://medium.com/@felixge/killing-a-child-process-and-all-of-its-children-in-go-54079af94773
	c.SysProcAttr = &syscall.SysProcAttr{Setpgid: true}

	printVerbose("Rerun %s %s", cmd, strings.Join(args, " "))
	if err := c.Start(); err != nil {
		printFatal("Failed to run '%s %s': %s", cmd, strings.Join(args, " "), err)
	}

	// By running wait() in a goroutine, we ensure child is cleaned up immidiately and leave no terminated
	// "zombies" no matter how the child was terminated.
	go func() {
		if err := c.Wait(); err != nil {
			printVerbose("%s", err)
		}
		printVerbose("Process terminated: %s", c.ProcessState.String())
	}()

	return func() {
		// Quick check to see if child has terminated. ProcessState is set after Wait() is done.
		if c.ProcessState != nil {
			return
		}

		// In order to kill a whole process group we can send a negative PID.
		// Also want to use a SIGINT, instead of a SIGKILL, in case the child need to do some cleanup.
		if err := syscall.Kill(-c.Process.Pid, syscall.SIGINT); err != nil {
			printFatal("Error sending SIGINT to process %d: %s", c.Process.Pid, err)
		}
	}
}
