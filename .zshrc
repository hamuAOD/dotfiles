##### Starship #####
eval "$(starship init zsh)"
export STARSHIP_CONFIG="${HOME}/dotfiles/starship.toml"

##### zsh-autocomplete #####
### Add at or near the top
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# export TERM='xterm-256color'
export TERM=alacritty

setopt hist_ignore_dups  # 同じコマンドを履歴に残さない
setopt share_history     # 同時に起動したzshで履歴を共有する

##### Alias #####
alias cl='clear'
alias ex='exit'
alias cp='cp -v'
alias bu='brew update && brew upgrade && brew cleanup'
alias v='vim'
alias vf='vim $(fzf)'
alias nv='nvim'
alias nvf='nvim $(fzf)'
alias nvcd='nvim ~/Music/CD'
alias nvc='nvim ${HOME}/.config/nvim'
alias fd='fd -H'
alias rm='rm -rf'
alias gotopb='gotop -l battery'
alias ttyc='tty-clock -sc'
alias lg='lazygit'
##### eza #####
alias ls='eza --icons=always'
alias ll='eza --icons=always -l'
alias la='eza --icons=always -la'
##### GO #####
alias gobld='go build -ldflags="-s -w" -trimpath'
alias goimp='goimports -l -w'
##### Zellij #####
export ZELLIJ_CONFIG_DIR="/Users/hamu/.config/zellij"
# export ZELLIJ_CONFIG_FILE="/Users/hamu/.config/zellij/config.kdl"
alias zj='zellij'
##### 7-zip #####
alias 7za='7zz a -ba -t7z -xr'\''!.*'\'''
alias 7zx='7zz x'

export PATH="$PATH:/Users/hamu/.local/bin"
export PATH="$PATH:/Users/hamu/go/bin"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/git/bin:$PATH"

##### rbenv #####
if [[ -e /opt/homebrew/bin/rbenv ]]; then
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
fi
##### pyenv #####
if [[ -e /opt/homebrew/bin/pyenv ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/shims:$PATH"
  eval "$(pyenv init -)"
fi

##### fzf #####
# hit C-r
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

eval "$(fzf --zsh)"
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border \
--preview-window 'right:50%' \
--bind 'ctrl-/:change-preview-window(80%|hidden|)' \
--bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"

##### yazi #####
alias yz='yazi'
function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

##### zoxide #####
alias cd='z'
eval "$(zoxide init zsh)"

##### zsh-autosuggestions #####
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# bindkey '\t' end-of-line

##### zsh-completions #####
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

##### zsh-syntax-highlighting #####
# Write at the end
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

##### zsh-fast-syntax-highlighting #####
# add the following at the end of your .zshrc:
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

##### 設定ファイルの追加読み込み #####
ZSH_DIR="${HOME}/.zsh.d"
# .zshがディレクトリで、読み取り、実行、が可能なとき
if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
  # zshディレクトリより下にある、.zshファイルの分、繰り返す
  for file in ${ZSH_DIR}/*.zsh; do
    # 読み取り可能ならば実行する
    [ -r $file ] && source $file
  done
fi
