#!/bin/sh

# This file changes some of the default settings with OS X, you need
# to only run it once.  It will restart some Applications for the
# changes to occur.

# Two other sites with great ideas are http://www.defaults-write.com/
# http://mths.be/osx aka https://github.com/mathiasbynens/dotfiles/blob/master/.osx

#### Finder and Dock and Menu Bar

# Disable 3D reflection/glass Dock appearance & make 2D (10.5+)
defaults write com.apple.dock no-glass -boolean YES

# Make hidden apps dimmed in Dock (10.3+)
defaults write com.apple.dock showhidden -bool true

# Just show battery icon w/o percent or time on menu bar (?10.3+)
defaults write com.apple.menuextra.battery ShowTime -string NO
defaults write com.apple.menuextra.battery ShowPercent -string NO

# Show ~/Library in Finder
chflags nohidden ~/Library

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

#### Debug Menus

# Turn on App Store debug menu (10.7+)
#    https://discussions.apple.com/message/22992220#22992220
defaults write com.apple.appstore ShowDebugMenu -bool true
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable debug menu in iCal (10.5-10.8)
#    http://apple.stackexchange.com/questions/58889/how-do-i-enable-the-debug-menu-in-calendar
defaults write com.apple.iCal IncludeDebugMenu 1

# Enable debug menu in AddressBook (10.5+)
defaults write com.apple.AddressBook ABShowDebugMenu 1

# Enable debug menu in Safari (10.4+)
#    http://osxdaily.com/2011/11/07/safari-debug-menu/
defaults write com.apple.Safari IncludeInternalDebugMenu 1

# Disk Utility: debug menus
#    http://mths.be/osx
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Enable Dashboard dev mode (allows keeping widgets on the desktop)
#    http://mths.be/osx
defaults write com.apple.dashboard devmode -bool true


# Window shadows on the screen.
# these appear to be ignored in 10.9
#    http://apple.stackexchange.com/questions/61924/how-can-i-remove-the-window-shadow-in-mountain-lion
# but this works wonderfully -- compiled app
#    https://github.com/puffnfresh/toggle-osx-shadows
#defaults write NSGlobalDomain NSUseLeopardWindowValues NO
#defaults write com.apple.Safari NSUseLeopardWindowValues YES


#### Mail and Messages

# Disable animations from OS X Mail (10.8+)
#    http://osxdaily.com/2011/07/27/disable-mail-animations-in-mac-os-x-lion/
#  ** Hmmm... appears broken in 10.9...
defaults write com.apple.mail DisableSendAnimations -bool YES
defaults write com.apple.mail DisableReplyAnimations -bool YES

# Copy email addresses as `foo@example.com` instead of
# `Foo Bar <foo@example.com>` in Mail.app   --  http://mths.be/osx
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Disable inline attachments -- show the icons
defaults write com.apple.mail DisableInlineAttachmentViewing -bool YES

# Disable smart quotes; annoying if pasting/reading code in Messages (10.9+)
#    http://mths.be/osx
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false


#### Apps

# Safari tabs/windows load faster with blank page
defaults write com.apple.Safari HomePage -string "about:blank"


#### General UI 

# Disable the window shadow in screen shots; helpful when sending reports.
defaults write com.apple.screencapture disable-shadow -bool true

# Make screen saver password non-instant, give me 10 sec to move mouse
#    http://www.defaults-write.com/change-defaulft-screensaver-password-delay-options/
defaults -currentHost write com.apple.screensaver askForPasswordDelay -int 10

# Expand save panel by default
#    http://mths.be/osx
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
#    http://mths.be/osx
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Save to disk (not to iCloud) by default
#    http://mths.be/osx
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
#    http://mths.be/osx
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable Resume system-wide (10.8+)
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false


killall Dock
cat <<EOM
Many changes will not be seen until after reloading the apps,
relogin, or reboot.  For safety, only the Dock is re-started.
EOM

