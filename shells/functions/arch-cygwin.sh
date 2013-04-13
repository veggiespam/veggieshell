# vim:ts=4:sts=4:tw=75

# run for cygwin

if [ $VEGGIE_ARCH != "cygwin" ]; then
	# oops, don't run me
	return
fi

# cygwin may not have many programs installed or they might be elsewhere.
# vim, being a good example.  for some machines, gvim is in
# C:\Vim\vim63\gvim.exe as opposed to under the /usr/ path.  this file
# fixes that and other items.

if [ -z "`type -path vi`" ]; then
	for vimtop in c:/vim "c:/Program Files/Vim"; do
		vimtop=`cyg_path_munge $vimtop`
		if [ -d "$vimtop" ]; then
			break
		fi
	done
	for dir in vim70 vim64 vim63 vim62 vim61; do
		if [ -d "$vimtop/$dir" ]; then
			prePATH "$vimtop/$dir"
			break
		fi
	done
	alias vi=vim
fi
unset vimtop dir
