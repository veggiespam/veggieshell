# vim:ts=4

# finds the best java engine and sets some environment vars.
#
# JAVA_HOME     used by apache's ant
#   ...other...


# if $JAVA_HOME is already set, then no need to find java
if [ ! -z "$JAVA_HOME" ]; then
	return
fi

# first, search for java on the path
my_path=`type -path java 2>/dev/null`
res=$?
if [ $res = 0 ]; then
    da_java_path=$my_path
    da_java_dir=`dirname $da_java_path` ;# first time is /.../bin
    da_java_dir=`dirname $da_java_dir`  ;# second time gets beyond ./bin
else 
    # that didn't work, look in common places with this priority
    my_places1=`ls -rd /usr/local/java*  2>/dev/null`
    my_places2=`ls -rd /usr/local/jdk*   2>/dev/null`
    my_places3=`ls -rd /usr/java*        2>/dev/null`
    my_places4=`ls -rd /usr/jdk*         2>/dev/null`
    my_places="$my_places1 $my_places2 $my_places3 $my_places4"
    if [ ! -z "$my_places" ]; then
        da_java_dir=`echo $my_places | awk '{print $1}'`
    fi
    unset my_places my_places1 my_places2 my_places3 my_places4
fi

if [ ! -z "$da_java_dir" ]; then
    JAVA_HOME=$da_java_dir
    export JAVA_HOME
fi

unset da_java_dir da_java_path my_path res
