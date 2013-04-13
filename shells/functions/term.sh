
# TERM variable setup.  
# this file sets up $TERM, since it tends to get munged.  it tries to figure
# out compatable TERMs when yours is not found.  a common one is rxvt => xterm
# translations.

# our hope is that you never need this file, but it seems to be
# needed in many cases.  right now, it is disabled and none of my
# systems seems to need its extra magic.

return 

# since osx 10.{234} does wierd things with termcap, we just assume it is 
# set correctly and ignore it
if [ "$VEGGIE_ARCH" = "osx" -a "$VEGGIE_ARCHVER" > "6.5" ]; then
	return
fi

thisfile="$VEGGIE_HOME/shells/functions/term.sh"

#echo $TERM

# force termcap if necessary
#do_termcap=1

if [ -d /usr/share/terminfo ]; then
	terminfodir="/usr/share/terminfo"
elif [ -d /usr/share/lib/terminfo ]; then
	terminfodir="/usr/share/lib/terminfo"
else 
	# we need more location tests here

	# we cannot find terminfo, but, before we print an error,
	# test to see if the OS doesn't have even have terminfo
	case "$VEGGIE_ARCH" in
	osx)
		;;
	*)
		echo "WARNING: could not find terminfo dir, please add dirs to"
		echo "$thisfile"
		do_termcap=1
	esac
fi

if [ -z "$do_termcap" ]; then
	# most systems do it this way:
	# letter=`echo "$TERM" | cut -b1`
	# terminfofile="$terminfodir/$letter/$TERM"

	# but osx does some randomness $terminfodir/{00-99}/$TERM, so
	# we just compromise and use * which should work 99% of the time.
	terminfofile="$terminfodir/*/$TERM"
	if [ ! -f "$terminfofile" ]; then
		# we don't have a term info file, so do termcap
		do_termcap=1
	fi
fi

if [ ! -z "$do_termcap" ]; then
	if [ -f /etc/termcap ]; then
		# most of the planet
		termcapfile="/etc/termcap"
	elif [ -f /usr/share/misc/termcap ]; then
		# OS X 10.0 & 10.1
		termcapfile="/usr/share/misc/termcap"
	else 
		echo "WARNING: could not find termcap file, please add a search path to"
		echo "$thisfile"
		# just exit out of this file.  ugh, no terms.
		return
	fi
	in_termpcap=`grep "$TERM|" $termcapfile 2>/dev/null`

	# we need more location tests here
	if [ ! -z "$in_termcap"  ]; then
		# we cannot find the term entry in termcap (either), so do
		# a guess
#		case "$TERM" in
#		rxvt)
#			TERM=xterm
#			;;
#		*)
#			# add more case guesses and compatable ones here
#			echo "TERM type \"$TERM\" is unknown.  Please add an"
#			echo "alias to $thisfile"
#			;;
#		esac
		if [ "$TERM" == "rxvt" ]; then
			echo "TERM == rxvt"
			TERM=xterm
		else
			# add more case guesses and compatable ones here
			echo "TERM type \"$TERM\" is unknown.  Please add an"
			echo "alias to $thisfile"
		fi
	fi
fi

unset in_termcap do_termcap terminfofile terminfodir letter thisfile termcapfile

# vim:ts=4
