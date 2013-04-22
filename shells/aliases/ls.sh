# ls alias setup
#
# Test for gnu ls, mac ls, set colors, set aliases.  
#
# These aliases are set: plain "ls" with color options   and   l   l.  ll   d

veggieboot_lsfile=$TMPDIR/veggieboot_ls_$$

if [ "$VEGGIE_ARCH" = "osx" ]; then
	# We test OSX first, since we may wish to override with GNU ls settings.

	# For OSX, -G does color like GNU ls, but without many
	# enhancements.  To set the colors, see 'man ls' on
	# plain-raw OS X and set the environment var here.
	# The chosen colors could use refinement, but they are close
	# to matching the GNU dircolors configuation above.
	export LSCOLORS=GxgxfxDxcxDxDxDbDbDbDb
	alias ls='ls -G'

	# Some point between 10.4 & 10.7, -o became supported for ls -l!
	alias d='ls -Flho'
	alias ll='ls -AhsF'
	alias l='ls -hsF'

	# mac ls is still useful for extended attributes, so alias the old version
	alias mls='/bin/ls -G'
	alias macls='/bin/ls -G'
fi


# test for GNU ls on the path, and set dir colors
# some systems use gls instead of ls.  OS X brew is one such example.
ls --version random_string_4231784713289fdjsklfjlsaFDSAFASD > $veggieboot_lsfile.ls 2>&1
gls --version random_string_4231784713289fdjsklfjlsaFDSAFASD > $veggieboot_lsfile.gls 2>&1

veggieboot_ls=`cat $veggieboot_lsfile.ls | grep "Free Software Foundation"`
veggieboot_gls=`cat $veggieboot_lsfile.gls | grep "Free Software Foundation"`

if [ ! -z "$veggieboot_ls" -o ! -z "$veggieboot_gls" ]; then
	# we are using GNU ls

	veggieboot_dc=`type -P dircolors`
	veggieboot_gdc=`type -P gdircolors`

	if [ ! -z "$veggieboot_dc" -o ! -z "$veggieboot_gdc" ]; then
		# this sets $LS_COLORS for colors from dircolors or gdircolors
		if [ -e "$VEGGIE_HOME/utils/dircolors" ]; then 
			eval `${veggieboot_dc:-$veggieboot_gdc} --bourne-shell "$VEGGIE_HOME/utils/dircolors"`
		else
			eval `${veggieboot_dc:-$veggieboot_gdc} --bourne-shell `
		fi
	fi

	# are we using gls or just ls
	if [ ! -z "$veggieboot_ls"  ]; then
		alias ls='ls --color=auto'
	else
		alias ls='gls --color=auto'
	fi

	# h is GNU & BSD for 'human numbers in -l', so, 1.6M not 1648576
	alias d='ls -Flho'
	alias ll='ls -AhsF'
	alias l='ls -hsF'
fi

if [ -z "$veggieboot_ls" -a -z "$veggieboot_gls" -a  "$VEGGIE_ARCH" != "osx" ]; then
	# we're not using osx and don't have gnu ls, so the defaults
	# -h not supported on sys V
	alias d='ls -Flo'
	alias ll='ls -AsF'
	alias l='ls -sF'
fi

# special glob in this alias only works in bash
if [ ! -z "$BASH_VERSION" ]; then
	alias l.='ll -d . .?* '
fi

rm $veggieboot_lsfile.ls $veggieboot_lsfile.gls
unset veggieboot_ls veggieboot_gls veggieboot_lsfile veggieboot_dc veggieboot_gdc

# vim:ts=4:sw=4
