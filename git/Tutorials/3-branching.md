# Branching

Branches allows to work on mutliple things at the same time. It copies a version
of the history so that you can add features to a copy instead of adding it to
the main branch. Then you can merge it into the main branch once the feature is
done. This allows not to have work in progress on main branch/project.

```shell
git branch <branch name>
```

## Change branch

```shell
git checkout <branch name>
```

## Merge branches

To combine all the changes from different branches into one branch. Merge
command creates the merge commit on top of the current branch.

```shell
git merge <branch name> -m <message>
```

### Merge conflicts

When merging, if both branches have code modifications on the same code, git
doesn't merge automatically and you need to manually merge these parts of code.
