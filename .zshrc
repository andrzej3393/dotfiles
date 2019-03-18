#history
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
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
    ansible
    aws
    bgnotify
    celery
    colorize
    command-not-found
    django
    docker-compose
    docker
    dotenv
    extract
    gem
    git
    git-prompt
    gitignore
    golang
    heroku
    kubectl
    minikube
    npm
    nvm
    pip
    pyenv
    python
    redis-cli
    ssh-agent
    sudo
    systemd
    terraform
    vagrant
    virtualenv
    virtualenvwrapper
    zsh_reload
	
    djui/alias-tips
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions src
    zsh-users/zsh-history-substring-search
EOB

antigen apply

#auto rehash
zstyle ":completion:*:commands" rehash 1

#aliases
alias ls='ls -lh --color=auto'
alias dc='docker-compose'

#vars
export BROWSER="firefox"
export EDITOR="nano"
export PATH=$PATH:~/.local/bin

#ruby
#export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

#show virtualenv name in prompt
unset VIRTUAL_ENV_DISABLE_PROMPT

#nvm
#source /usr/share/nvm/init-nvm.sh

#pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi
