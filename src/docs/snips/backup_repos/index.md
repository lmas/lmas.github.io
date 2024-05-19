---
title: Snippet - Backup repos
date: 2024-05-19
---

Keeping local copies of your source code repositories seems like a good idea,
so I wrote a simple script to automagically mirror said repos.

The script is dependent on the [Forgejo API] to find all repos for a user
and needs an application token with at least the "read repo" scope.
You can test your token by:

- Going to your Forgejo instance's swagger API page,
- authorise using your username and token
- and test run the `/repos/search` route.


You should then be able to run the backups by copying the basic token,
from the curl example, into this script.

**Notice:**
If you're going to run this script with cron, you might want to run it once
beforehand as the cron user (for example, as `root`) so you can manually
authorise any new SSH fingerprints.


[Forgejo API]: https://forgejo.org/docs/latest/user/api-usage/

```include
backup_repos.sh
```
