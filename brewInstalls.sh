#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew install python3 rust
brew install ranger highlight vim
brew install editorcondig ctags
brew install fd ag entr tree
