# arch-backup

Scripts to automate backing up my Arch-based workspace.

The long-awaited sequel to [arch-setup](https://github.com/bradendubois/arch-setup).

## Description

Backs up dotfiles and makes a list of all installed AUR packages.

These scripts are written to run in ``bash``, and work on an Arch-based distro, though I believe they could be modified for most other \*NIX platforms. 

## Requirements

- Arch-based OS (tested on Manjaro) as a list of all packages installed via the [AUR]() will be generated.
  - This file could be used with [arch-setup](https://github.com/bradendubois/arch-setup) so as to reinstall all these packages on a new machine.

### Backup / Run

Assuming your working directory is the root of ``arch-backup``:

```bash
./backup.sh target
```

or

```bash
sh backup.sh target
```

or

```bash
. backup.sh target
```

Where ``target`` is the destination to which the backup will be created

## Configuration

**These are configurable from ``config.sh``**

### Directories

- Directories to backup
- This is the set of directories that *may* exist on the user's machine and will be backed up. 
- **Default**: ``directory_list.txt`` contains the list of directories to backup.
  - Add a directory to the list to back it up, or comment out a directory with a leading ``#``.

### Files

- Files to backup
- This is the set of files that *may* exist on the user's machine and will be backed up. 
- **Default**: ``file_list.txt`` contains the list of files to backup.
  - Add a file to the list to back it up, or comment out a file with a leading ``#``.

### Preferences

- Preferred color for formatting text
  - ``$default``
  - This is the preferred color for formatting/coloring text in the helper function ``announce``, which is located in ``config.sh``.
  - **Default**: `default`='\033[1;34m' (a nice shade of blue)
