##### Starship #####
eval "$(starship init zsh)"
export STARSHIP_CONFIG="${HOME}/dotfiles/starship.toml"

##### zsh-autocomplete #####
### Add at or near the top
# source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

setopt hist_ignore_dups  # 同じコマンドを履歴に残さない
setopt share_history     # 同時に起動したzshで履歴を共有する

##### ZLE #####
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^O" edit-command-line

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
# export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
# export FZF_DEFAULT_COMMAND='fd --type file --hidden --follow --exclude .git --color=always'
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS="--height 50% --ansi --layout=reverse --border \
--preview-window 'right:50%' \
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4 \
--bind 'ctrl-/:change-preview-window(80%|hidden|)' \
--bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"

##### yazi #####
function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

##### zoxide #####
eval "$(zoxide init zsh)"
##### Zellij #####
export ZELLIJ_CONFIG_DIR="/Users/hamu/.config/zellij"
##### zabrze #####
eval "$(zabrze init --bind-keys)"

##### zsh-autosuggestions #####
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# bindkey '\t' end-of-line

##### zsh-completions #####
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

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
