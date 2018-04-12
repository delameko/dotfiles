# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="delameko"

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
plugins=(mix)

source $ZSH/oh-my-zsh.sh

# Increase size of history
export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTFILE=~/.zsh_history

# Ignore duplicates
setopt HIST_IGNORE_ALL_DUPS

# Shared history
setopt inc_append_history
setopt share_history

# Enable online help
unalias run-help 2>/dev/null
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

###########
# ALIASES #
###########
if [[ "$(uname)" -eq "Darwin" ]]; then
    alias install='brew install'
    alias list='brew list'
    alias remove='brew uninstall'
    alias search='brew search'
    alias update='brew update'
    alias upgrade='brew upgrade'
elif [[ "$(uname)" -eq "Linux" ]]; then
    alias install='sudo aptitude install'
    alias list='dpkg --list'
    alias remove='sudo aptitude remove'
    alias search='sudo aptitude search'
    alias update='sudo aptitude update'
    alias upgrade='sudo aptitude upgrade'
fi


# Include stuff unique to this machine
if [[ -r ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

