#
# DISPLAY used to get confused, so we had to recompute it.  However,
# hostname and netname eventually became unreliable.  Most modern
# systems now set DISPLAY correctly, so this should not be needed.
# Dependancy on the historical set-hostname.sh script.
#

# sometimes, the display var gets mucked up, especially when there is
# no DNS.  so, this sets 
#	DISPLAY=hostname:0.0	to :0
#	fromhost=localhost	to :0
#	blank DISPLAY		to fromhost:0

# FIXME **DISABLE THIS**  problem with vi and remote DISPLAY!!
mydisp=`echo $DISPLAY | cut -d: -f 1`
if [ "$mydisp" = "$hostname" ]; then
	# the d0 command is defined in x-stuff.sh
	d0
elif [ "$fromhost" = localhost ]; then
	d0
elif [ "$DISPLAY" = "" ]; then
	# this has the side effect of setting blank fromfqdn to :0, good.
	export DISPLAY="$fromfqdn:0"
fi
unset mydisp

