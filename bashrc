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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features 
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


#ssh aliases
if [ -f ~/.ssh_aliases ]; then
    . ~/.ssh_aliases
fi


#path
export PATH= #clear, then add
PATH+=:~/.dotfiles/
PATH+=:/usr/local/bin
PATH+=:/bin
PATH+=:/sbin
PATH+=:/usr/bin
PATH+=:/usr/sbin
PATH+=:/usr/local/lib/
PATH+=:/usr/local/include/

#editor
export EDITOR=vim

#rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

#python
export PYTHONSTART=~/.dotfiles/pythonstart.py

#pull in ubunut or mac specific stuff
if [ $(uname) = "Darwin" ]; then
  . ~/.dotfiles/macrc
else
  . ~/.dotfiles/ubunturc
fi


#pull in prompt
. ~/.dotfiles/prompt