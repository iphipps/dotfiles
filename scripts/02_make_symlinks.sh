#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles/config_files                    # dotfiles directory
olddir=~/dotfiles_old/config_files             # old dotfiles backup directory
files="vimrc zshrc mac_zshrc linux_zshrc inputrc gitignore_global ignore tmux.conf"    # list of files/folders to symlink in homedir

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

mv ~/.vim/coc-settings.json ~/dotfiles_old/config_files
ln -s $dir/coc-settings.json ~/.vim/coc-settings.json

# Ranger
echo "Do ranger stuff"

if [ ! -d ~/.config/ranger ]; then
  ranger --copy-config=all
fi

defaultCodeExts="xml|json|csv|tex|py|pl|rb|js|sh|php"
replaceCodeExts="xml|json|csv|tex|py|pl|rb|js|jsx|tsx|ts|scss|sass|sh|rs|php" 
sed -i'' -e "s/$defaultCodeExts/$replaceCodeExts/g" ~/.config/ranger/rifle.conf
matchLinesToRemove="ext x?html?"
sed -i'' -e "/$matchLinesToRemove/d" ~/.config/ranger/rifle.conf


defaultConsole='map :  console'
replaceConsole='map <Space> console'
defaultMark='map <Space> mark_files toggle=True'
replaceMark='map : mark_files toggle=True'
defaultHidden='set show_hidden false'
replaceHidden='set show_hidden true'

sed -i'' -e "s/$defaultConsole/$replaceConsole/" ~/.config/ranger/rc.conf
sed -i'' -e "s/$defaultMark/$replaceMark/" ~/.config/ranger/rc.conf
sed -i'' -e "s/$defaultHidden/$replaceHidden/" ~/.config/ranger/rc.conf

defaultHtmlPreview='htm|html|xhtml)'
replaceHtmlPreview='htm|xhtml)'

sed -i'' -e "s/$defaultHtmlPreview/$replaceHtmlPreview/" ~/.config/ranger/scope.sh

# Swap file dir
mv ~/.tmp ~/dotfiles_old/.tmp
mkdir ~/.tmp

