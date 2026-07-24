### PATH ###
typeset -U path PATH

path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$HOME/.deno/bin"
  $path
)
# export PATH="$HOME/.deno/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.deno/bin:$PATH

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
autoload -Uz compinit
compinit

zstyle ':completion:*:default' menu select              # 補完候補をメニュー選択
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # 小文字でも大文字にマッチ
zstyle ':completion:*' list-colors ''                   # 補完候補をカラー表示

### ZLE: open buffer line in editor ###
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^O" edit-command-line

### Starship ###
eval "$(starship init zsh)"

### zoxide ###
eval "$(zoxide init zsh)"

### fzf ###
# C-r : history
# C-t : insert File/Directory
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

export FZF_DEFAULT_OPTS="
  --height=50%
  --layout=reverse
  --border
  --ansi
"
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

### function ###
tcopy() {
  printf "\033]52;c;%s\a" "$(base64 -w0 | tr -d '\n')"
}

### bat ###
export BAT_THEME='Dracula'

### nvm ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm

### Alias ###
alias eza='eza --icons=always --color=always --time-style long-iso'

### Plugins ###
##### zsh-abbr #####
ABBR_SET_LINE_CURSOR=1
source ~/.zsh/zsh-abbr/zsh-job-queue/zsh-job-queue.zsh
export ABBR_USER_ABBREVIATIONS_FILE="$HOME/.dotfiles/zsh/abbreviations"
source ~/.zsh/zsh-abbr/zsh-abbr.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-vi-mode/zsh-vi-mode.zsh

function zvm_after_init() {
  zvm_bindkey viins '^R' fzf-history-widget
  zvm_bindkey vicmd '^R' fzf-history-widget

  zvm_bindkey viins '^G' fzf-cd-widget
  zvm_bindkey vicmd '^G' fzf-cd-widget

  zvm_bindkey viins '^O' edit-command-line
  zvm_bindkey vicmd '^O' edit-command-line

  zvm_bindkey viins ' ' abbr-expand-and-insert
}

##################################################
# Ubuntu package
# sudo apt install fzf bat zoxide

# Plugin install
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting
# git clone https://github.com/olets/zsh-abbr ~/.zsh/zsh-abbr
# git clone https://github.com/olets/zsh-abbr --recurse-submodules --single-branch --branch main --depth 1 ~/.zsh/zsh-abbr
# git clone https://github.com/jeffreytse/zsh-vi-mode ~/.zsh/zsh-vi-mode
