# Run-Once

Items in this folder can optionally be run for additional system or account
configuration.  These only need to be done once when you get a
new machine.  Except on the
rare occation when things get updated, but that doesn't happen
very often.

## OS X

* general-defaults.sh - contains many settings for single use.  Just run it.


## Linux

* Nothing here yet.


## Windows

Lots of items to merge into the registry.  Basically, do `reg
import filename.reg` for each of these.  

* disable-annoying-office-animations.reg - Disable Cell
    animation and Words "smooth cursor" while typing.  Suggested
    many places on the Internet including:
    http://superuser.com/questions/547832/disable-excel-2013-cell-animation
* disable-mouse-shadow.reg - If you use Citrix, running this on
  your local and remote machines will speed the connection up
  many fold.  


vim: ts=4 sw=4 tw=65 et filetype=markdown
