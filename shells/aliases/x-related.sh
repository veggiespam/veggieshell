
# run tail -f on a file in a new window
function xtail () {
	file=$1
	$veggie_term -fn 6x13 -geometry 80x40 -bg LightSeaGreen -fg Black \
		-name "tailing $file" -title "tailing $file" -e tail -f $file &
}

# 
# changes the title of an xterm or OS X Terminal Window
#
function xtitle () {
	MESG="$*"

	# warning, the next line contains escape chars.
	# ^[]1;STRING^G does icon, 2 does title bar
	echo ]2\;${MESG}
	echo ]1\;${MESG}

	# these don't work on a telnet'd xterm like the those above do
	# these would be nicer so your screen doesn't beep when you 
	# run 'set' or try paper print this function.
	#echo -e "\033]2;${MESG}\007"
	#echo -e "\033]1;${MESG}\007"

	# now, disable any automatic title bar replacements like in
	# redhat as the point of xtitle is to keep the same title.
	unset PROMPT_COMMAND
}

# 
# changes the title of an xterm with the same name over and over.
#
function ytitle () {
	MESG="$*"
	xtitle $MESG $MESG $MESG $MESG $MESG $MESG $MESG $MESG
}

#
# set display to current machine
#
alias d0='export DISPLAY=:0'

# vim:ts=4
