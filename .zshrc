export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git, asdf)

. /opt/asdf-vm/asdf.sh
. ~/.asdf/plugins/golang/set-env.zsh
. ~/.asdf/plugins/java/set-java-home.zsh
. ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

alias vim="nvim"
alias vimc="cd ~/.config/nvim && vim ."
alias tokens="cat ~/personal/github_tokens.txt"
alias t="tty-clock -f %d-%m-%y -cC 3"
alias mtx="unimatrix -c magenta"
alias sds="df -h /dev/sdb7"

source .xinitrc

source $ZSH/oh-my-zsh.sh
