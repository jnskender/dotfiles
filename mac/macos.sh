#!/usr/bin/env bash

# ~/.macos — https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# General UI/UX                                                               #
###############################################################################
#cntrl command to drag window by clicking anywhere in the window
defaults write -g NSWindowShouldDragOnGesture -bool true

# Set computer name (as done via System Preferences → Sharing)
#sudo scutil --set ComputerName "0x6D746873"
#sudo scutil --set HostName "0x6D746873"
#sudo scutil --set LocalHostName "0x6D746873"
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"

# # Disable the sound effects on boot
# sudo nvram SystemAudioVolume=" "

# # Set highlight color to green
# defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

# # Set sidebar icon size to medium
# defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# # Always show scrollbars
# defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# # Possible values: `WhenScrolling`, `Automatic` and `Always`

# # Disable the over-the-top focus ring animation
# defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# # Disable smooth scrolling
# # (Uncomment if you’re on an older Mac that messes up the animation)
# #defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false

# # Increase window resize speed for Cocoa applications
# #defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# # Expand save panel by default
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# # Expand print panel by default
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# # Save to disk (not to iCloud) by default
# #defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# # Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# # Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
# #/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# # Display ASCII control characters using caret notation in standard text views
# # Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
# #defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# # Disable Resume system-wide
# defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# # Disable automatic termination of inactive apps
# #defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

#Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# # Set Help Viewer windows to non-floating mode
# #defaults write com.apple.helpviewer DevMode -bool true

# # Fix for the ancient UTF-8 bug in QuickLook (https://mths.be/bbo)
# # Commented out, as this is known to cause problems in various Adobe apps :(
# # See https://github.com/mathiasbynens/dotfiles/issues/237
# #echo "0x08000100:0" > ~/.CFUserTextEncoding

# # Reveal IP address, hostname, OS version, etc. when clicking the clock
# # in the login window
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# # Disable Notification Center and remove the menu bar icon
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# # Disable automatic capitalization as it’s annoying when typing code
# #defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# # Disable smart dashes as they’re annoying when typing code
# #defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# # Disable automatic period substitution as it’s annoying when typing code
# #defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# # Disable smart quotes as they’re annoying when typing code
# #defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# # Disable auto-correct
# #defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# # Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# # all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
# #rm -rf ~/Library/Application Support/Dock/desktoppicture.db
# #sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
# #sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg

# ###############################################################################
# # Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
# ###############################################################################

# # Trackpad: enable tap to click for this user and for the login screen
# #defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# #defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# #defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# # Trackpad: map bottom right corner to right-click
# #defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
# #defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
# #defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
# #defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2

# # Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# ###############################################################################
# # Screen                                                                      #
# ###############################################################################

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# ###############################################################################
# # Finder                                                                      #
# ###############################################################################

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# # Finder: show hidden files by default
# #defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool false

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# # Keep folders on top when sorting by name
# defaults write com.apple.finder _FXSortFoldersFirst -bool true

# # When performing a search, search the current folder by default
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

#Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool true

# ###############################################################################
# # Dock, Dashboard, and hot corners                                            #
# ###############################################################################

# move to left
defaults write com.apple.dock orientation left

# set icon size
defaults write com.apple.dock largesize -int 128

# # Enable spring loading for all Dock items
# defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# # Wipe all (default) app icons from the Dock
# # This is only really useful when setting up a new Mac, or if you don’t use
# # the Dock to launch apps.
# #defaults write com.apple.dock persistent-apps -array

# # Show only open applications in the Dock
# #defaults write com.apple.dock static-only -bool true

# # Don’t animate opening applications from the Dock
# #defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

# # Disable Dashboard
# defaults write com.apple.dashboard mcx-disabled -bool true

# # Don’t show Dashboard as a Space
# defaults write com.apple.dock dashboard-in-overlay -bool true

# # Don’t automatically rearrange Spaces based on most recent use
# defaults write com.apple.dock mru-spaces -bool false

#Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# # Remove the animation when hiding/showing the Dock
# #defaults write com.apple.dock autohide-time-modifier -float 0

# # Automatically hide and show the Dock
# #defaults write com.apple.dock autohide -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# ###############################################################################
# # Safari & WebKit                                                             #
# ###############################################################################

# # Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# ###############################################################################
# # Mail                                                                        #
# ###############################################################################

# # Disable send and reply animations in Mail.app
# defaults write com.apple.mail DisableReplyAnimations -bool true
# defaults write com.apple.mail DisableSendAnimations -bool true

# # Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# # Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
# defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

# Display emails in threaded mode, sorted by date (oldest at the top)
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "no"
# #defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# # Disable inline attachments (just show the icons)
# #defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# # Disable automatic spell checking
# #defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

# ###############################################################################
# # Time Machine                                                                #
# ###############################################################################

# # Prevent Time Machine from prompting to use new hard drives as backup volume
# defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# ###############################################################################
# # Activity Monitor                                                            #
# ###############################################################################

# # Show the main window when launching Activity Monitor
# defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# # Show all processes in Activity Monitor
# defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

##### Mac App Store #####

#Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

#Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

#Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

#Install System data files &
security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
# defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

##### Photos #####

# # Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

killall Dock
killall Finder
echo "Done. Note that some of these changes require a logout/restart to take effect."
