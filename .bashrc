platform=${uname}

# Alias definitions.
if [ -f ~/.bash/aliases ]; then
  source ~/.bash/aliases
fi

# Export definitions
if [ -f ~/.bash/exports ]; then
  source ~/.bash/exports
fi

# Custom prompt
if [ -f ~/.bash/prompt ]; then
  source ~/.bash/prompt
fi

# Bashmarks (https://github.com/twerth/bashmarks)
if [ -f ~/.bash/script/bashmarks.sh ]; then
  source ~/.bash/script/bashmarks.sh
fi

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
. $HOME/.asdf/asdf.sh
