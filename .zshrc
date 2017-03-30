#history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_expire_dups_first
setopt inc_append_history
setopt share_history

#bashcompinit
autoload bashcompinit
bashcompinit

#antigen part
source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh
antigen bundles <<EOB
    adb
    bgnotify
    celery
    command-not-found
    django
    extract
    git
    git-prompt
    gitignore
    heroku
    httpie
    pip
    python
    ssh-agent
    sudo
    supervisor
    systemd
    vagrant
    virtualenv
    virtualenvwrapper
	
    djui/alias-tips
    supercrabtree/k
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions
    zsh-users/zsh-history-substring-search
EOB

antigen apply

#auto rehash
zstyle ":completion:*:commands" rehash 1

#aliases
alias ls='ls -lh --color=auto'

#vars
export BROWSER="firefox"
export EDITOR="nano"
export PATH=$PATH:~/.local/bin

#golang
export GOPATH=$HOME/go:/usr/lib/go
export PATH=$PATH:$GOPATH/bin
