#!/bin/sh

# This file changes some of the default settings with OS X, you need
# to only run it once.  It will restart some Applications for the
# changes to occur.

#  --  A new website called http://www.defaults-write.com/ has some great stuff

# Disable animations from OS X Mail (10.8+)
#    http://osxdaily.com/2011/07/27/disable-mail-animations-in-mac-os-x-lion/
#  ** Reply appears broken in 10.9...
defaults write com.apple.mail DisableSendAnimations -bool YES
defaults write com.apple.mail DisableReplyAnimations -bool YES

# Disable 3D reflection/glass Dock appearance & make 2D (10.5+)
defaults write com.apple.dock no-glass -boolean YES

# Make hidden apps dimmed in Dock (10.3+)
defaults write com.apple.dock showhidden -bool true

# Turn on App Store debug menu, very useful (10.7+)
#    https://discussions.apple.com/message/22992220#22992220
defaults write com.apple.appstore ShowDebugMenu -bool true

# Enable debug menu in iCal (10.5-10.8)
#    http://apple.stackexchange.com/questions/58889/how-do-i-enable-the-debug-menu-in-calendar
defaults write com.apple.iCal IncludeDebugMenu 1

# Enable debug menu in AddressBook (10.5+)
defaults write com.apple.AddressBook ABShowDebugMenu 1

# Enable debug menu in Safari (10.4+)
#    http://osxdaily.com/2011/11/07/safari-debug-menu/
defaults write com.apple.Safari IncludeInternalDebugMenu 1

# Disable the window shadow in screen shots; helpful when sending reports.
defaults write com.apple.screencapture disable-shadow -bool true

# these appear to be ignored in 10.9
#    http://apple.stackexchange.com/questions/61924/how-can-i-remove-the-window-shadow-in-mountain-lion
# but this works wonderfully -- compiled app
#    https://github.com/puffnfresh/toggle-osx-shadows
defaults write NSGlobalDomain NSUseLeopardWindowValues NO
defaults write com.apple.Safari NSUseLeopardWindowValues YES

# Make screen saver password non-instant, give me 10 sec to move mouse
#    http://www.defaults-write.com/change-defaulft-screensaver-password-delay-options/
defaults -currentHost write com.apple.screensaver askForPasswordDelay -int 10

killall Dock

