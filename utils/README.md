This directory contains init files for various programs.

* dircolors is used by eval+dircolors to create an env var for ls.

* inputrc is used by bash, ncftp, emacs, and many other programs to
  setup an input line.  Some items configured here may cause pain
  for emacs users, like ^f and ^b.

* lesskey and lesskey-generator add keys strokes to less.  Edit
  lesskey-generator to add your keys, then run <code>lesskey -o
  ./lesskey ./lesskey-generator</code> to remake lesskey.  The
  lesskey utils are not customizable in your $VEGGIE_HOME/personal
  dir.

* screenrc is the configuration file for screen.

Future thoughts:
* dircolors - implement files named like dircolors-$TERM to show linux
  console and xterm specific colors and such.

* inputrc - Document the changes.
