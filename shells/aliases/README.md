# Aliases and Functions

These are independant bash aliases and function that can
be included into the interactive bash shell in any order.  
However, if there is is a dependancy, the shell will 
read files in numerical, then alphabetic order (e.g., name
earlier files 00-file.sh -- 99-file.sh).

## Description of some files

* ls - Figure out if we're running GNU ls, Mac ls, or SysV ls.  Then,
	 set colors along with a bunch of aliases.  These are:

	 ** ls - plain ls with color.  Sets GNU ls if around, otherwise,
		normal ls.
	** d - show directory listing with mods, date, size.  Basically,
	nicer ls -l
	** ll - 
	** l. -
	** l - 

* arch-cygwin - cygwin specific munges


vim:ts=4
