
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
if [ -f ~/.local_bashrc ]; then
 . ~/.local_bashrc
fi

# make bash history save
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

export PS1="\t \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# copies current branch to clipboard
alias gitcur="git branch | grep '* ' | sed -e 's/* //g' | pbcopy"
# get branches by author sorted by committerdate (thanks stack overflow)
alias gitbranchauth="git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n"

