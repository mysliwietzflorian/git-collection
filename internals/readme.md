# Git internals - demonstration of Git objects

The following documentation assumes that this folder is the root of the
demonstration. All the file and directory paths are relative to the current
working directory.

## Preparation:

1. The folder `demo-repository` MUST exists in the demo directory.
2. The script file `demo.sh` MUST be executable. This bash script has a
   dependency to **github.com/paxtonhare/demo-magic**. This allows some commands
   to be executed and printed independetly in a pretty way and ensures a
   deterministic behavior of the demo.
3. Open a new terminal window in the demo directory. This terminal watches all
    the file changes in the git repository during the demonstration. Execute the
    following commands: 
    - `cd demo-repository`
    - `watch -n 1 -d find . -type f`
4. Open a second terminal window. This one runs the `demo.sh` script which will
    execute some basic Git commands that demonstrate Git object behavior.
    Execute:
    - `./demo.sh`
5. Follow through the demo by pressing `<Enter>` (or `q` to exit man pages).
