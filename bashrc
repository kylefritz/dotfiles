# ~/.bashrc: executed by bash(1) for non-login shells.

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features 
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#aws
if [ -f ~/.aws ]; then
    . ~/.aws
fi

#ssh aliases
if [ -f ~/.ssh_aliases ]; then
    . ~/.ssh_aliases
fi

#path
export PATH= #clear, then add
PATH+=:~/.dotfiles
PATH+=:~/bin
PATH+=:/usr/local/bin
PATH+=:/bin
PATH+=:/sbin
PATH+=:/usr/bin
PATH+=:/usr/sbin
PATH+=:/usr/local/lib
PATH+=:/usr/local/include

#local path
if [ -f ~/.path ]; then
  . ~/.path
fi

#editor
export EDITOR=vim

#rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

#python
export PYTHONSTART=~/.dotfiles/pythonstart.py

#node
export NODE_PATH=/usr/local/lib/node

#scala
PATH+=:/usr/local/typesafe-stack/bin

#vim
alias v="gvim --remote-silent"

#pull in ubuntu or mac specific stuff
if [ $(uname) = "Darwin" ]; then
  . ~/.dotfiles/macrc
else
  . ~/.dotfiles/ubunturc
fi

#pull in prompt
. ~/.dotfiles/prompt
