# Command Line GUI

## Files
* osx-terminal.sh - this defines newtab and newwin for osx.
* xterm.sh - this defines newtab and newwin for xterm or rxvt.
* cygwin.sh - this defines newtab and newwin for windows cmd
  terminal windows.

## Commands
* newtab - opens a new tab in the current terminal window
* newwin - opens a new terminal window
* xtail {filename} - opens a new terminal window with
  `tail -f filename`.
* xtitle {new title} - sets the title of the terminal
  window to the specified string.
* ytitle {new title} - like xtitle, but repeats the string
  7 times; useful for short strings.


vim: ts=4 sw=4 et tw=65 filetype=markdown
