export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(asdf)

. /opt/asdf-vm/asdf.sh
. ~/.asdf/plugins/golang/set-env.zsh
. ~/.asdf/plugins/java/set-java-home.zsh
. ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

# Use fzf to open files in Vim
f() {
  local file

  # Check if tmux is running
  if [ -n "$TMUX" ]; then
    # tmux is running, open file in a new tmux pane
    file=$(fzf --preview 'bat --style=numbers --color=always {}' --preview-window=up:60%:wrap) && tmux split-window -h "nvim $file"
  else
    # tmux is not running, open file in Vim directly
    file=$(fzf --preview 'bat --style=numbers --color=always {}' --preview-window=up:60%:wrap) && nvim "$file"
  fi
}

alias vim="nvim"
alias vimc="cd ~/.config/nvim && vim ."
alias tokens="cat ~/Documents/tokens/github_tokens.txt"
alias t="tty-clock -f %d-%m-%y -cC 3"
alias mtx="unimatrix -c magenta"
alias diskspace="df -h /dev/sdb7"

source .xinitrc

source $ZSH/oh-my-zsh.sh

source ~/scripts/shell_init.sh
