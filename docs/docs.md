## Introduction 

Welcome to the Veggieshell. This is my attempt at building a semi-portal 
shell environment that runs on most servers.  It has evolved over many
<s>years</s> decades and now finally moved it into git.  If
you have additions, suggestions or comments, send me a message. 

This environment is meant for the coder/admin to get up quickly, whether
running on Irix, Apollo, or something more modern.  It isn't meant to
be L33T, just good enough.  Ideally, you copy and use for your own purposes.
Alternatively, simply git clone veggieshell on your newly accessed OS.  
We try to be consistent, so if you update the files, it will still run.


## Conventions 

In this document, I'll use $HOME to mean your home dir
and $VEGGIE\_HOME to mean the veggieshell config dir, which should be
$HOME/.veggieshell.

## Usage 
    
*   Clone the veggieshell source tree from github.
*   Copy the veggieshell dir into your $HOME dir and rename it to be
    .veggieshell - you will still be able to perform git operations on 
	it with the new name.
*   The file $VEGGIE\_HOME/FileList contains a list of dot files that will be created
    in your home dir.  If your home dir currently has any of these files, 
	a backup will be made before the installer replaces them with symlinks
    into $HOME/.veggieshell
*   Run the init script by just typing 'sh ./SymLink.sh' or
    'sh ./.veggieshell/SymLink.sh'. The script will change the working directory
	to your $HOME dir and then create symlinks to the files.
*   Now, log out and back in or open a new window or open a new shell. You should now be
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

*   $VEGGIE\_HOME/personal/shells/vars - this file is run right after all
    environment and shell vars are set. Place your variable overrides and
    appendings in here.
*   $VEGGIE\_HOME/personal/shells/networks/$netname-vars - this overrides the
    above with specific variable for the current network.
*   $VEGGIE\_HOME/personal/shells/hosts/$hostname-vars - yet more fine grained
    control over variable on a per hostname basis.
*   $VEGGIE\_HOME/personal/shells/completions - this sets or overrides
    bash completions that you may wish to use.
*   $VEGGIE\_HOME/personal/shells/networks/$netname-alias - more completions for
    this network.
*   $VEGGIE\_HOME/personal/shells/hosts/$hostname-alias - more completions for
    this specific host.
*   $VEGGIE\_HOME/personal/shells/aliases - this sets or overrides the aliases that
    you may wish to use.
*   $VEGGIE\_HOME/personal/shells/networks/$netname-alias - more alias for this
    network.
*   $VEGGIE\_HOME/personal/shells/hosts/$hostname-alias - more alias for this
    specific host.
*   $VEGGIE\_HOME/personal/editors/vimrc - this personal file is load after the
    $VEGGIE\_HOME version of vimrc is run.
    

The only exception to not editing the personal files and directly
modifying the $VEGGIE\_HOME normal files might be for setting PATH. If you have
files in really weird places, you may have to add them to bashrc
directly.

## FAQ 

**Why symlinks?
**
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
> The same config works on RedHat 6.2, RedHat 7.1, Solaris 7, 
> Solaris 8, and Mac OS X. I'm sure it will work elsewhere, but test
> first.
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
> I have run this on bash 2.03, 2.04, and 2.05 - each has new
> features. The completion file has many munges for the point levels of
> bash. Please tell me if a munge is wrong for your particular version of
> bash. And someone please shoot the bash people for adding letters to
> the versioning 2.03, 2.03a, 2.05b? A parsing nightmare.
> 

****
> 
> 

## Todo and Obscure Ideas 
    
**twmrc
**
> 
> Long ago, twm was king. Then, everything from Window Maker to CDE
> to Enlightenment to whatever. All of the new items work well and make for
> beautiful windowing systems, but there is still a need for twm. When
> using VNC, you do not need all of the refinements and extraneous crap
> that other window managers give you. For VNC, you need both speed from
> light graphical overhead on the system and a visual environment that does not
> clutter the screen. Thus, we need a small and concise twm file. I appear to
> have lost my minimalist-but-pretty version, so if anyone can contribute, it
> would be useful.
> 

**a parallel cvs binary tree
**
> 
> Right now, the toolkit adds arch/$VEGGIE\_ARCH/bin and arch/scripts to the
> path. Since some scripts are nice to have, I also added conf/scripts
> which is on the path tool. A discussion about this whole script idea
> within the toolkit is needed. 
> 

**twmrc
**
> GNU dir_colors has obsoleted the ".ext" sequence and recommends "*ext"
> for the future.  Should we also upgrade and support this?  Is it worth the
> risk of breaking old machines?

****
> 
>

<!-- vim:syntax=md
-->
