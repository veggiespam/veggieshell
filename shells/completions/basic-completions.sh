# vim:ts=4:syntax=sh

# This file is full of command line completions.  For example,
# when you type 'cd <tab>' bash normally shows you a list of all
# files.  but, for example, with the dirnames completion, bash
# will only show you a list of directories and complete the dir
# names.  There are many other options like this.

# Have fun with hostname completions for bla@hostname commands (like
# mail).  As of bash 2.05, this works with complete down below for non @
# commands like telnet <tab>, ssh <tab>, etc.  This is nice, just
# keep setting HOSTFILE, it will append the internal hosts table
# of bash.  To shut this off, unset HOSTFILE.

for i in /etc/hosts \
		"$VEGGIE_HOME/personal/shells/hostfile" \
		"$VEGGIE_HOME/personal/shells/hosts/$veggie_hostname-hostfile" \
	; do
	if [ -f "$i" ]; then
		HOSTFILE="$i"
	fi
done

# and now, the commands for which the non-@ completions work
complete -A hostname telnet rlogin rsh
complete -A hostname ncftp ncftpget ftp
complete -A hostname ssh ssh2 scp sftp
complete -A hostname dig ping tcpdump nc

# for web browsers, we want to complete filename too, so 2x-A
complete -A hostname -A file lynx wget curl 

# variables
complete -A variable export e unset printenv

# this may not work... to be tested
complete -A stopped fg
complete -P- -A signal kill

# print commands for when you do man <tab> or which <tab>
complete -A command which locate type whereis man

# for nohup, the first <tab> we want program, but usually for others; file
complete -A command -A file nohup

complete -A directory cd
complete -A shopt shopt
complete -A setopt setopt
complete -A alias unalias
complete -A helptopic help
complete -A user write tell chown finger

## TODO - incorporate some of http://bashcookbook.com/bashinfo/source/bash-4.2/examples/complete/complete-examples


# the rest of this file is an enhanced version of some brilliant code
# from http://dotfiles.com/files/3/233_bashrc written by
# clemens fischer <ino-E0b02a05@spotteswoode.dnsalias.org>

complete -o default -c which locate type pinfo p whereis man2txt
complete -o default -A hostname dig ping tcpdump ethereal ngrep nc cryptcat
complete -o default -A hostname dnsq dnsqr dnsip dnsmx
complete -o default -A user chown
complete -o default -A binding bind
complete -o default -A function unfunction
complete -o default -A export printenv
#complete -o default -v echo unset
complete -o default -d cd
complete -o default -A setopt set
complete -o default -A shopt shopt
complete -o default -a a unalias
complete -A helptopic help

# This is a 'universal' completion function - it works when commands have
# a so-called 'long options' mode , ie: 'ls --all' instead of 'ls -a'
_universal_func ()
{
	case "$2" in
		-*)	 ;;
		*)	  return ;;
	esac
	case "$1" in
		\~*)	eval cmd=$1 ;;
		*)	  cmd="$1" ;;
	esac
	COMPREPLY=( $("$cmd" --help | sed  -e '/--/!d' -e 's/.*--\([^ ]*\).*/--\1/'| \
grep ^"$2" |sort -u) )
}
# TODO these commands are not valid on non-mostly-gnu systems, like darwin
complete  -o default -F _universal_func ldd wget bash id info

