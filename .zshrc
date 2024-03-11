# History
export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTFILE=~/.zsh_history
export HISTFILESIZE=40000
export HISTSIZE=20000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS # Ignore duplicates
setopt histignorealldups
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE # Ignore lines starting with a space
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
export SAVEHIST=10000
setopt SHARE_HISTORY

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
    alias clr="clear && printf '\033[3J'"
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

