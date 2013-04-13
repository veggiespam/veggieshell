# vim:ts=4

# ls alias setup. 
# since we have to test for gnu ls and a few other
# things, we put all of this in a separate file.

# test for GNU ls on the path, and set dir colors
ls --version random_string_4231784713289fdjsklfjlsaFDSAFASD > /tmp/tmp_ls_$$ 2>&1
ls_ver_tmp=`cat /tmp/tmp_ls_$$ | grep "Free Software Foundation"`
if [ ! -z "$ls_ver_tmp" ]; then
	# we are using GNU ls

	if [ -e "$VEGGIE_HOME/utils/dircolors" ]; then 
		# this sets $LS_COLORS for colors
		eval `dircolors --bourne-shell "$VEGGIE_HOME/utils/dircolors"`
	fi
	alias ls='ls --color=auto'
	# h is GNU & BSD for 'human numbers in -l', so, 1.6M not 1648576
	alias d='ls -Flho'

elif [ "$VEGGIE_ARCH" = "osx" ]; then
	# For OSX, -G does color like GNU ls, but without many
	# enhancements.  To set the colors, see 'man ls' on
	# plain-raw OS X and set the environment var here.
	# The chosen colors could use refinement, but they are close
	# to matching the dircolors above.

	export LSCOLORS=GxgxfxDxcxDxDxDbDbDbDb

	alias ls='ls -G'
	# in OSX/BSD ls, -o does *not* mean "no groups"
	alias d='ls -Flh'

else 
	# otherwise, all system 5 ls's will have -o mean "no groups"
	alias d='ls -Flo'
fi

# special glob in this alias only works in bash
if [ ! -z "$BASH_VERSION" ]; then
	alias l.='ls -Fd .[a-zA-Z0-9]* '
fi

alias ll='ls -AsF'
alias l='ls -sF'

rm /tmp/tmp_ls_$$
unset ls_ver_tmp
