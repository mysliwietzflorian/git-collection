#!/bin/bash

. bin/demo-magic.sh -d

unset TYPE_SPEED
SHOW_CMD_NUMS=true
DEMO_PROMPT="$BLUE~/demo-repository$COLOR_RESET$ "

function check_dependency {
    depName=$1
    package=${2:-$1}
    command -v $depName >/dev/null 2>&1 || {
        echo ""
        echo -e "${RED}######################################################################"
        echo -e "${RED}# HOLD IT!! I require $depName but it's not installed.  Aborting."
        echo -e "${RED}######################################################################"
        echo ""
        echo -e "${COLOR_RESET}Installing $depName: sudo apt install $package"
        echo -e "${COLOR_RESET}"
        exit 1;
    }
}

function init_repo {
    # clean up previous run
    rm -rf demo-repository/*
    rm -rf demo-repository/.git
    rm -rf demo-repository/.gitkeep
    clear

    cd demo-repository

    p "git init"
    git init > /dev/null
    echo "Initialized empty Git repository"
    BRANCH_NAME=$(git branch --show-current)
    DEMO_PROMPT="$BLUE~/demo-repository$GREEN($BRANCH_NAME)$COLOR_RESET$ "

    # the following files are not needed for the demo
    if [[ -d ".git/hooks" ]]; then
        pe "rm -r .git/hooks"
    fi
    if [[ -f ".git/info/exclude" ]]; then
        pe "rm -r .git/info/exclude"
    fi
    if [[ -f ".git/description" ]]; then
        pe "rm -r .git/description"
    fi

    pe "clear"
}
