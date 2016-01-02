# Aliases and Functions

These are independant bash aliases and function that can
be included into the interactive bash shell in any order.  
However, if there is is a dependancy, the shell will 
read files in numerical, then alphabetic order (e.g., name
earlier files 00-file.sh -- 99-file.sh).

## Description of some files

* ls - Figure out if we're running GNU ls, Mac ls, or SysV ls.  Then,
       set colors along with a bunch of aliases.  Readable numbers
       are used, like "337K" instead of "344822", for the file
       sizes.  Figures out GNU versus BSD coloring options.  These
       additional aliases are:
 + `ls` - plain ls, just with color.
 + `d`  - think "dir", shows directory listing with mods,
          date, size.  Basically, nicer ls -l  .
 + `l`  - narrow ls with sizes.
 + `ll` - narrow ls with all files, dotfiles, and sizes.
 + `l.` - narrow ls with sizes, but only showing dotfiles.  Only on bash.

* other-programs.sh - random other aliases and functions.

 + panhtml - pandoc with easy extra filters, great for quick docs
             that get included in other HTML files.  This replaces
             `&quot;` &rarr; "   `<ol style="..." >` &rarr; `<ol>` 
 + enscript - makes a really fancy set of settings, great for code printing.
 + more...

* arch-cygwin - cygwin specific munges.  This is a no-op on non-Cygwin.  No
  longer works very well.

* mail - functions for quickly mailing stuff.  This function needs updating for 
	the modern mail age of mime and other mailers.  Modern mailers cannot read 
	uuencoding.


vim: ts=4 sw=4 et filetype=markdown
