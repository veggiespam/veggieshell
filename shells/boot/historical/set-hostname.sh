#
# It appears that modern OS X and Linux finally set these correctly.
# Thus, this code was removed from bashrc and saved here just in case.
# We may need this for a future OS.
#

# not all hostname programs are created equal,
# some return FQDN, others just hostname
hostname=`hostname | cut -d. -f 1`

if [ "$VEGGIE_ARCH" = "osx" ]; then
	netname=`domainname 2> /dev/null`
else
	# FIXME fix this....
	netname=`dnsdomainname 2> /dev/null`
	res=$?
fi

myuser=`who am i  | cut -d' ' -f1 | cut -d'!' -f2`
if [ "$VEGGIE_ARCH" = "osx" ]; then
	# FIXME: who -m ==> username ttyp4 May 9 21:15 (localhost)
	# CHANGED: who -m ==> username ttyp4 May 9 21:15

	#fromhost=`who -m | cut -f6`
	fromhost=`who -m | awk '{print $6}'`
	if [ -z "$fromhost" ]; then
		fromhost=localhost
		fromfqdn=localhost
	else
		fromhost=`who -m | cut -d\( -f2 | cut -d. -f1 | cut -d\) -f1`
		fromfqdn=`who -m | cut -d\( -f2 | cut -d\) -f1`
	fi
else
	# FIXME
	# WAS: who -ml ==> blahost!user  pts/0  May  9 21:15 (localhost.localdomain)
	# CHANGED: who -ml ==> -l is deprecated; plus format changed!
	#			user      pts/0        May 31 20:46 (192.168.1.102)
	# this doesn't work if there is no name, just IP!  ARGH!
	fromhost=`who -m --lookup | cut -d\( -f2 | cut -d. -f1`
	fromfqdn=`who -m --lookup | cut -d\( -f2 | cut -d\) -f1`
fi

# vim:ts=4:sts=4
