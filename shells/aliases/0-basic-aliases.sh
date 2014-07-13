
# this file contains the aliases.  see also:
#	functions/ls.sh for addition "dir" related commands
#	functions/other-programs.sh for many others like vi=vim

# really handy ones....
alias ..='cd ..'
alias e=export   ; # since the 'e' editor is pretty useless...

# shell interaction
alias uncomplete='complete -r'
alias unfunction='unset'

# stuff to help with text files
alias untabcode="perl -pi -e 's/^( *)\t/$1      /g'"
#alias untabcode="perl -pi -e '1 while s/\t+/' ' x (length($&)*8 - length($`)%8)/e;'"

#alias tabize="perl -pi -e 's/^(\t)*(    )*/$1\t/g'"
#alias tabize2="perl -pi -e 's/^(\t)*(  )*/$1\t/g'"
#alias tabize2="perl -pi -e '1 while s/^(  )+/' ' x (length($&) - length($\`)%2)/e;'"


# commands for setting termcaps
alias vt100='export TERM=vt100'
alias rows='stty rows $1'
alias cols='stty cols $1'

# Read raw nroff file in man style
alias roff='nroff -man $* | $PAGER'

# Remove all OSX .DS_Store files in a tree
alias DSrm='find . -name .DS_Store -exec rm \{\} \;'

# vim:ts=4
