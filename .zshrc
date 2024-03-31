export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="evan"

plugins=(asdf)

. /opt/asdf-vm/asdf.sh
. ~/.asdf/plugins/golang/set-env.zsh
. ~/.asdf/plugins/java/set-java-home.zsh
. ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

f() {
  local file

  # Check if tmux is running
  if [ -n "$TMUX" ]; then
    # tmux is running, open file in Vim directly
    file=$(fzf --preview 'bat --style=numbers --color=always {}' --preview-window=up:60%:wrap)
    if [ -n "$file" ]; then
      export FZF_DIR=$(dirname "$file")
      nvim -c "cd \"$FZF_DIR\"" "$file"
      cd "$FZF_DIR"  # Change directory after Neovim exits
    fi
  else
    # tmux is not running, run tmux and then call f
    file=$(fzf --preview 'bat --style=numbers --color=always {}' --preview-window=up:60%:wrap)
    if [ -n "$file" ]; then
      export FZF_DIR=$(dirname "$file")
      tmux new-session -d "cd \"$FZF_DIR\"" && tmux attach 
    fi
  fi
}

# asdf shims aliases
alias npm="asdf exec npm"
alias cargo="asdf exec cargo"
alias dotnet="asdf exec dotnet"
alias pip="asdf exec pip"
alias luarocks="asdf exec luarocks"

# other aliases
alias vim="nvim"
alias vimc="cd ~/.config/nvim && vim ."
alias tokens="cat ~/Documents/tokens/github_tokens.txt"
alias t="tty-clock -f %d-%m-%y -cC 3"
alias mtx="unimatrix -c magenta"
alias diskspace="df -h /dev/sdb7"
alias ls='ls --color=never'
alias tnc="tmux neww -c '$PWD'"

source .xinitrc

source $ZSH/oh-my-zsh.sh

source ~/scripts/shell_init.sh
