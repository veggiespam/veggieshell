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
ksh, zsh, busybox, and sh.  I'm interested in hearing what minor tweaks may
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
v4.1 or newer; most people are not.  If you want more completions,
add to your personal dir.  We may, however, use some of their
files where noted if they work with older bash versions.



vim: ts=4 sw=4 et filetype=markdown
