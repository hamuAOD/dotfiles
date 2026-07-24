### PATH ###
typeset -U path PATH

path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "/opt/homebrew/opt/curl/bin"
  $path
)

### History ###
HISTFILE=~/.zsh_history      # ヒストリファイルを指定
HISTSIZE=10000               # ヒストリに保存するコマンド数
SAVEHIST=10000               # ヒストリファイルに保存するコマンド数
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを共有する
setopt append_history        # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録

### Completion ###
##### zsh-completions #####
#if type brew &>/dev/null; then
if (( $+commands[brew] )); then
  fpath=("$(brew --prefix)/share/zsh-completions" $fpath)
fi

autoload -Uz compinit
compinit

zstyle ':completion:*:default' menu select              # 補完候補をメニュー選択
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # 小文字でも大文字にマッチ
zstyle ':completion:*' list-colors ''                   # 補完候補をカラー表示

### ZLE: open buffer line in editor ###
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^O" edit-command-line

### Suffix Aliases ###
alias -s md="bat"
alias -s lua="$EDITOR"

### alias ###
alias path='echo -e ${PATH//:/\\n}'

### Prompt: Starship ###
eval "$(starship init zsh)"

### rbenv ###
if (( $+commands[rbenv] )); then
  eval "$(rbenv init -)"
fi

### fzf ###
# C-r : history
# C-t : insert File/Directory
export FZF_DEFAULT_OPTS="
  --height=50%
  --layout=reverse
  --border
  --ansi
  --walker-skip='.git,Mobile Documents'
"
source <(fzf --zsh)
bindkey -r '^[c'
bindkey "^G" fzf-cd-widget
##### diff #####
fzdiff() {
  local file
  file=$(
    diff -rq "$1" "$2" 2>/dev/null |
      grep '^Files' |
      fzf \
        --preview='diff $(awk "{print \$2}" <<< {}) $(awk "{print \$4}" <<< {})' \
        --preview-window='right:50%' \
        --bind='ctrl-u:preview-half-page-up' \
        --bind='ctrl-d:preview-half-page-down'
  ) || return
  nvim -d $(awk '{print $2, $4}' <<< "$file")
}

### yazi ###
function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

### bat ###
export BAT_THEME="Dracula"
### zoxide ###
eval "$(zoxide init zsh)"
### Zellij ###
export ZELLIJ_CONFIG_DIR="$HOME/.config/zellij"
### Zabrze ###
# eval "$(zabrze init --bind-keys)"

### 設定ファイルの追加読み込み ###
ZSH_DIR="${HOME}/.zsh.d"
# .zshがディレクトリで、読み取り、実行、が可能なとき
if [ -d "$ZSH_DIR" ] && [ -r "$ZSH_DIR" ] && [ -x "$ZSH_DIR" ]; then
  # zshディレクトリより下にある、.zshファイルの分、繰り返す
  for file in "$ZSH_DIR"/*.zsh(N); do
    # 読み取り可能ならば実行する
    [ -r "$file" ] && source "$file"
  done
fi

### Alias ###
alias eza='eza --icons=always --color=always --time-style long-iso'

### Command Alias ###
alias ytdh='$HOME/Documents/ShellScript/ytd.sh --hd'
alias ytd4='$HOME/Documents/ShellScript/ytd.sh --4k'
alias ytda='$HOME/Documents/ShellScript/ytd.sh --aud'

### Plugins ###
##### zsh-abbr #####
ABBR_SET_LINE_CURSOR=1
export ABBR_USER_ABBREVIATIONS_FILE="$HOME/.dotfiles/zsh/abbreviations"
source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh
##### zsh-autosuggestions #####
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# bindkey '\t' end-of-line
##### zsh-syntax-highlighting #####
# Write at the end
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
##### zsh-fast-syntax-highlighting #####
# add the following at the end of your .zshrc:
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
##### zsh-vi-mode #####
source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

function zvm_after_init() {
  zvm_bindkey viins '^R' fzf-history-widget
  zvm_bindkey vicmd '^R' fzf-history-widget

  zvm_bindkey viins '^G' fzf-cd-widget
  zvm_bindkey vicmd '^G' fzf-cd-widget

  zvm_bindkey viins '^O' edit-command-line
  zvm_bindkey vicmd '^O' edit-command-line

  zvm_bindkey viins ' ' abbr-expand-and-insert
}

### Plugin install ###
# brew install zsh-autosuggestions zsh-fast-syntax-highlighting zsh-vi-mode olets/tap/zsh-abbr
