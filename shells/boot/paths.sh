#
# paths.sh
#
# this shell sourceable file contains items that are related to paths,
# colon paths, etc
#
#
# CP and postCP needs fixing on windows!
#

# calling prePATH and such does not work with c:/Program Files 
# paths.  so, call cygcolon first.


# a handy cygwin doo-dad.  This converts c:/vim/vim63 into
# /cygdrive/c/vim/vim63 .  not foolproof, so it might
# die in many cases, like used with PATHs.
# it also does c:/program files to program\ files
if [ $VEGGIE_ARCH = "cygwin" ]; then
	function cyg_path_munge () {
		if [ ! -z "`echo "$*" | grep '^.:'`" ]; then
			drive=`echo $* | sed 's/:.*$//g'`
			pp=`echo $* | sed 's/^.://g'`
			echo "`echo "/cygdrive/$drive$pp" | sed 's/ /\\\\ /g'`"
		else 
			echo "`echo "$*" | sed 's/ /\\\\ /g'`"
		fi
	}
else
	function cyg_path_munge () {
		echo $*
	}
fi


# converts spaces to colons.  basically used to convert a bunch of
# space separated filenames to a colon path.  for example:
#
# $x=spacecolon `find ~/project/javajars`
#    -> or even just $x=~/project/javajars/*.jar
# CLASSPATH="$CLASSPATH:$x"
#
# of course, that doesn't work on cygwin.  Ugh!
#
function spacecolon () {
    local spacecolonret=$1
  shift
  for i in $*; do
#    if [ -e "$i" ]; then 
      spacecolonret="$spacecolonret:$i"
#	fi
  done
  echo $spacecolonret
}


# post_path PATH /usr/bin would append $PATH as needed.  This works
# for MANPATH, LD_LIB_PATH, CLASSPATH, etc.  Question: does ${! work
# on non-bash shells?
function post_path () {
    local pathname=$1
	shift
	if [ -z "${!pathname}" ]; then
		eval $pathname=`spacecolon $*`
	else
		#tttt=eval $`echo $pathname`
		#eval $pathname=`spacecolon "$tttt" $*`
		eval "$pathname=\"${!pathname}:`spacecolon $*`\""
	fi
	export $pathname
}

function pre_path () {
    local pathname=$1
	shift
	if [ -z "${!pathname}" ]; then
		eval $pathname=`spacecolon $*`
	else
		#tttt=eval $`echo $pathname`
		#eval $pathname=`spacecolon $* "$tttt"`
		eval "$pathname=\"`spacecolon $*`:${!pathname}\""
	fi
	export $pathname
}

alias LD=preLD
alias preLD='pre_path LD_LIBRARY_PATH'
alias postLD='post_path LD_LIBRARY_PATH'
alias CP=preCP
alias preCP='pre_path CLASSPATH'
alias postCP='post_path CLASSPATH'
alias path=prePATH
alias prePATH='pre_path PATH'
alias postPATH='post_path PATH'
alias manpath=preMAN
alias preMAN='pre_path MANPATH'
alias postMAN='post_path MANPATH'



return
# the following are older and not used.  here just in case we need
# then for other shells.


# 
# LD -- LD_LIBRARY_PATH
#
function postLD () {
  LD_LIBRARY_PATH=`spacecolon "$LD_LIBRARY_PATH" $*`
  export LD_LIBRARY_PATH
}

function preLD () {
  LD_LIBRARY_PATH=`spacecolon $* "$LD_LIBRARY_PATH"`
  export LD_LIBRARY_PATH
}
alias LD=preLD

#
# CP -- CLASSPATH
#
function postCP () {
  CLASSPATH=`spacecolon "$CLASSPATH" $*`
  export CLASSPATH
}

function preCP () {
  CLASSPATH=`spacecolon $* "$CLASSPATH"`
  export CLASSPATH
}
alias CP=preCP


#
# path -- PATH
#
function postPATH () {
	if [ -z "$PATH" ]; then
		PATH=`spacecolon $*`
	else
		PATH=`spacecolon "$PATH" $*`
	fi
  export PATH
}

function prePATH () {
	if [ -z "$PATH" ]; then
		PATH=`spacecolon $*`
	else
		PATH=`spacecolon $* "$PATH"`
	fi
  export PATH
}
alias path=prePATH


#
# xx -- MANPATH
#
function postMAN () {
	if [ -z "$MANPATH" ]; then
		MANPATH=`spacecolon $*`
	else
		MANPATH=`spacecolon "$MANPATH" $*`
	fi
  export MANPATH
}

function preMAN () {
	if [ -z "$MANPATH" ]; then
		MANPATH=`spacecolon $*`
	else
		MANPATH=`spacecolon $* "$MANPATH"`
	fi
  export MANPATH
}

# vim:ts=4:et:sw=4:syntax=sh
