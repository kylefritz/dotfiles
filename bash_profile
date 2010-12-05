#path
export PATH= #clear, then add
PATH+=:~/.kpfscripts
PATH+=:/usr/local/bin
PATH+=:/opt/local/bin
PATH+=:/bin
PATH+=:/sbin
PATH+=:/usr/bin
PATH+=:/usr/sbin
PATH+=:/usr/local/git/bin
PATH+=:/usr/local/lib/
PATH+=:/usr/local/include/
PATH+=:/usr/texbin
PATH+=:/usr/X11/bin
PATH+=:/opt/local/bin

#prompt
#somewhere PS1 is defined as '\h:\W \u\$ '
export PS1="\h:\W$ "
color_prompt=yes

#editor
export EDITOR=vim
#"mate -w"
alias edit=$EDITOR

#general shell
alias ^L=clear #seems to be default anyway
alias ls='ls -FhG'
alias l=ls
alias sl=ls
alias lsl='ls ./*'
alias ll='ls -la'
alias m=less
alias mroe=less
alias emcas=emacs
alias up='cd ..'
alias clean='rm -f *~ *.out *.o *.pyc *.class *.gch'
alias clever=$EDITOR' ~/.bash_profile;source ~/.bash_profile'
alias hints="ls ~/.kpfscripts"
alias cd="pushd $@ > /dev/null" #replace cd with pushd
alias popd="popd > /dev/null" #make popd silent in bash
alias p="popd"
alias prev="popd"

#svn
#alias s='svn stat'
alias si='svn propedit svn:ignore'
#alias +='svn add'
#alias x='svn rm'

#ruby
alias gem='sudo gem'

#ssh aliases
source ~/.ssh_aliases

#firefox
alias firefox='open -a /Applications/Firefox.app/'

#ls colors
export CLICOLOR=1
export LSCOLORS="exbxxexcbxxfxgdxAxExGx"

#trash function
function trash () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}

#java
alias javac226='javac -Xlint:all'

#scala
export SCALA_HOME='/usr/local/share/scala'
PATH+=:$SCALA_HOME/bin

#c
alias gcc120='gcc -ansi -std=c99 -pedantic -Wall -Wextra -O '

#c++
export BOOST_ROOT=/usr/include/boost_1_43_0
alias g++boost='g++ -I $BOOST_ROOT '

#mono
export MONODIR=/Library/Frameworks/Mono.framework/Versions/2.4/
PATH+=:$MONODIR'bin'

#flex
export FLEXDIR='/usr/local/flex/'
PATH+=:$FLEXDIR'bin'

#python
export PYTHONSTART=/Users/kf/.kpfscripts/pythonstartup.py
export PYTHONPATH=/Library/Python/2.6/site-packages/

#go language
export GOROOT='/Users/kf/lib/go/'
export GOOS='darwin'
export GOARCH='386'
export GOBIN='/Users/kf/bin/go/'
PATH+=:$GOBIN

#pull in prompt
source ~/.dotfiles/bash_prompt
