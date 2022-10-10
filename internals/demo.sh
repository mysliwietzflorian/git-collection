#!/bin/bash
. demo-magic.sh -d

SHOW_CMD_NUMS=true
DEMO_PROMPT="${BLUE}~${COLOR_RESET}$ "

### clean up previous run ###

rm -rf demo-repository/*
rm -rf demo-repository/.git
rm -rf demo-repository/.gitkeep
clear

p "mkdir demo-repository"
pe "cd demo-repository"

DEMO_PROMPT="${BLUE}~/demo-repository${COLOR_RESET}$ "

### initial setup ###

p "git init"
git init > /dev/null
echo "Initialized empty Git repository"

DEMO_PROMPT="${BLUE}~/demo-repository${GREEN}(main)${COLOR_RESET}$ "

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
pe "git add README.md"
pe "git status"
pe "clear"

pe "cat .git/objects/f7/5ba05f340c51065cbea2e1fdbfe5fe13144c97"
pei ""
# using zlib to decompress blob files
pe "pigz -d < .git/objects/f7/5ba05f340c51065cbea2e1fdbfe5fe13144c97"
pe "git cat-file --help"
pe "git cat-file -t f75ba05f"
pe "git cat-file -p f75ba05f"

pe "git commit -m \"initial commit message\""
pe "git status"
pe "clear"

pe "git log --pretty=fuller"
pe "git cat-file -t 113a72ef"
pe "git cat-file -p 113a72ef"
pei ""
pe "git cat-file -t HEAD"
pe "git cat-file -p HEAD"
pei ""
pe "cat .git/HEAD"
pe "cat .git/refs/heads/main"
pe "clear"

pe "git log --pretty=fuller"
pe "git commit --amend --no-edit --quiet"
pe "git log --pretty=fuller"
pe "git commit --amend --no-edit --quiet"
pe "git log --pretty=fuller"
pe "clear"

pe "GIT_COMMITTER_DATE=\"2022-10-21T08:00:00\" git commit --amend --no-edit --quiet --date=\"2022-10-21T08:00:00\""
pe "git log --pretty=fuller"
pe "GIT_COMMITTER_DATE=\"2022-10-21T08:00:00\" git commit --amend --no-edit --quiet --date=\"2022-10-21T08:00:00\""
pe "git log --pretty=fuller"
pe "clear"

p "Thanks for attending!"
p ""

touch .gitkeep
