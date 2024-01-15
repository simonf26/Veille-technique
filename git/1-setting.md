# Setting

## Git Settings

### Name

```shell
git config --global user.name "Simon Frémont"
```

### Email

```shell
git config --global user.email simon.fremont26@gmail.com
```

### Default Editor

If using visual studio:

```shell
git config --global core.editor "code --wait"
```

Set the editors settings:

```shell
git config --global -e
```

### Line ending

Windows:

```shell
git config --global core.autocrlf true
```

Linux/Mac:

```shell
git config --global core.autocrlf input
```

### Levels

Levels are set to apply settings on different ranges

- System: all users of the current computer
- Global: all repositories of the current user
- Local: current repository/folder

### Start a project

Get in the project folder

```shell
git init
```