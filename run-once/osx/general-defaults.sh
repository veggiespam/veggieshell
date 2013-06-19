#!/bin/sh

# This file changes some of the default settings with OS X, you need
# to only run it once.  It will restart some Applications for the
# changes to occur.

# Disable animations from OS X Mail (10.8+)
#    http://osxdaily.com/2011/07/27/disable-mail-animations-in-mac-os-x-lion/
defaults write com.apple.mail DisableSendAnimations -bool YES
defaults write com.apple.mail DisableReplyAnimations -bool YES

# Disable reflection/glass Dock appearance (10.5+)
defaults write com.apple.dock no-glass -boolean YES

# Make hidden apps dimmed in Dock (10.3+)
defaults write com.apple.dock showhidden -bool true



killall Dock

