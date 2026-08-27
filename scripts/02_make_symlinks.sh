#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles/config_files                    # dotfiles directory
olddir=~/dotfiles_old/config_files             # old dotfiles backup directory
files="vimrc zshrc mac_zshrc linux_zshrc inputrc gitignore_global gitconfig ignore tmux.conf tmux-session-color.sh"    # list of files/folders to symlink in homedir

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
    mv ~/.$file ~/dotfiles_old/config_files
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

mkdir ~/.config/nvim
ln -s $dir/init.lua ~/.config/nvim/init.lua


