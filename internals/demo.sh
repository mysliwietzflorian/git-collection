#!/bin/bash
. demo-magic.sh -d

SHOW_CMD_NUMS=true
DEMO_PROMPT="$BLUE~$COLOR_RESET$ "

### clean up previous run ###

rm -rf demo-repository/*
rm -rf demo-repository/.git
rm -rf demo-repository/.gitkeep
clear

p "mkdir demo-repository"
pe "cd demo-repository"

DEMO_PROMPT="$BLUE~/demo-repository$COLOR_RESET$ "

### initial setup ###

p "git init"
git init > /dev/null
echo "Initialized empty Git repository"
BRANCH_NAME=$(git branch --show-current)
DEMO_PROMPT="$BLUE~/demo-repository$GREEN($BRANCH_NAME)$COLOR_RESET$ "

# the following files are not needed for the demo
pe "rm -r .git/hooks"
pe "rm -r .git/info/exclude"
pe "rm -r .git/description"
pei ""
pe "git status"
pe "clear"

### initial file blob object ###

pe "echo \"Hello, world.\" > README.md"
pe "cat README.md"
pe "git status"
# creates a Git blob object with the file content and size (but no mention of
# the filename)
pe "git add README.md"
pe "git status"
pe "clear"

pe "cat .git/objects/f7/5ba05f340c51065cbea2e1fdbfe5fe13144c97"
pei ""
# using zlib to decompress blob files (normal deflate algorithm)
pe "pigz -d < .git/objects/f7/5ba05f340c51065cbea2e1fdbfe5fe13144c97"
# or use the Git cat-file command which does a similar thing (this is an example
# of a Git plumbing command)
pe "git cat-file --help"
pe "git cat-file -t f75ba05f"
pe "git cat-file -s f75ba05f"
pe "git cat-file -p f75ba05f"
pe "clear"

### tree and commit objects ###

# a new commit creates two new Git objects: a tree and a commit
pe "git commit -m \"initial commit message\""
pe "git status"
pe "clear"

pe "git log --pretty=fuller"
pe "git cat-file -t 113a72ef"
# this is a Git tree object which references the Git mode (combination of link
# type and permissions), the content by blob hash and the file name.
pe "git cat-file -p 113a72ef"
pei ""
pe "git cat-file -t HEAD"
pe "git cat-file -p HEAD"
pei ""
# The demo cannot deterministicly infer the commit hash (because of author name
# and different commit and author timestamps) -> use HEAD instead
pe "cat .git/HEAD"
pe "cat .git/refs/heads/$BRANCH_NAME"
pe "clear"

### commit hash generation ###

pe "git log --pretty=fuller"
pe "git commit --amend --no-edit --quiet"
# `git commit --amend` will modify the current commit and update the hash
pe "git log --pretty=fuller"
pe "git commit --amend --no-edit --quiet"
pe "git log --pretty=fuller"
pe "clear"

# by setting the commit and author date the hash remains the same
pe "GIT_COMMITTER_DATE=\"2022-10-21T08:00:00\" git commit --amend --no-edit --quiet --date=\"2022-10-21T08:00:00\""
pe "git log --pretty=fuller"
pe "GIT_COMMITTER_DATE=\"2022-10-21T08:00:00\" git commit --amend --no-edit --quiet --date=\"2022-10-21T08:00:00\""
pe "git log --pretty=fuller"
pe "clear"

### remove unreachable commits from before ###

pe "rm .git/logs/refs/heads/$BRANCH_NAME"
pe "rm .git/logs/HEAD"
pe "git fsck --unreachable"
# instead of git gc (which will also pack commits which we want to avoid here)
pe "git prune"
pe "clear"

### Second example of tree object with multiple files

pe "mkdir foo"
pe "echo \"upbeat_ritchie\" >> foo/bar.md"
pe "echo \"relaxed_stallman\" >> foo/baz.md"
pe "git add --all"
pe "GIT_COMMITTER_DATE=\"2022-10-21T08:00:00\" git commit -m \"further changes\" --date=\"2022-10-21T08:00:00\""
pe "clear"

pe "git log --oneline"
pe "git cat-file -p HEAD"
pe "git cat-file -p f90971a"
pe "git cat-file -p 1892df5"
pe "clear"

p "Thanks for attending!"
p ""

touch .gitkeep
