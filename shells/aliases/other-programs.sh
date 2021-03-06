
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
	# Sed hints for using "echo" or "$\n" came from:
	# http://stackoverflow.com/questions/723157/how-to-insert-a-newline-in-front-of-a-pattern

	# "space RRR space" produces a right arrow in html

    #jfunction __panhtml() { pandoc -f markdown $* | sed 's/&quot;/"/g; s/<ol style="list-style-type: decimal">/<ol>/g;  s/ RRR / \&rarr; /g;   s/<\/p>/<\/p>\\r/g;    s/<\/ol>/<\/ol>\\r/g;    s/<\/ul>/<\/ul>\\r/g;   s/<\/pre>/<\/pre>\\r/g;' ;}
    function __panhtml() { pandoc -f markdown $* | sed 's/&quot;/"/g; s/<ol style="list-style-type: decimal">/<ol>/g;  s/ RRR / \&rarr; /g;   s/<\/p>/<\/p>/g;    s/<\/ol>/<\/ol>/g;    s/<\/ul>/<\/ul>/g;   s/<\/pre>/<\/pre>/g;' ;}
#    function __panhtml() { pandoc $@ | sed 's/&quot;/"/g; s/<ol style="list-style-type: decimal">/<ol>/g; s/<\/ol>/<\/ol>\n/g' ;}
	alias panhtml=__panhtml
fi

unset res

# vim:ts=4
