# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
#ZSH_THEME="robbyrussell"
ZSH_THEME="kylefritz"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate osx ruby rails3 rvm brew bundler gem github heroku node npm pow powder redis-cli)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/kyle/.rvm/bin::/Users/kyle/.dotfiles:/Users/kyle/bin:/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/lib:/usr/local/include:/usr/local/typesafe-stack/bin:/usr/local/git/bin
