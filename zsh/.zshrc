##### Starship #####
eval "$(starship init zsh)"

##### zsh-autocomplete #####
### Add at or near the top
# source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export LANG=ja_JP.UTF-8
export SUDO_EDITOR=nvim EDITOR=nvim VISUAL=nvim

##### History #####
HISTFILE=~/.zsh_history      # ヒストリファイルを指定
HISTSIZE=10000               # ヒストリに保存するコマンド数
SAVEHIST=10000               # ヒストリファイルに保存するコマンド数
setopt appendhistory
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを共有する
setopt append_history        # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
zstyle ':completion:*:default' menu select

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

##### ZLE: open buffer line in editor #####
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^O" edit-command-line

##### Suffix Aliases #####
alias -s md="bat"
alias -s lua"$EDITOR"

##### rbenv #####
if [[ -e /opt/homebrew/bin/rbenv ]]; then
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
fi

##### fzf #####
# hit C-r
source <(fzf --zsh)
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

##### zsh-syntax-highlighting #####
# Write at the end
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

##### zsh-fast-syntax-highlighting #####
# add the following at the end of your .zshrc:
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

##### bat #####
export BAT_THEME="Dracula"

##### diff #####
fzdiff() {
  local file
  file=$(diff -rq "$1" "$2" 2>/dev/null \
    | grep '^Files' \
    | fzf --preview 'diff $(echo {} | awk "{print \$2}") $(echo {} | awk "{print \$4}")') \
  && nvim -d $(echo "$file" | awk '{print $2, $4}')
}

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

##### PATH #####
# export PATH="/opt/homebrew/opt/git/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
# export PATH="/opt/homebrew/sbin:$PATH"
# export PATH="/opt/homebrew/bin:$PATH"

# export PATH="$PATH:/Users/hamu/go/bin"
# export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/Documents/py"
export PATH="$PATH:$HOME/Documents/Swift/bin"
export PATH="$PATH:$HOME/Documents/ShellScript"

typeset -U path PATH
