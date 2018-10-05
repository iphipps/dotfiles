#!/bin/bash
############################
# .make.sh
# This script sets desired defaults for osx
############################

# keyboard speed
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 1

# require sleep passwords
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# trackpads
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write NSGlobalDomain com.apple.mouse.scaling 2.5
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2 # 0 slowest 3 fastest
defaults write com.apple.dock wvous-br-corner -int 5 # button right is sleep