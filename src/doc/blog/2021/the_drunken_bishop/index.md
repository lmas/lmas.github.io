---
title: The drunken bishop
date: 2021-08-27
---

How do you easily compare long, complex strings such as digital fingerprints or cryptographic hashes?

Some time ago I read an excellent blog post about the [Drunken Bishop] algorithm by James Furness.
He explains how OpenSSH uses this algorithm to visualise SSH key fingerprints,
in order to make it easier for a human to compare some (possibly) different keys.


It looks like this:

    The key fingerprint is:                             The key fingerprint is:
    SHA256:SeWerfeJRwXSaRS39jFagjDgGQBVjG3NcJ9CWFMor/8  SHA256:XTsAcjtIvxut9rHZX8v5MpaxwPGNzJRxDkzHP9FiC8A
    The key's randomart image is:                       The key's randomart image is:
    +---[RSA 2048]----+                                 +---[RSA 2048]----+
    |   .oo*=BB+. ooo.|                                 |      o o... o..o|
    |     ..*=*= + =..|                                 |     . = oE . *o+|
    |      .o+..+ + B |                                 |      . + . .o Oo|
    |       . +.o  = =|                                 |         = o..+.o|
    |        S o .. ..|                                 |        S o.o* o.|
    |       .   .  .  |                                 |         +  o.* .|
    |        . . ..   |                                 |        + .  . +.|
    |         . . o.. |                                 |       . . =  B.o|
    |          .E..o  |                                 |          + .o.*o|
    +----[SHA256]-----+                                 +----[SHA256]-----+

Simple yet effective way to differentiate fingerprints.

James also had a link to an analysis by [Dirk Loss, Tobias Limmer and Alexander von Gernler],
which had a pretty different (but great) introduction:

> Bishop Peter finds himself in the middle of an ambient atrium.\
> There are walls on all four sides and apparently there is no exit.\
> The floor is paved with square tiles, strictly alternating between\
> black and white. His head heavily aching — probably from too much\
> wine he had before — he starts wandering around randomly. Well, to\
> be exact, he only makes diagonal steps — just like a bishop on a\
> chess board. When he hits a wall, he moves to the side, which\
> takes him from the black tiles to the white tiles (or vice versa).\
> And after each move, he places a coin on the floor, to remember\
> that he has been there before. After 64 steps, just when no coins\
> are left, Peter suddenly wakes up. What a strange dream!

[Drunken Bishop]: https://www.jfurness.uk/the-drunken-bishop-algorithm/
[Dirk Loss, Tobias Limmer and Alexander von Gernler]: http://www.dirk-loss.de/sshvis/drunken_bishop.pdf
