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
export EDITOR=emacs
#"mate -w"
alias edit=$EDITOR

#shortcuts
alias jhu='cd ~/xsrc/learn/jhu'
alias ibt='cd ~/xsrc/ibt'

#dev firefox
alias devfirefox='/Applications/Firefox.app/Contents/MacOS/firefox-bin -no-remote -P'


#general shell
alias ^L=clear #seems to be default anyway
alias ls='ls -FhG'
#--color=tty
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
alias s='svn stat'
alias si='svn propedit svn:ignore'
alias +='svn add'
alias x='svn rm'
export SVN_EDITOR="mate -w"

#ruby
alias gem='sudo gem'

#webfaction
alias sshwf='ssh kpf@kpf.webfactional.com'
alias sshgp='ssh -p 2022 kyle@magnus.greenplaque.com'

#firefox
alias firefox='open -a /Applications/Firefox.app/'

#ls colors
export CLICOLOR=1
#export LSCOLORS="xefxcxdxxxegedabagacad"
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
# export DYLD_LIBRARY_PATH=$MONODIR'lib'
# export PKG_CONFIG_PATH=$MONODIR'lib/pkgconfig'
# export MONO_PATH=$MONODIR'lib'
PATH+=:$MONODIR'bin'

#flex
export FLEXDIR='/usr/local/flex/'
PATH+=:$FLEXDIR'bin'

#python
export PYTHONSTART=/Users/kf/.kpfscripts/pythonstartup.py
#export PYSITE=/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5/site-packages/
#export PYDIR=/Library/Frameworks/Python.framework/Versions/2.5/
#PATH+=:$PYDIR'bin'

#for shine
#PYTHONPATH+=:'/Users/kf/xsrc/shine/lib/python2.5'
#PYTHONPATH+=:'/Users/kf/xsrc/shine/external'

# export PYTHONPATH= #clear, then add
# #used to be $PYDIR'bin/python'
# PYTHONPATH=''
# PYTHONPATH=$PYDIR'bin'
# PYTHONPATH+=:$PYDIR'lib/python2.5/site-packages/'

#for karen's site
# PYTHONPATH='/Users/kf/xsrc/wfsites/harmsvn/lib/python2.5/'
# PATH+=:'/Users/kf/xsrc/wfsites/harmsvn/lib/python2.5/django/bin/'
# PYTHONPATH+=:'/Users/kf/xsrc/wfsites/commonapps'
export PYTHONPATH


#komodo
alias ko='/Applications/Komodo IDE.app/Contents/MacOS/komodo-bin'

#go language
export GOROOT='/Users/kf/lib/go/'
export GOOS='darwin'
export GOARCH='386'
export GOBIN='/Users/kf/bin/go/'
PATH+=:$GOBIN

#komodo
alias ko='open -a "Komodo IDE"'


# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
#export PATH

# MacPorts Installer addition on 2009-11-18_at_21:53:00: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

##
# Your previous /Users/kf/.bash_profile file was backed up as /Users/kf/.bash_profile.macports-saved_2010-10-10_at_14:42:56
##

# MacPorts Installer addition on 2010-10-10_at_14:42:56: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

