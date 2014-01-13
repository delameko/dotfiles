# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(sublime)

source $ZSH/oh-my-zsh.sh

# Shared history
setopt inc_append_history
setopt share_history

# Enable online help
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# Include stuff that should only be on this
if [[ -r ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

# Path concat
#PATH_RUBY=$HOME/.rvm/rubies/ruby-2.1.0/bin:$HOME/.rvm/gems/ruby-2.1.0@gemset/bin:$HOME/.rvm/gems/ruby-2.1.0@global/bin
#PATH_BREW=/usr/local/bin:/usr/local/sbin
#PATH_GRES=/Applications/Postgres.app/Contents/MacOS
#PATH_NPM=/usr/local/share/npm/bin
#PATH_EC2=$HOME/.ec2/bin
#PATH_RVM=$HOME/.rvm/bin
#PATH=$PATH_RUBY:$PATH_BREW:$PATH_GRES:$PATH_NPM:/usr/bin:/bin:/usr/sbin:/sbin:$PATH_EC2:$PATH_RVM

