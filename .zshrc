#history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
setopt appendhistory autocd

#misc
unsetopt beep
setopt print_exit_value

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

#prompt
autoload -U promptinit
promptinit
prompt elite2 green
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
alias buspirate='screen /dev/ttyUSB0 115200 8N1'

#vars
export BROWSER="firefox"
export EDITOR="nano"
