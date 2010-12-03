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


# MacPorts Installer addition on 2009-11-18_at_21:53:00: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

## Custom prompt
# Colors
       RED="\[\033[0;31m\]"
      PINK="\[\033[1;31m\]"
    YELLOW="\[\033[1;33m\]"
     GREEN="\[\033[0;32m\]"
  LT_GREEN="\[\033[1;32m\]"
      BLUE="\[\033[0;34m\]"
     WHITE="\[\033[1;37m\]"
    PURPLE="\[\033[1;35m\]"
      CYAN="\[\033[1;36m\]"
     BROWN="\[\033[0;33m\]"
COLOR_NONE="\[\033[0m\]"

LIGHTNING_BOLT="⚡"
      UP_ARROW="↑"
    DOWN_ARROW="↓"
      UD_ARROW="↕"
      FF_ARROW="→"
       RECYCLE="♺"
        MIDDOT="•"
     PLUSMINUS="±"


function parse_git_branch {
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern_ahead="# Your branch is ahead of"
  remote_pattern_behind="# Your branch is behind"
  remote_pattern_ff="# Your branch (.*) can be fast-forwarded."
  diverge_pattern="# Your branch and (.*) have diverged"

  git_status="$(git status 2> /dev/null)"
  if [[ ! ${git_status} =~ ${branch_pattern} ]]; then
    # Rebasing?
    toplevel=$(git rev-parse --show-toplevel 2> /dev/null)
    [[ -z "$toplevel" ]] && return

    [[ -d "$toplevel/.git/rebase-merge" || -d "$toplevel/.git/rebase-apply" ]] && {
      sha_file="$toplevel/.git/rebase-merge/stopped-sha"
      [[ -e "$sha_file" ]] && {
        sha=`cat "${sha_file}"`
      }
      echo "${PINK}(rebase in progress)${COLOR_NONE} ${sha}"
    }
    return
  fi

  branch=${BASH_REMATCH[1]}

  # Dirty?
  if [[ ! ${git_status} =~ "working directory clean" ]]; then
    [[ ${git_status} =~ "modified:" ]] && {
      git_is_dirty="${RED}${LIGHTNING_BOLT}"
    }

    [[ ${git_status} =~ "Untracked files" ]] && {
      git_is_dirty="${git_is_dirty}${WHITE}${MIDDOT}"
    }

    [[ ${git_status} =~ "new file:" ]] && {
      git_is_dirty="${git_is_dirty}${LT_GREEN}+"
    }

    [[ ${git_status} =~ "deleted:" ]] && {
      git_is_dirty="${git_is_dirty}${RED}-"
    }

    [[ ${git_status} =~ "renamed:" ]] && {
      git_is_dirty="${git_is_dirty}${YELLOW}→"
    }
  fi

  # Are we ahead of, beind, or diverged from the remote?
  if [[ ${git_status} =~ ${remote_pattern_ahead} ]]; then
    remote="${YELLOW}${UP_ARROW}"
  elif [[ ${git_status} =~ ${remote_pattern_ff} ]]; then
    remote_ff="${WHITE}${FF_ARROW}"
  elif [[ ${git_status} =~ ${remote_pattern_behind} ]]; then
    remote="${YELLOW}${DOWN_ARROW}"
  elif [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}${UD_ARROW}"
  fi

  echo "${remote}${remote_ff}${GREEN}(${branch})${COLOR_NONE}${git_is_dirty}${COLOR_NONE}"
}

function setWindowTitle {
  case $TERM in
    *xterm*|ansi)
      echo -n -e "\033]0;$*\007"
      ;;
  esac
}

function set_prompt {

  git_prompt="$(parse_git_branch)"

  export PS1="[\w] ${git_prompt}${COLOR_NONE}\n\$ "

  # Domain is stripped from hostname
  case $HOSTNAME in
    adamv-desktop.local|Flangymobile08.local)
      this_host=
      ;;
    *)
      this_host="${HOSTNAME%%.*}:"
      ;;
  esac

  setWindowTitle "${this_host}${PWD/$HOME/~}"
}
export PROMPT_COMMAND=set_prompt

