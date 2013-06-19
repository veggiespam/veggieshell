# Future Thoughts and Ideas

## Single Run Config Scripts
Consider a single-run boot strap script to configure new systems, such
as change registry entries or set OS X gui defaults.  A really complex
example of this can be found here: http://mths.be/osx  (aka https://github.com/mathiasbynens/dotfiles/blob/master/.osx ).


## Better Docs
The personalization docs could use some help.  Heck, linking with
../README.md would be beneficial too.  A description of
shell/boot, shell/aliases, shell/completion could be benificial
too.


## Twmrc for X-Windows
Long ago, twm was king. Then, everything from Window Maker to CDE to
Enlightenment to whatever.  All of these new programs work well and make for
beautiful windowing systems, but there is still a need for twm.  When using
VNC, all of the refinements and extraneous crap provided by other window
managers is not needed.  For VNC, we need both speed from light graphical
overhead on the system and a visual environment that does not clutter the
screen.  Minimalistic twm file will also assist for OS X and XQuartz.  Thus, we
need a small and concise twm file.  The original Veggieshell twmrc file
minimalist-but-pretty has been lost, so if anyone can contribute a new minimal
version, it would be incorporated. 




vim: ts=4 sw=4 et filetype=markdown
