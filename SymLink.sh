#!/bin/sh

tmpfile=tmp_conf_build.$$
cd "$HOME"
VEGGIE_HOME="$HOME/.veggieshell"

if [ ! -f "$VEGGIE_HOME/FileList" ]; then
	echo You must run SymLink.sh from your home dir.
	return 1
fi

echo You can safely ignore any File Does Not Exist errors
echo All your original files are in the Before-Veggieshell directory

mkdir Before-Veggieshell

cat "$VEGGIE_HOME/FileList" | \
	grep -v '^#' | \
	awk '{printf "mv -f \"%s\" Before-Veggieshell; ln -s \"$VEGGIE_HOME/%s\" \"%s\"\n", $1, $2, $1}' \
	> $tmpfile

. $tmpfile

rm -f $tmpfile
# vi:ts=4:sts=4
