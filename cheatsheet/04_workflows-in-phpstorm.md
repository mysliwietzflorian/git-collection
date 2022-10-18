# Workflows in PhpStorm

This document has embeded images. Depending on the format you are looking it
they might not be rendered correctly. You can also have a look in the `videos`
folder.

## Introduction and gitignore

<video controls="true" allowfullscreen="true">
    <source src="videos/01-gitignore.mp4" type="video/mp4">
</video>

- Explore the Git tab to see local changes.
- Create an example `.gitignore` file to ignore current local changes.
    - Decide whether to add the file to Git.
- Find the Git commit modal to proceed with a new commit.
  - If an entry in the gitignore for a local change exists it will not be in the
    list of files to commit.

## Status

<video controls="true" allowfullscreen="true">
    <source src="videos/02-status.mp4" type="video/mp4">
</video>

- Create a new `readme.md` file to test local changes.
  - Decide whether to add the file to Git.
- Open the Git commit dialog.
  - Alternatively, you can change that dialog to a non-modal commit interface
    (which I prefer and use in the upcoming examples.) To get that option open
    the **PhpStorm Settings > Version Control > Commit > Use non-modal commit
    interface**. Explore that alternative interface.
- See how to rollback (unstage) changes. The local changes will still be around
  but now they can be found under "Unversioned Files". These files will not be
  automatically committed.
- Use "Add to VCS" to re-add a file to Git.
- Create a commit message and commit with the alternative non-modal commit
  interface. 

## Branching and merging

<video controls="true" allowfullscreen="true">
    <source src="videos/03-branch-and-merge.mp4" type="video/mp4">
</video>

- Use the Git tab to explore local and remote branches and get an overview over
  all commits, their changes, meta properties, and their remote state.
  - See added up changed files over multiple commits.
- Create a simple test class in PHP to demonstrate branching and merging
  behavior. Commit that change.
- Create a new branch "fix-01" from the current "master" branch and add minor
  changes here (add return types).
- Create another new branch "feature-01" from the current "master" branch and
  add minor changes here (parameter typing). The change from "fix-01" will not
  be part of that branch as this exists on another branch. We simulate here the
  parallel development of two or more developers on the same file/lines. This
  will ultimately lead to a conflict during the merge. While Git tries the best
  to merge changes automatically (when different lines of code are affected),
  sometimes the interaction of a developer is necessary to resolve a merge
  conflict.
- We check out the "master" branch as we want our changes to be merged into
  here.
- First up, we merge "feature-01" into "master" which will work fine as no
  conflicts have happened, yet. The branch "feature-01" only adds a change while
  the "master" has not changed in the meantime.
- Next, we merge "fix-01" into "master". This time around, we get a dialog box
  with all our conflicting changes. We click "merge" to resolve this conflict.
  - Sometimes it might be necessary to communicate with other developers when
    changes of one part of the code are unclear or if it is not trivial to
    resolve the change.
  - In an additional modal we can see three columns (you can also change this to
    an inline diff viewer). 
    - On the left is the state of the branch you merge into which will have the
      resolved changes later on ("master" branch in this case).
    - On the right is the state of your merging branch (in this case "fix-01").
    - In the middle is the resulting code, which can be modified how ever you
      see fit.
    - You can directly add hunks of code to the result column with the little
      arrows next to the line numbers (very useful for non-conflicting changes).
      Update the result column to your needs to contain the changes of both
      branches.
  - Once all changes have been resolved you can click "Apply". If there are
    multiple conflicts during the merge, proceed with all remaining files like
    this.
- Now, the changes of both branches have been successfully merged into the
  "master" branch.

Merge conflicts can be one of the most annoying aspects of the Git branching
model, especially if many developers are working concurrently on the same part
of the codebase. To prevent merge conflicts prior to merging you might:

1. Commit and merge often and with small code changes. Conflicts will be easy to
  resolve.
