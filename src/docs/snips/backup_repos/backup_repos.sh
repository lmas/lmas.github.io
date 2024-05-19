#!/bin/sh -e

# Hostname to your forgejo instance
HOST=""

# Basic auth token for repo access via the forgejo API
# Keep this secret!
TOKEN=""

# Local dir to keep the repo backups in
BACKUP_DIR="/tmp"

################################################################################

cd "$BACKUP_DIR"

key="$(pwd)/.backupkey"
if [ ! -f "$key" ]; then
	echo "Before you can start running backups, you need a SSH key!"
	ssh-keygen -t ecdsa -f "$key"
	echo
	echo "Please add this key to your forgejo user before continuing:"
	cat "$key.pub"
	exit 0
fi

################################################################################

print () {
	# Only print messages if run by terminal user
	if [ -n "$TERM" ]; then
		echo "$@"
	fi
}

dogit() {
	GIT_SSH_COMMAND="ssh -i $key -o IdentitiesOnly=yes" git "$@"
}

repo_list=$(curl -s -X "GET" -H "authorization: Basic $TOKEN" "https://$HOST/api/v1/repos/search" | jq ".data[].ssh_url" | tr -d '"')

echo "$repo_list" | while read -r repo; do
	dir="repos/$(echo "$repo" | sed -nr 's/.*\/(.+)\.git/\1/p' | tr -d '.')"
	print "Updating $dir ..."

	if [ -d "$dir" ]; then
		dogit -C "$dir" remote update --prune
	else
		dogit clone --quiet --mirror "$repo" "$dir"
	fi

	# be nice to grumpy uncle mr. rate limiter
	sleep 5
done

print "All done!"
