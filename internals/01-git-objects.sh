#!/bin/bash
. bin/base.sh

check_dependency pv
check_dependency pigz
check_dependency man man-db

init_repo

pe "git status"
pei ""

### initial file blob object ###

pe "echo 'Hello, world.' > readme.md"
pe "cat readme.md"
pe "clear"
pe "git status"
pe "git add readme.md" # creates a blob object
pe "git status"
pe "clear"

pe "cat .git/objects/f7/5ba05f340c51065cbea2e1fdbfe5fe13144c97"
pei ""
pe "pigz --decompress < .git/objects/f7/5ba05f340c51065cbea2e1fdbfe5fe13144c97" # using zlib to decompress blob files (normal deflate algorithm)
pe "man git cat-file"
pe "git cat-file -t f75ba05f" # object type
pe "git cat-file -s f75ba05f" # object size
pe "git cat-file -p f75ba05f" # pretty-print the object content
pe "clear"

### tree and commit objects ###

pe "git commit -m \"initial commit message\"" # a new commit creates two new objects: a tree and a commit
pe "git status"
pe "clear"

pe "git log --pretty=fuller"
pe "git cat-file -t 46da79a" # a tree object: every line references another tree or blob (directory or file)
pe "git cat-file -p 46da79a"
pei ""
pe "git cat-file -t HEAD" # HEAD is used as the commit hash is unpredictable by the demo at this point 
pe "git cat-file -p HEAD"
pe "clear"

pe "cat .git/HEAD"
pe "cat .git/refs/heads/$BRANCH_NAME"
pe "git log --oneline"
pe "clear"

### tree object with multiple files and file modes

pe "mkdir foo"
pe "echo \"Lorem Ipsum\" > foo/bar.txt"
pe "cat foo/bar.txt"
pe "echo \"sleep 2 && echo 'Still alive.'\" > foo/baz.sh"
pe "cat foo/baz.sh"
p "./foo/baz.sh"
echo 'bash: ./foo/baz.sh: Permission denied'
pe "ls -la foo/"
pe "clear"

pe "git add --all"
pe "git status"
pe "chmod +x foo/baz.sh"
pe "./foo/baz.sh"
pe "ls -la foo/"
pe "clear"

pe "git status"
pe "git add foo/baz.sh"
pe "git commit -m \"add further directories and files\""
pe "clear"

pe "git log --oneline"
pe "git cat-file -p HEAD"
pe "git cat-file -p 4260b3c"
pe "git cat-file -p 3971cf0" # See execute permissions for foo/baz.sh
pe "clear"
