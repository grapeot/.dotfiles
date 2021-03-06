source ~/.dotfiles/.zshrc_common

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git debian command-not-found coffee npm node python redis-cli tmux vagrant web-search)

alias ls='ls --color=auto -h'
alias rm='trash-put'
alias open='xdg-open'
alias grep='grep -P'

PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export TERM=xterm-256color
export PKG_CONFIG_PATH
export LD_LIBRARY_PATH="$HOME/.vim/bundle/gdbmgr/gdbmgr/src:default"
export POWERLINE_ROOT=/usr/local/lib/python2.7/dist-packages/powerline
