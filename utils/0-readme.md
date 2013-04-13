This dir contains init files for various programs.

* dircolors is used by eval+dircolors to create an env var for ls.
  You can also have dircolors-$TERM for say, linux console and xterm
  specific colors and such.

* inputrc is used by bash, ncftp, emacs, and many other programs to
  setup an input line.

* lesskey and lesskey-generator add keys strokes to less.  edit
  lesskey-generator to add your keys, then run <code>lesskey -o
  ./lesskey ./lesskey-generator</code> to remake lesskey.  The
  lesskey utils are not customizable in your $VEGGIE_HOME/personal
  dir.


