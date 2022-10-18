# Ignoring files

You can prevent the unintentional staging and committing of a file with a
`.gitignore` file. Each line in that particular file specifies a glob pattern
that will be ignored from being versioned. You can also have multiple
`.gitignore` files on different directory levels. A simple example could look
like the following:

```bash
/logs/*
!logs/.gitkeep
/tmp
*.swp
```

This ignores all all files in `logs` directory (excluding a `.gitkeep` file),
the whole `tmp` directory and all files with `*.swp`.

## Which files to ignore?

- **Credentials!**
- Files downloaded with package managers
- Generated files
- Operating system files
- Temporary files, logs, and cache

Have a look at https://www.toptal.com/developers/gitignore/ when generating
templates yourself. For further information also have a look here:
https://git-scm.com/docs/gitignore.
