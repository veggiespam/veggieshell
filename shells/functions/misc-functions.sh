
#
# write a message to somebody
# usage: tell person some text here
#
function tell () {
	set -H
	set -f
	tell_target="$1"
	shift
	tell_mesg="$*"
	echo $tell_mesg | write $tell_target
	set +f
	set +H
	unset tell_target tell_mesg
}

# 
# put the shell into an infinate loop to prevent log offs
#
function pause () {
	while [ 1 = 1 ] ; do
		date
		uptime
		sleep 300
	done
}

#
# converts a list of filenames to lowercase
# usage: tolower *.JPG *.GIF
#
function tolowername () {
#	if [ $# = 0 ]; then
#		echo 'No input files given; usage: tolowername [*.JPG] [SomeFile.TXT] [...]'
#		return 1
#	fi
#	perl -e 'while ($_=pop @ARGV){ if ($_ ne lc($_)){ rename $_, lc($_)}};' $*

	for upcase in $@; do
		locase=`echo $upcase | tr A-Z a-z`
		if [ "$locase" != "$upcase" ]; then
			mv "$upcase" "$locase"
		fi
	done
	unset upcase locase
}

#alias tolowername perl -e 'if ($#ARGV == 0) { print "No input files given; usage: tolowername [*.JPG] [SomeFile.TXT] [...]\n" return 0 }; while ($_=pop @ARGV){ if ($_ ne lc($_)){ rename $_, lc($_)}};' 

#
# renames a group of files via a regexp expression
# BUGS: does not handle filenames with spaces too well.
#
function regex_rename () {
	if [ $# -lt 2 ]; then
		echo "Usage: regex_rename [-s] \'pattern\' files"
		echo "    patten must be a fully qualified s/search/replace/g string."
		echo "    flag -s mean to only pring what we'd do, not run it."
		return 0
	fi
	reg_pat=$1
	shift
	if [ "$reg_pat" = "-s" ]; then
		reg_show=echo
		reg_pat=$1
		shift
	fi
	for reg_file in $*; do
		reg_new=`echo ${reg_file} | sed "${reg_pat}"`
		echo regnew: \"$reg_new\"
		if [ \( ! -z "${reg_new}" \) \
			-a \( "${reg_file}" != "${reg_new}" \) ]; then
			$reg_show mv "${reg_file}" "${reg_new}"
		fi
	done
	unset reg_pat reg_new reg_file reg_show
}

# vim:ts=4
