# Veggieshell

## Introduction 

Welcome to Veggieshell, the semi-portal shell environment that
runs on most Unix-like servers.  Designed to be installed into
your home dir, it contains a comprehensive set of dot-files for
quickly getting new machines running.  Veggieshell supports
remote software updates of the dot-files for bug fixes or feature
enhancements.  Veggieshell has evolved over many years, adding
support for newer versions of common Unix utilities, while still
maintaiing compatability with older machines. 

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
	it with the new name.
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
*   $VEGGIE\_HOME/personal/shells/completions/* - this sets or overrides
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
Subversion repository.  The git version can be found on github,
but it is in beta form.  Once v3.0 is finalized, it will be
branched into stable and experimental braches - be sure to check
out the stable ones for production systems.


## FAQ 

### Why symlinks?

It makes updating easier.  You can `git pull` to obtain the
latest version and your $HOME/.dotfile will point to the updated
git version.  


### Can I re-run SymLink.sh without fear of it doing bad things?

Yes, but make sure Before-Veggieshell directory is empty.  Any
existing links or files will be placed into the
Before-Veggieshell folder.  If that folder already contains
files, then files will not be copied/linked and the originals
will remain.


### What have you tested this on?

The same config has been tested  on RedHat 6.2, RedHat 7.1,
Solaris 7, Solaris 8, Debian, and Mac OS X. It should work
elsewhere, but test first.  There was some of bit-rot on the
original codebase; there needs more testing on Cygwin.  Some
older versions of various OSes many also need testing.


### Do I have to use bash?

No; you can (probably) use any Bourne derivative shell, including
ksh, zsh, and sh.  I'm interested in hearing what minor tweaks may
be needed for other shells.  What this does not work with is csh
and tcsh - and no support for them will be forthcoming, nor will
Veggieshell work with AdventureShell.


### This does not work on bash version x.yy.

Bash 2.03, 2.04, 2.05 contaned new features for each point level
and the completion files are just ignored to avoid the many
munges.  When running on bash 3.x, less munging is needed and
Veggieshell works fine.  No features of bash 4.x are used.


### Why don't use use the full bash-completion project?

The complete Bash-Completion project archive is 20MB;
Veggieshell is only 1MB.  Our goal "good enough", not "kitchen
sink".  Per the FAQ, Bash-Completion assumes you're running Bash
4.1 or newer; most people are not.  If you want more completions,
add to your personal dir.  We may, however, use some of their
files where noted if they work with older bash versions.



vim: ts=4 sw=4 et filetype=markdown
