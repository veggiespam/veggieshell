# vim:ts=4

# filemail and uumail
# base64 encodes and mails a file to users.
# use:  filemail filename.ext person1@foo.tld person2@bar.tld
# UU only: or even filemail filename.ext -s 'subject' person1@foo.tld person2@bar.tld
# UU only: this uses the "mail" command, so you can pass params directly it.
function uumail () {
	uuencode $1 < $1 > /tmp/uumail-$$
	shift
	mail $* < /tmp/uumail-$$
	rm /tmp/uumail-$$
}

function filemail () {
    date=`date`
    file=$1
    shift
    for i in $*; do
        metasend -b -m text/plain -e base64 -f $file -s "file: $file $date" -t $i
    done
}
