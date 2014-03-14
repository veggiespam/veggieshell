
# various program that need configuration

type less > /dev/null 2> /dev/null
res=$?
if [ $res = 0 ]; then
	export PAGER=less
	export LESS='-CXimsqe -x4 -Pm?f%f:<stdin> .?pb (%pb\%) .?m(file %i of %m)..?e(END) ?x-Next\: %x..%t'
else
	export PAGER=more
fi


type vim > /dev/null 2> /dev/null
res=$?
if [ $res = 0 ]; then
	export VISUAL=vim
	alias vi=vim
else
	export VISUAL=vi
fi
export EDITOR="$VISUAL"
export FCEDIT="$VISUAL"

# printers....
alias lp='lp -o nobanner'
alias lpr='lpr -h'

type enscript > /dev/null 2> /dev/null
res=$?
if [ $res = 0 ]; then
    alias enscript='enscript --landscape -columns=2 --fancy-header \
        --line-numbers --tabsize=4 -DDuplex:true'
fi

type pandoc > /dev/null 2> /dev/null
res=$?
if [ $res = 0 ]; then
    function __panhtml() { pandoc $@ | sed 's/&quot;/"/g; s/<ol style="list-style-type: decimal">/<ol>/g;' ;}
	alias panhtml=__panhtml
fi

unset res

# vim:ts=4
