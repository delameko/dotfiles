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
#unalias run-help 2>/dev/null
#autoload run-help
#HELPDIR=/usr/local/share/zsh/helpfiles

# Include stuff unique to this machine
if [[ -r ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

