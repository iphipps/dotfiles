#!/bin/bash
############################
# .make.sh
# This script runs other scripts
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory

##########

# create dotfiles_old in homedir
echo "Running Mac Defaults"
$dir/set_mac_defaults.sh
echo "Running Make symlinks"
$dir/makesymlinks.sh
echo "...done"

