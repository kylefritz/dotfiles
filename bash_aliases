#bash aliases


alias edit=$EDITOR
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
alias clever=$EDITOR' ~/.bashrc;source ~/.bashrc'
alias hints="ls ~/.kpfscripts"
alias cd="pushd $@ > /dev/null" #replace cd with pushd
alias popd="popd > /dev/null" #make popd silent in bash
alias p="popd"
alias prev="popd"
alias si='svn propedit svn:ignore'


