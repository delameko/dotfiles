platform=${uname}

if [ -f ~/.bash/exports ]; then
    . ~/.bash/exports
fi

# Don't check mail
unset MAILCHECK

# Alias definitions.
if [ -f ~/.bash/aliases ]; then
    . ~/.bash/aliases
fi

# Custom prompt
if [ -f ~/.bash/prompt ]; then
    . ~/.bash/prompt
fi

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

[[ -s "/Users/mattslater/.rvm/scripts/rvm" ]] && source "/Users/mattslater/.rvm/scripts/rvm"

source ~/.nvm/nvm.sh

