#!/bin/sh

tmpfile="$HOME/veggieshell_installer_tmpfile_$$.sh"
cd ${HOME}
export VEGGIE_HOME=${HOME}/.veggieshell

# we want relative links in the home dir, so this is the linkage name (as opposed to the full path above)
# This export is only for this script and isn't used for real.
export dotVS=".veggieshell"

if [ ! -f "$VEGGIE_HOME/FileList" ]; then
	echo You must run SymLink.sh from your home dir.
	return 1
fi

echo Any existing configuration files will be moved to the
echo Before-Veggieshell directory.  

mkdir -p Before-Veggieshell

# Note for test: -e is exists and -L is needed in cases of broken symlinks
#
cat "$VEGGIE_HOME/FileList" | \
	grep -v '^#' | \
	awk '{printf "if [ -e \"%s\" -o -L \"%s\" ] ; then\n   mv -f \"%s\" Before-Veggieshell \nfi \n ln -s \"$VEGGIE_HOME/%s\" \"%s\" ;  \n", $1, $1, $1, $2, $1}' \
	> ${tmpfile}"

. ${HOME}/${tmpfile}

rm -f ${tmpfile}
unset tmpfile

echo Done, log out and back in.  See the bugs and todo list.

# vi:ts=4:sts=4
