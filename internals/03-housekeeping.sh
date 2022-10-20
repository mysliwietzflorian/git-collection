#!/bin/bash
. bin/base.sh

check_dependency pv
check_dependency man man-db

init_repo

pe "echo 'Hello, world.' > readme.md"
pe "git add readme.md"
pe "git commit -m \"initial commit message\""
pe "clear"

### unreachable commit object through amend ###

pe "git log --pretty=fuller"
pe "git commit --amend --no-edit --quiet"
pe "git commit --amend --no-edit --quiet"
pe "git commit --amend --no-edit --quiet"
pe "git commit --amend --no-edit --quiet"
pe "git commit --amend --no-edit --quiet"
pe "git commit --amend --no-edit --quiet"
pe "git log --pretty=fuller"
pe "git log --oneline"
pe "clear"

pe "man git fsck"
pe "git fsck --unreachable"
pe "man git reflog"
pe "git reflog"
pe "rm .git/logs/refs/heads/$BRANCH_NAME"
pe "rm .git/logs/HEAD"
pe "git reflog"
pe "git fsck --unreachable"
pe "man git prune"
pe "git prune"
pe "clear"

### unreachable blob object through add ###

pe 'echo $RANDOM > foo.txt'
pe 'echo $RANDOM > bar.txt'
pe 'echo $RANDOM > baz.txt'
pe "git add --all"
pe "git reset --hard"
pe "git fsck --unreachable"
pe "git prune"
pe "clear"

### git garbage collector ###

pe "man git gc"
pe "git gc"
pe "clear"
