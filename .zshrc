#history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_expire_dups_first
setopt inc_append_history
setopt share_history

#antigen part
source ~/.antigen/antigen.zsh

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
EOB

antigen apply

#auto rehash
zstyle ":completion:*:commands" rehash 1

#aliases
alias ls='ls -lh --color=auto'
alias subl='subl3'

#vars
export BROWSER="firefox"
export EDITOR="nano"
export PYTHONSTARTUP="$HOME/.pythonrc.py"
export PATH=$PATH:~/.local/bin

#huawei e3131 modem
alias huawei='sudo usb_modeswitch -J -v 12d1 -p 1f01'

#thefuck
alias fuck='$(thefuck $(fc -ln -1))'
