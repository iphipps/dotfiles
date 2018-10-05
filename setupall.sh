#!/bin/bash
############################
# .make.sh
# This script runs other scripts
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory

##########

# create dotfiles_old in homedir
echo "Running Set Defaults"
$dir/setdefaults.sh
echo "Running Make symlinks"
$dir/makesymlinks.sh
echo "...done"

