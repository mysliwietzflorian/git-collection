# Git internals - demonstration of Git objects

The following documentation assumes that this folder is the root of the
demonstration. All the file and directory paths are relative to the current
working directory.

## Preparation:

1. A linux environment should be used to execute the demo.
2. The folder `demo-repository` MUST exists in the demo directory.
3. The script file `demo.sh` MUST be executable. This bash script uses
   [github.com/paxtonhare/demo-magic](https://github.com/paxtonhare/demo-magic).
   This allows some commands to be executed and printed independently in a
   pretty way and ensures a deterministic behavior of the demo. Moreover, the
   following dependencies should be installed on your system:
   - `pv`: (pipe viewer) is used in the demo-magic script. It monitors the
     progress of data through a pipeline.
   - `pigz`: used for initial decompression of Git object content.
   - `man-db`: manpages are used within the demo to explain commands.    
4. `git init` must create a the new repository with the 'main' branch. See `git
   config --global init.defaultBranch [name]` for more information if any
   problems occur.
5. Open a new terminal window in the demo directory. This terminal watches all
    the file changes in the git repository during the demonstration. Execute the
    following commands: 
    - `cd demo-repository`
    - `watch -n 1 -d find . -type f`
6. Open a second terminal window. This one runs the `demo.sh` script which will
    execute some basic Git commands that demonstrate Git object behavior.
    Execute:
    - `./demo.sh`
7. Follow through the demo by pressing `<Enter>` (or `q` to exit man pages).
