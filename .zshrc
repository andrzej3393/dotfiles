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
source /usr/share/zsh/scripts/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundles <<EOB
	git-prompt
	pip
	command-not-found
	extract
	archlinux
	ssh-agent
	sudo
	systemd
#	virtualenv
	virtualenvwrapper
	vagrant
	
	zsh-users/zsh-syntax-highlighting
	zsh-users/zsh-completions src
	zsh-users/zsh-history-substring-search
    unixorn/autoupdate-antigen.zshplugin
EOB

antigen apply

#auto rehash
zstyle ":completion:*:commands" rehash 1

#aliases
alias ls='ls -lah --color=auto'

#vars
export BROWSER="firefox"
export EDITOR="nano"
export PATH=$PATH:~/.local/bin

#golang
export GOPATH=$HOME/go:/usr/lib/go
export PATH=$PATH:$GOPATH/bin
