# Git internals - demonstration of Git objects

The following documentation assumes that this folder is the root for the
demonstrations. All the file and directory paths are relative to the current
working directory.

## Preparation:

1. A linux environment should be used to execute the demo. Docker support might
   come in the future.
2. The folder `demo-repository` MUST exists in the demo directory.
3. The script files MUST be executable. These bash scripts use
   [github.com/paxtonhare/demo-magic](https://github.com/paxtonhare/demo-magic)
   in the background and allows some commands to be executed and printed
   independently in a pretty way and ensures a deterministic behavior of the
   demo. Moreover, the following dependencies should be installed on your
   system:
   - `git`: of course. As well as many further default unix tools.
   - `pv`: (pipe viewer) is used in the demo-magic script. It monitors the
     progress of data through a pipeline.
   - `pigz`: used for the raw decompression of Git object content.
   - `man-db`: manpages are used within the demo to explain commands.

### Running

1. Open a new terminal window in the `demo-repository` folder. This terminal
    watches all the file changes in the Git repository during the demonstration.
    Execute the following commands: 
    - `cd demo-repository`
    - `watch -n1 -d find . -type f`
2. Open a second terminal window. This one runs the differnt scripts which will
    execute some basic Git commands that demonstrate Git object behavior.
    Execute for example:
    - `./01-git-objects.sh`
3. Follow through the demo by pressing `<Enter>` (or `q` to exit man pages).
