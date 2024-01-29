# Committing

## See staging status

```shell
git status
# or prettier
git status -s
# M: Modified   A: Added    ??: New untracked file
# Green: staged Red: unstaged
```

## Add files to the staging area

It is the stage we're proposing for the next commit

```shell
git add <file list>
```

note: file list can include wildcards * or . (stage everything). To be used
wisely

### See diff

You can see the difference between local and staged repositories

```shell
git diff
```

Use GUI for prettier and easier understanding

### Rename/move files

```shell
git mv <source file> <destination file>
```

Notes:

- be careful not to commit too large, try to commit often as checkpoints.
- try not to mix changes in a commit
- by convention use present tense

## Commit

After reviewing the files, if everything is good you can commit them to permanently
store them in the repository

```shell
git commit -m "<Message>"
# or for more detailed description
git commit 
# This opens an editor in which you can write a short description and a longer 
# description with more details
```

## History

```shell
git log
```

## inspect a commit

```shell
git show <commit ref>
```

to see n commits prior the current commit use "HEAD~\<n>" as commit ref.

## Ignore files

Write a *.gitignore* file as provided in this repository. You can find templates
on [github](https://github.com/github/gitignore) for several languages.

### Remove files from the staging area/index

```shell
git rm --cached <file>
```

## Restore files

Restore all the changes from the staging area to the working area.

```shell
git restore --staged <file name>
```

Restore deleted files from the previous version (n)

```shell
git restore --source=HEAD~<n> <file name>
```

## Remove untracked files

```shell
git clean
```

## Upload to remote repository

```shell
git push
```
