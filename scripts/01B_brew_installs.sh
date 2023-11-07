#!/bin/bash

# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ian/.zprofile
# eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew install python3 rust
brew install ranger highlight vim
brew install editorconfig ctags
brew install fd ag entr tree jq bat
brew install rg zplug tmux yarn
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
