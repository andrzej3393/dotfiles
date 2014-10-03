#history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_expire_dups_first
setopt inc_append_history
setopt share_history

# https://github.com/robbyrussell/oh-my-zsh/issues/1433
# works on ubuntu:
#bindkey "$terminfo[kcuu1]" history-search-backward
#bindkey "$terminfo[kcud1]" history-search-forward
# works on arch:
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

#misc
setopt autocd
unsetopt beep
setopt print_exit_value
setopt no_hup
setopt auto_cd

#keybindings
bindkey -e
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "\e[3~" delete-char

#completion
autoload -U compinit
compinit
setopt completealiases
zstyle ':completion:*' menu select
zstyle ':completion:*:functions:' ignored-patterns '_*'
zstyle ':completion:*' squeeze-slashes true
zstyle ":completion:*:commands" rehash 1

#prompt
autoload -U promptinit
promptinit
prompt elite2 green
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd () {vcs_info}
setopt prompt_subst
PS1="\$vcs_info_msg_0_$PS1"
chpwd() {
  [[ -o interactive ]] || return
  print -Pn "\e]2;%~\a"
}

#extract
ext () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2) tar -jxvf $1 ;;
            *.tar.gz) tar -zxvf $1 ;;
            *.bz2) bzip2 -d $1 ;;
            *.gz) gunzip -d $1 ;;
            *.tar) tar -xvf $1 ;;
            *.tgz) tar -zxvf $1 ;;
            *.tbz2) tar -xvzf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *.rar) unrar x $1 ;;
            *.xz) xz -d $1 ;;
            *) echo "'$1' Error." ;;
        esac
    else
        echo "'$1' is not valid!"
    fi
}
compdef '_files -g "*.{tar.bz2,tar.gz,bz2,gz,tar,tgz,tbz2,zip,Z,7z,rar,xz}"' ext

#aliases
alias ls='ls -lh --color=auto'

#vars
export BROWSER="firefox"
export EDITOR="nano"

#virtualenvwrapper
export WORKON_HOME=~/Venvs
source /usr/bin/virtualenvwrapper.sh
