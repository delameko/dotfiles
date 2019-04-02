# History
export HISTCONTROL=ignorespace
export HISTFILE=~/.zsh_history
export HISTFILESIZE=200000
export HISTSIZE=100000
setopt HIST_IGNORE_ALL_DUPS # Ignore duplicates

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