_make_targets ()
{
	local mdef makef gcmd cur prev i

	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	prev=${COMP_WORDS[COMP_CWORD-1]}

	# if prev argument is -f, return possible filename completions.
	# we could be a little smarter here and return matches against
	# `makefile Makefile *.mk', whatever exists
	case "$prev" in
		-*f)	COMPREPLY=( $(compgen -f $cur ) ); return 0;;
	esac

	# if we want an option, return the possible posix options
	case "$cur" in
		-)	  COMPREPLY=(-e -f -i -k -n -p -q -r -S -s -t); return 0;;
	esac

	# make reads `GNUmakefile' before `makefile' before `Makefile'
	if [ -f GNUmakefile ]; then
		mdef=GNUmakefile
	elif [ -f makefile ]; then
		mdef=makefile
	elif [ -f Makefile ]; then
		mdef=Makefile
	else
		mdef=*.mk			   # local convention
	fi

	# before we scan for targets, see if a makefile name was specified
	# with -f
	for (( i=0; i < ${#COMP_WORDS[@]}; i++ )); do
		if [[ ${COMP_WORDS[i]} == -*f ]]; then
			eval makef=${COMP_WORDS[i+1]}	   # eval for tilde expansion
			break
		fi
	done

		[ -z "$makef" ] && makef=$mdef

	# if we have a partial word to complete, restrict completions to
	# matches of that word
	if [ -n "$2" ]; then gcmd='grep "^$2"' ; else gcmd=cat ; fi

	# if we don't want to use *.mk, we can take out the cat and use
	# test -f $makef and input redirection
	COMPREPLY=( $(cat $makef 2>/dev/null | awk 'BEGIN {FS=":"} /^[^.#   ][^=]*:/ {print $1}' | tr -s ' ' '\012' | sort -u | eval $gcmd ) )
}
complete -o default -F _make_targets -X '+($*|*.[cho])' make gmake pmake

_configure_func ()
{
	case "$2" in
		-*)	 ;;
		*)	  return ;;
	esac

	case "$1" in
		\~*)	eval cmd=$1 ;;
		*)	  cmd="$1" ;;
	esac

	COMPREPLY=( $("$cmd" --help | awk '{if ($1 ~ /--.*/) print $1}' | grep ^"$2" | sort -u) )
}
complete -F _configure_func configure



# cvs(1) completion
_cvs ()
{
	local cur prev
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	prev=${COMP_WORDS[COMP_CWORD-1]}
	if [ $COMP_CWORD -eq 1 ] || [ "${prev:0:1}" = "-" ]; then
		COMPREPLY=( $( compgen -W 'add admin checkout commit diff \
		export history import log rdiff release remove rtag status \
		tag update' $cur ))
	else
		COMPREPLY=( $( compgen -f $cur ))
	fi
	return 0
}
complete -F _cvs cvs




_killall ()
{
	local cur prev
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	#prev=${COMP_WORDS[COMP_CWORD-1]}
	#if [ $COMP_CWORD -eq 1 ] || [ "${prev:0:1}" = "-" ]; then
	COMPREPLY=( $( ps -ac -ocommand  |
		sed -E -e '1d' |
		grep -E "^${cur}" ))
	return 0
}
complete -F _killall killall sskill
complete -A signal skill kill



function _chgrp {
	local cur
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	COMPREPLY=( $( cut -d: -f1 /etc/group |grep "^${cur}" ) )
	return 0
}
complete -o default -F _chgrp chgrp



# man(1) completion
_man ()
{
	local cmd oldifs manpath
	COMPREPLY=()
	oldifs="${IFS}"
	manpath="${MANPATH-$(manpath)}"
	cmd=${COMP_WORDS[COMP_CWORD]}
	# with this, the section must be given numerically, it would be much
	# better to complete on a grep of the manpath, too, to single out X-, qmail-,
	# perl- commands, thus reducing the list a bit.
	sect=${COMP_WORDS[COMP_CWORD-1]}
	IFS=':'
	for i in $manpath
	do
		IFS="${oldifs}"
		if ls ${i}/man${sect}/${cmd}* 1>/dev/null 2>&1 ; then
			COMPREPLY=( "${COMPREPLY[@]}" $( ls ${i}/man${sect}/* 2>/dev/null |
			grep "${i}/man${sect}/${cmd}" |
			sed -E -e "s,^${i}/man${sect}/,," -e "s,\.${sect}(\.gz|\.Z)?$,," ))
		fi
	done
	IFS="${oldifs}"
	return 0
}
# FIXME - "sed -E" is not valid on darwin - does it strip off the .1 stuff?
# FIXME - unsure if this works on darwin 10.8 even.
complete -F _man man



# openssl(1) completion
_openssl ()
{
	local cur prev
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	prev=${COMP_WORDS[COMP_CWORD-1]}
	if [ $COMP_CWORD -eq 1 ]; then
		COMPREPLY=( $(openssl list-standard-commands ))
	else
		COMPREPLY=( $(openssl ${COMP_WORDS[1]} -help 2>&1 |
			sed -E -e '/^[ 	]*-/!d' \
			-e 's/^[ 	]*//gp' |
			cut -d" " -s -f1 ))
	fi
	return 0
}
complete -F _openssl -o default openssl