2. Update your feature branch with the newest changes of your main branch often
  to keep your work up to date with the rest of the codebase. Conflicts will
  occur earlier in development and therefore have fewer conflicting changes.
3. Communicate to the other developers. Who is working on what? When should
  which feature go live? Do we have dependencies between our features? Other
  developers can also help you with conflicting changes which are maybe unclear.
4. Plan you features and released beforehand to prevent conflicts because of
  dependencies.

## Delete a file from the repository

<video controls="true" allowfullscreen="true">
    <source src="videos/04-remove.mp4" type="video/mp4">
</video>

- When you want to delete a file from the repository you also have to commit
  this "deletion" change as any other change.
- Be aware that once committed credentials or other sensitive data will still be
  part of your repository! If that commit already exists in a remote repository
  make sure to change your affected passwords, first. The proceed to remove
  those files from the repository completely. Have a look at these resources:
  - https://stackoverflow.com/a/872700
  - https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository


## Remote push

<video controls="true" allowfullscreen="true">
    <source src="videos/05-remote-push.mp4" type="video/mp4">
</video>

- So far, all of the operations we have done were on our local computer. When we
  want to publish our code changes for other developers to see we have to push
  our changes to a remote repository.
- Before any push, you should update your project (`Ctrl+T`). This can prevent
  conflicts during the push which otherwise can be resolved locally, first.
- When the push then succeeds your change is in the remote repository.
- You can see the states of the remote branches in the Git tab under "Remote".
  Also the tags next to commits (like "origin") can help you see the states of
  the remote branches.

## Remote pull

<video controls="true" allowfullscreen="true">
    <source src="videos/06-remote-pull.mp4" type="video/mp4">
</video>

- When you "Fetch all remotes" within PhpStorm you can see any external changes.
  Little arrow indicators next to your branch will show you that remote changes
  are ready for you to be pulled.
- With "Update your project" these changes will be merged into your local
  branch. If a conflict occurs, this can be resolved the same ways as mentioned
  before.

## Stash and shelf (conflict while checkout)

<video controls="true" allowfullscreen="true">
    <source src="videos/07-shelf-conflict.mp4" type="video/mp4">
</video>

- See "temporary commits" for more information.
- When you have local changes and need to check out another branch a conflict
  can occur:
  - Either, this file where you have changes does not exist
  - Or your local change cannot be merged automatically into the code of the
    checked out branch.
- PhpStorm will notify you when you want to check out a branch that "local
  changes will be overwritten by the checkout. PhpStorm will shelve these
  changes".
  - Then you can resolve the conflict or abort that merge. When you abort you
    will still have checked out the branch but your local changes are gone. No
    need to panic: You can still find the changes in the "non-modal commit
    interface > Shelf (on the top)". Under the "Uncommitted changes before
    Checkout" you can find these changes and unshelf them wherever you want.

## Stash and shelf (proactive to organize changes)

<video controls="true" allowfullscreen="true">
    <source src="videos/08-shelf-proactive.mp4" type="video/mp4">
</video>

- Instead of relying on the shelf to catch your uncommitted changes before a
  checkout you can also proactively use this concept to organize your commits
  and current work.
- Right-click your changed files in the non-modal commit interface and select
  "Shelve Changes...". This will be treated like a patch which can be applied at
  any moment.

## Tags

<video controls="true" allowfullscreen="true">
    <source src="videos/09-tagging.mp4" type="video/mp4">
</video>

- See "Tagging known commits" for more information.
- With the Git tab you can add a new tag to any commit you want. This can be
  used for release management or to highlight a specific event. The tag will
  also be listed in the commit information panel on the right side of the Git
  tab (Notice: not visible in demonstration video - next to "HEAD" and
  "master").
- When you now push commits to your remote repository make sure to check "Push
  tags" on the bottom of the push dialog window. It will also notify you of your
  pushed tags in the toast on the bottom right.
