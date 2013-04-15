#
# cygwin specific boot up script.  
#

if [ "$VEGGIE_ARCH" != "cygwin" ]; then
	# oops, don't run me
	return
fi

# cygwin may not have many programs installed or they might be elsewhere.
# vim, being a good example.  for some machines, gvim is in
# C:\Vim\vim63\gvim.exe as opposed to under the /usr/ path.  this file
# fixes that and other items.

if [ -z "`type -path vi`" ]; then
	for veggieboot_vimtop in c:/vim "c:/Program Files/Vim"; do
		veggieboot_vimtop=`cyg_path_munge $veggieboot_vimtop`
		if [ -d "$veggieboot_vimtop" ]; then
			break
		fi
	done
	for veggieboot_dir in vim74 vim73 vim72 vim71 vim70 vim64 vim63 vim62 vim61; do
		if [ -d "$veggieboot_vimtop/$veggieboot_dir" ]; then
			prePATH "$veggieboot_vimtop/$veggieboot_dir"
			break
		fi
	done
	alias vi=vim
fi

unset veggieboot_vimtop veggieboot_dir

# vim:ts=4:sts=4:tw=75
