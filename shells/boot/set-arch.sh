# set the arch in a way that is meaning to the veggieshell, but necessarily as
# useful to other people.  this converts annoying strings to nice ones.
# we don't use the three-os-tupples since they are annoying, verbose, and
# how many times do you actually use microsoft-darwin-vax?  bah, just use
# the systems that you'd most likely log in to (or, atleast the ones i do).
#
#       CYGWIN_{98|95|NT}_{4.00|4.10|etc} ==> cygwin
#       SunOS                   ==> sun	
#       Any BSD                 ==> bsd			
#       Darwin                  ==> osx
#       Linux on x86            ==> linux
#       Linux on ppc            ==> yellowdog	
#
#			* not tested in years on some platforms...
#
# Note: I found on some platforms, that OSTYPE cannot be trusted.  This is
# especially true if you're not running bash.  Or a version of bash that 
# didn't support OSTYPE.

VEGGIE_ARCH=`uname -s | sed \
        -e s/CYGWIN.*/cygwin/ \
        -e s/SunOS/sun/ \
        -e s/Darwin/osx/ \
        -e 's/.*[Bb][Ss][Dd].*/bsd/' \
        -e s/Linux/linux/`

export VEGGIE_ARCH

# since "linux" means alot of things, clairify it:
if [ "$VEGGIE_ARCH" = "linux" ]; then
        VEGGIE_ARCH=`uname -m | sed \
                -e s/.*86/linux/ \
                -e s/ppc/yellowdog/ `
elif [ -z "$VEGGIE_ARCH" ]; then
	echo "WARNING: unknown architecture, Veggieshell may not run correctly."
fi


# now fetch the VEGGIE_ARCHVER ---> the OS version
VEGGIE_ARCHVER=`uname -r`
export VEGGIE_ARCHVER

# OS X has different versions, so let's convert to Apple's versions
# We can use the built-in $OSTYPE variable since it will be defined.
if [ "$VEGGIE_ARCH" = "osx" ]; then
    if [ "$OSTYPE" = "darwin14" ]; then 
        VEGGIE_ARCHVER="10.10" ;	    		# Yosemite
    if [ "$OSTYPE" = "darwin13" ]; then 
        VEGGIE_ARCHVER="10.09" ;				# Mavericks
    elif [ "$OSTYPE" = "darwin12" ]; then 
		VEGGIE_ARCHVER="10.08" ;				# Mountain Lion
	elif [ "$OSTYPE" = "darwin11" ]; then 
		VEGGIE_ARCHVER="10.07" ;				# Lion
	elif [ "$OSTYPE" = "darwin10.9" ]; then 
		VEGGIE_ARCHVER="10.06" ;				# Snow Leopard
	elif [ "$OSTYPE" = "darwin9.0" ]; then 
		VEGGIE_ARCHVER="10.05" ;				# Leopard

		# missing a few...

	elif [ "$VEGGIE_ARCHVER" = "6.6" ]; then
		VEGGIE_ARCHVER="10.02" ;				# Jaguar
	fi
fi

# vim:ts=4:et:sw=4:syntax=sh
