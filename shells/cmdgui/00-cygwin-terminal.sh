#
# FIXME - placeholder
#

if [ $VEGGIE_ARCH != cygwin ]; then
    return
fi

# Opens a new tab in the current Terminal window and optionally executes a command.
# When invoked via a function named 'newwin', opens a new Terminal *window* instead.
newtab()  {
    cmd.exe bash  $@
}

# Opens a new Terminal window and optionally executes a command.
newwin() {
    newtab "$@" # Simply pass through to 'newtab', which will examine the call stack to see how it was invoked.
}
