#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles/config_files                    # dotfiles directory
olddir=~/dotfiles_old/config_files             # old dotfiles backup directory
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
    mv ~/.$file ~/dotfiles_old/config_files
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Ranger
echo "Do ranger stuff"
ranger --copy-config=all

defaultCodeExts="xml|json|csv|tex|py|pl|rb|js|sh|php"
replaceCodeExts="xml|json|csv|tex|py|pl|rb|js|jsx|tsx|ts|scss|sass|sh|php" 
sed -i "s/$defaultCodeExts/$replaceCodeExts/g" ~/.config/ranger/rifle.conf

defaultConsole='map :  console'
replaceConsole='map <Space> console'
defaultMark='map <Space> mark_files toggle=True'
replaceMark='map : mark_files toggle=True'

sed -i "s/$defaultConsole/$replaceConsole/" ~/.config/ranger/rc.conf
sed -i "s/$defaultMark/$replaceMark/" ~/.config/ranger/rc.conf



