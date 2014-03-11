# Veggieshell

## Introduction 

Welcome to Veggieshell, the semi-portal shell environment that
runs on most Unix-like servers.  Designed to be installed into
your home dir, it contains a comprehensive set of dot-files for
quickly getting new machines running.  Veggieshell supports
remote software updates of the dot-files for bug fixes or feature
enhancements.  Veggieshell has evolved over many years, adding
support for newer versions of common Unix utilities, while still
maintaining compatability with older machines. 

## Philosophy

Veggieshell is meant for the coder/admin to get up quickly, whether
running on Irix, Apollo, or something more modern.  It isn't meant to
be L33T, just good enough.  Veggieshell supports two methods of
installation: linked with the repository (e.g., github) or copied
and unlinked.

Via the linked methond, `git clone veggieshell` on a new
account/machine and `git pull` updates for enhancements or bug
fixes.  The system can be customized to a small degree without
editing any of the master files, so updates to veggieshell won't
wipe out any personization. 

Veggieshell is meant to run on many systems with different
versions of bash, vim, etc.  As such, checks are made before
version specific configuration is run.  

## Installation 

In this document, $HOME refers to your home dir
and $VEGGIE\_HOME is veggieshell installation dir, which should be
$HOME/.veggieshell.
    
*   Clone the veggieshell source tree from github, this can be done with
    `git clone https://github.com/veggiespam/veggieshell`.
*   Copy the veggieshell dir into your $HOME dir and rename it to be
    .veggieshell - you will still be able to perform git operations on 
	the directory with the new dot-veggieshell name.
*   The file $VEGGIE\_HOME/FileList contains a list of dot files
    that will be created
    in your home dir.  If your home dir currently has any of these files, 
	a backup will be made before the installer replaces them with symlinks
    into $HOME/.veggieshell.
*   Run the init script by typing `sh ./.veggieshell/SymLink.sh`.
    The installer script will change the working directory
	to your $HOME dir and then create symlinks to the files.
*   Now, log out and back in or open a new window or a new shell.
    You are now be using Veggieshell.


## Customizing the Personal Files 

Rather than edit the dot-files directly, such as bashrc, add
custom or machine specific settings to the $VEGGIE\_HOME/personal/
folder.  The "personal" dir pretty much mirrors the $VEGGIE\_HOME
directory tree, with each dot-file initializing, then reading
your customized dot-file. 

These files are run (if they exist) to override the $VEGGIE\_HOME
settings.  This toolkit comes with sample-personal which you can
copy and rename as $VEGGIE\_HOME/personal as a starting point.
Some configuration options include:

*   $VEGGIE\_HOME/personal/shells/hosts/$hostname-bashrc - yet more fine grained
    control over variable on a per hostname basis.
*   $VEGGIE\_HOME/personal/shells/completions/ *  - this sets or overrides
    bash completions that you may wish to use.
*   $VEGGIE\_HOME/personal/shells/hosts/$hostname-alias - more completions for
    this specific host.
*   $VEGGIE\_HOME/personal/shells/aliases - this sets or overrides the aliases that
    you may wish to use.
*   $VEGGIE\_HOME/personal/editors/vimrc - this personal file is load after the
    $VEGGIE\_HOME version of vimrc is run.

More customization information is shown in the documentation in the
personal directory.

## Versioning and Braches

The older versions of Veggieshell are found on the private
Subversion repository and Github hosts the latest software..
At some point, v3.0 will be branched into stable
and experimental trees - be sure to check
out the stable ones for production systems.


## More docs

*   The [semi-wonderful FAQ](docs/FAQ.md)
*   Random [Future Ideas](docs/FutureIdeas.md)
*   Legal [License](docs/LICENSE.txt) Docs
*   The [Run-Once](run-once/README.md) folder is manually run
*   Shell readme for [aliases](shells/aliases/README.md)
*   Veggieshell's [bootup/login](shells/boot/README.md) process
*   Bash [completions](shells/completions/README.md)
*   General [utils](utils/README.md) readme

vim: ts=4 sw=4 et filetype=markdown
