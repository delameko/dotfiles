# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

setopt inc_append_history
setopt share_history

# Path concat
PATH_BREW=/usr/local/bin:/usr/local/sbin
PATH_RUBY=$HOME/.rvm/gems/ruby-2.0.0-p247@gemset/bin:$HOME/.rvm/gems/ruby-2.0.0-p247@global/bin:$HOME/.rvm/rubies/ruby-2.0.0-p247/bin:$HOME/.rvm/bin
PATH_GRES=/Applications/Postgres.app/Contents/MacOS
PATH_NPM=/usr/local/share/npm/bin
PATH_EC2=/Users/mattslater/.ec2/bin
export PATH=$PATH_BREW:$PATH_RUBY:$PATH_GRES:$PATH_NPM:/usr/bin:/bin:/usr/sbin:/sbin:$PATH_EC2
