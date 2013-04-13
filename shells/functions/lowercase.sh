# vim:ts=4

#
# converts an entire filename to lowercase
#
function lcfile () {
        for i in $* ; do
                lcfile_x=`echo $i | perl -p -e 'tr/A-Z/a-z/;'`
                mv "$i" "$lcfile_x"
        done
        unset lcfile_x
}
