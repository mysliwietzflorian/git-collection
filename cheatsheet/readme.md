# Git Cheatsheet

- [Configuration](#configuration)
- [Starting a project](#starting-a-project)
- [Day-to-day work](#day-to-day-work)
- [Branching model](#branching-model)
- [Review your work](#review-your-work)
- [Synchronizing repositories](#synchronizing-repositories)
- [Temporary commits](#temporary-commits)
- [Tagging known commits](#tagging-known-commits)
- [Appendix](#appendix)
    - [Appendix A - Working areas](#a---working-areas)
    - [Appendix B - Ignoring files](#b---ignoring-files)
    - [Appendix C - Commands in PhpStorm](#c---commands-in-phpstorm)
    - [Appendix D - Workflows in PhpStorm](#d---workflows-in-phpstorm)
- [References](#references)

## Configuration

`$ git config --global user.name “[your name]”`  
Set the name that will be attached to your commits and tags.

`$ git config --global user.email “[you@example.com]”`  
Set the email address that will be attached to your commits and tags.

`$ git config --global color.ui auto`  
Enable some colorization of the Git output.

`$ git config --global core.editor [notepad]`  
Set the editor which will be started to write commit messages. Default is *vi*.

`$ git config --global init.defaultBranch [name]`  
Since Git 2.28. Set a default branch name for the initial branch. Previously, it
was "master". The new recommendation is "main".

## Starting a project

`$ git init [project name]`  
Create a new local repository. If a project name is provided, Git will create a
new directory and will initialize a repository inside it. If no project name is
provided, then a new repository is initialized in the current directory.

`$ git clone [project url]`  
Download a project with the entire history from the remote repository.

## Day-to-day work

`$ git status`  
List which files are staged, unstaged, and untracked. It will also retrieve the
branch name, the current commit ID (hash), and pending commits from the remote.

`$ git commit`  
Create a new commit from changes added to the staging area. A new text editor
will be launched to write a commit message.

`$ git commit -m “[descriptive message]”`  
Create a new commit from the changes added to the staging area, but instead of
launching a text editor, use the message directly as the commit message.

`$ git add [file]`  
Add a file to the staging area. You can also use a glob pattern to add multiple
changed files at once.

`$ git rm [file]”`  
Remove a file from the working direcory and the staging area.

`$ git mv [existing file] [new file]”`  
Move an existing file and add it to the staging area.

`$ git diff [file]`  
Show changes between the working directory and the staging area.

`$ git diff --staged [file]`  
Show any changes between the staging area and the repository.

`$ git checkout -- [file]`  
Discard file changes in the working directory. This operation is unrecoverable.

`$ git reset [commit]`  
Reset the staging area to match the commit (most recent commit if
omitted), but leave the working directory alone.

`$ git reset --hard [commit]`  
Reset the staging area and the working directory to match the commit (most
recent commit if omitted). This overwrites all changes in the working directory.

## Branching model

`$ git branch [-a]`  
List all local and remote branches in the repository.

`$ git branch [branch name]`  
Create a new branch at the current commit (HEAD).

`$ git checkout [-b] [branch name]`  
Switch the working directory to the specified branch. With the `-b` option a new
branch with the name will be created.

`$ git merge [branch name]`  
Merge changes from specified branch into the current one. 

`$ git branch -d [branch name]`  
Remove a branch, if it is already merged into any other.

## Review your work

`$ git log`  
List the commit history of the current branch.

`$ git log [-5]`  
The option `-5` limits list to the last 5 commits.

`$ git log --oneline --graph --decorate`  
The option `--oneline` condenses each commit to a single line.  
The option `--graph` draws a text-based graph of commits on the left side of
the commit messages.  
The option `--decorate` adds names of branches or tags of the shown commits.

`$ git log -p`  
Display the full diff of each commit.

`$ git log --stat`  
Display which files were altered and the relative number of lines that were
added or deleted from each of the commits.

`$ git log --author=”[pattern]”`  
Search for commits by a particular author.

`$ git log --grep=”[pattern]”`  
Search for commits with a commit message that matches the [pattern].

`$ git log [since]..[until]`  
Show commits that occur between [since] and [until]. Arguments can be a commit
ID (hash), a branch name, HEAD, or any other kind of revision reference.

`$ git log -- [file]`  
Only display commits that modified the specified file.

`$ git log --follow [file]`  
Show the commits that changed a file, even across renames.

`$ git reflog`  
List operations (e.g. checkouts or commits) that were made on the local
repository.

`$ git show [hash]`  
Show any object in Git in a human-readable format.

## Synchronizing repositories

`$ git remote add [alias] [url]`  
Create a new connection to a remote repository. Initially, the alias is called
'origin', but can be changed to any name.

`$ git fetch [alias] [branch]`  
Fetch changes from the remote branch, but does apply any changes to the local
repository.

`$ git merge [alias]/[branch]`  
Merge a remote branch into your current branch to brings it up to date.

`$ git pull [alias]`  
Fetch changes from the remote branch and merge the current branch with its
upstream.

`$ git push [alias] [branch]`  
Push the local changes to the remote repository. If the remote branch does not
exist, it will be created. Use the option `--tags` to push tags as well.

## Temporary commits

`$ git stash`  
Put current changes of your working directory into stash for later use.

`$ git stash list`  
List stashed file changes.

`$ git stash pop`  
Apply stored stash content into the working directory and clear the stash.

`$ git stash drop`  
Delete a specific stash from all your previous stashes.

## Tagging known commits

`$ git tag`  
List all tags.

`$ git tag [name] [commit ID]`  
Create a new tag reference for the specified commit ID (uses the current commit
if argument is omitted).

`$ git tag -d [name]`  
Remove a tag from the local repository.

## Appendix

### A - Working areas

See [Working areas](01_working-areas.md)

### B - Ignoring files

See [Ignoring files](02_ignoring-files.md)

### C - Commands in PhpStorm

See [Commands in PhpStorm](03_commands-in-phpstorm.md)

### D - Workflows in PhpStorm

See [Workflows in PhpStorm](04_workflows-in-phpstorm.md)

## References

- https://git-scm.com
- https://about.gitlab.com/images/press/git-cheat-sheet.pdf
- https://education.github.com/git-cheat-sheet-education.pdf
- https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet
- https://ndpsoftware.com/git-cheatsheet.html
