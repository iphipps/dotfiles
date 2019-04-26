#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc git-completion.bash mac_bashrc linux_bashrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Ranger
echo "Do ranger stuff"
ranger --copy-config=all
echo "Moving custom files"
mv ~/.config/ranger/rc.conf ~/dotfiles_old/ranger/rc.conf
mv ~/.config/ranger/rifle.conf ~/dotfiles_old/ranger/rifle.conf
mv ~/.config/ranger/scope.sh ~/dotfiles_old/ranger/scope.sh
echo "Create the symlink to file"
ln -s $dir/ranger/rc.conf ~/.config/ranger/rc.conf
ln -s $dir/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -s $dir/ranger/scope.sh ~/.config/ranger/scope.sh

