# node-init.sh User Guide

## Purpose

I got irked by having to go through a set of repetitive tasks when starting Node.js projects.

1.  Making a new directory
2.  Moving into it
3.  Initializing the node package.json file
4.  Initializing the git repo
5.  Creating a .gitignore to avoid commiting node_modules

This script does all those for you so you can just get to work, while running some logic to protect you from bad project names, or accidental overwrites.

## Requirements

You need the following on your machine:

- Node.js
- git
- bash (Works with Git bash on Windows)

_Note_: I have tested this in bash version 4, but not in others. Let me know if you have issues with other versions.

## Usage

The script takes one argument, the relative path to the new project, the last segment of which serves as the project name.

Example:

```
node-init.sh ../new-project
```

Outcome: Creates a sibling to the current working directory, and the name of the node project will be "new-project". The script uses `npm init --yes` to create a default package.json, which you can later edit faster in an IDE if you know what you're doing, or which you can leave alone if you're a beginner.

**_Pro-Tip_**:
If you invoke the script using the `source` command, the script will take you to the new project, not merely create it, even if the relative path was complicated.
Example:

```
Vip@SIKANDER MINGW64 ~/vip/at/ron
$ source node-init.sh ../../truly/rules
Creating directory: /c/Users/Vip/vip/at/ron/../../truly/rules and moving to it...
Wrote to C:\Users\Vip\vip\truly\rules\package.json:
.
. (contents of package.json show up here)
.
Initialized empty Git repository in C:/Users/Vip/vip/truly/rules/.git/

Vip@SIKANDER MINGW64 ~/vip/truly/rules (master)
$
```

## Protective Features

Warnings will be issued for the following cases, and the script will return:

- no argument supplied
- argument contains spaces
- multiple arguments supplied

Following Node naming conventions, if the supplied argument has uppercase letters, they will be converted to lowercase and that name will be used.

If you attempt to write into a directory that already exists, the script will prompt you for permission. Example:

```
Vip@SIKANDER MINGW64 ~/vip/truly
$ source node-init.sh rules
Creating directory: /c/Users/Vip/vip/truly/rules and moving to it...
Directory 'rules' Exists! Proceed anyway?
Y(es)/N(o), Enter defaults to N: Jam
I didn't understand your response, 'Jam'
Y(es)/N(o), Enter defaults to N: yes
OK, writing into rules
bash: cd: rules: No such file or directory
Wrote to C:\Users\Vip\vip\truly\rules\package.json:
.
. (package.json is displayed here)
.
Reinitialized existing Git repository in C:/Users/Vip/vip/truly/rules/.git/

```
