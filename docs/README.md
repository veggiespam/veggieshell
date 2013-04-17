# Veggieshell

## Introduction 

Welcome to Veggieshell, semi-portal shell environment that runs
on most Unix-like servers.  It has evolved over many years and
now finally moved it into git.  If
you have additions, suggestions or comments, send me a message. 

This environment is meant for the coder/admin to get up quickly, whether
running on Irix, Apollo, or something more modern.  It isn't meant to
be L33T, just good enough.  Ideally, you copy and use for your own purposes.
Alternatively, simply `git clone veggieshell` on a new machine and 
`git pull` updates which contain any enhancements or bug fixes.
We try to be consistent, so if you update the files, it will still run.


## Conventions 

In this document, $HOME refers to your home dir
and $VEGGIE\_HOME is veggieshell installation dir, which should be
$HOME/.veggieshell.

## Usage 
    
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
*   Run the init script by just typing `sh ./.veggieshell/SymLink.sh`.
    The installer script will change the working directory
	to your $HOME dir and then create symlinks to the files.
*   Now, log out and back in or open a new window or a new shell. You should now be
    using Veggieshell.
*   Edit the files as you please, but make sure to send me suggestions.
*   For the shell scripts however, you have some added flexibility.
    Rather than editing the files directly, you can add your custom or
    machine specific settings to $VEGGIE\_HOME/personal/\* files. The "personal" dir
    pretty much mirrors the $VEGGIE\_HOME directory tree. See below in this file
    for more information.
    

## Customizing the Personal Files 

In $VEGGIE\_HOME/personal, there are some files you can edit or create.
These files are run (if they exist) to override the $VEGGIE\_HOME settings.
This toolkit comes with sample-personal which you can copy or symlink to
the name $VEGGIE\_HOME/personal as you please. The files read by the toolkit
are:

*   $VEGGIE\_HOME/personal/shells/hosts/$hostname-vars - yet more fine grained
    control over variable on a per hostname basis.
*   $VEGGIE\_HOME/personal/shells/completions - this sets or overrides
    bash completions that you may wish to use.
*   $VEGGIE\_HOME/personal/shells/hosts/$hostname-alias - more completions for
    this specific host.
*   $VEGGIE\_HOME/personal/shells/aliases - this sets or overrides the aliases that
    you may wish to use.
*   $VEGGIE\_HOME/personal/shells/hosts/$hostname-alias - more alias for this
    specific host.
*   $VEGGIE\_HOME/personal/editors/vimrc - this personal file is load after the
    $VEGGIE\_HOME version of vimrc is run.
    

The only exception to not editing the personal files and directly
modifying the $VEGGIE\_HOME normal files might be for setting PATH. If you have
files in really weird places, you may have to add them to bashrc
directly.

## Philosophy



## FAQ 

### Why symlinks?  **
> 
> It makes updating easier. If you have many accounts and you
> customize them all, you can keep a master on one machine and just
> tar/untar the conf directory onto each machine to keep everything up to
> date. 
> 

**Can I re-run SymLink.sh without fear of it doing bad things?
**
> 
> Yup. So long as you didn't do anything weird and unlink the files
> and put a real file there.
> 

**What have you tested this on?
**
> 
> The same config works on RedHat 6.2, RedHat 7.1, Solaris 7, Solaris 8,
> Debian, and Mac OS X. I'm sure it will work elsewhere, but test first.
> 

**Do I have to use bash?
**
> 
> No, you can (probably) use any Bourne derivative shell, including
> ksh, zsh, and sh. I'm interested in hearing what minor tweaks may be
> needed for other shells. What this does not work with is csh and tcsh -
> and no support for them will be forthcoming. (Nor will this work with
> advsh :-)
> 

**This does not work on bash version x.yy.
**
> 
> Bash 2.03, 2.04, 2.05 contaned new features for each point level and the
> completion files are just ignored to avoid the many munges.  When running on
> bash 3.x, less munging is needed and Veggieshell works fine.
> 

** Why don't use use the full bash-completion project?
**
>  The complete Bash-Completion project archive is 20MB.  Veggieshell is only
>  1MB.  Our goal "good enough", not "kitchen sink".  Per the FAQ,
>  Bash-Completion assumes you're running Bash 4.1 or newer; most people
>  are not.  If you want more completions, add to your personal dir.  We
>  may, however, use some of their files where noted if they work with 
>  older bash versions.

## Todo and Obscure Ideas 
    
**a parallel cvs binary tree **
> 
> Right now, the toolkit adds arch/$VEGGIE\_ARCH/bin and arch/scripts to the
> path. Since some scripts are nice to have, I also added conf/scripts
> which is on the path tool. A discussion about this whole script idea
> within the toolkit is needed. 
> 

vim: ts=4 sw=4 et filetype=markdown
