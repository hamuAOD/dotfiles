### Platform ###
case "$(uname -s)" in
  Darwin)
    BREW_PREFIX="/opt/homebrew"
    ;;
  Linux)
    BREW_PREFIX="/home/linuxbrew/.linuxbrew"
    ;;
  *)
    BREW_PREFIX=""
    ;;
esac

### PATH ###
typeset -U path PATH

path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$HOME/.deno/bin"
  $path
)

if [[ -n "$BREW_PREFIX" && -x "$BREW_PREFIX/bin/brew" ]]; then
  eval "$("$BREW_PREFIX/bin/brew" shellenv)"
fi

### History ###
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
setopt append_history
setopt hist_no_store
setopt hist_reduce_blanks

### zsh-completion ###
if (( $+commands[brew] )); then
  fpath=("$(brew --prefix)/share/zsh-completions" $fpath)
  fpath=("$(brew --prefix)/share/zsh-abbr" $fpath)
fi

autoload -Uz compinit
compinit -u

# 選択メニューを表示
zstyle ':completion:*:default' menu select
# smart-case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# 01 = 太字・高輝度、34 = 青系パレット
zstyle ':completion:*' list-colors 'di=01;34'

### ZLE: open buffer line in editor ###
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^O" edit-command-line

autoload -Uz zmv

### Variables ***
ICLOUD_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
IOBSIDIAN_DIR="$HOME/Library/Mobile Documents/iCloud~md~obsidian"

### Suffix Aliases ###
alias -s md="bat"
alias -s lua="$EDITOR"

### Alias ###
# alias path='echo -e ${PATH//:/\\n}'
alias path='print -l ${(s/:/)PATH}'
alias eza='eza --icons=always --color=always --time-style long-iso'
alias hl="rg --passthru"
if (( $+commands[gdu-go] )); then
  alias gdu='gdu-go'
  alias gnudu='/opt/homebrew/bin/gdu'
fi

### Prompt: Starship ###
eval "$(starship init zsh)"

### rbenv ###
if (( $+commands[rbenv] )); then
  eval "$(rbenv init -)"
fi

### fzf ###
export FZF_DEFAULT_OPTS="
  --height=50%
  --layout=reverse
  --border
  --cycle
  --ansi
  --walker-skip='.git,Mobile Documents'
"
FZF_FD_OPTS='--hidden \
  --exclude .Trash \
  --exclude .cache \
  --exclude .git \
  --exclude .pyenv \
  --exclude .rustup \
  --exclude .tldrc \
  --exclude .vscode \
  --exclude Library \
  --exclude node_modules'

export FZF_DEFAULT_COMMAND="fd $FZF_FD_OPTS . ~/"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d $FZF_FD_OPTS . ~/"

source <(fzf --zsh)
bindkey -r '^[c'
bindkey "^G" fzf-cd-widget

zf() {
  local dir
  dir=$(eval "$FZF_ALT_C_COMMAND" | fzf) || return
  cd "$dir"
}

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
yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

### nvim ###
nvimmdp() {
  local rpane_id

  if [[ ${HERDR_ENV:-} != 1 ]]; then
    print -u2 'nvimmdp: not running inside Herdr'
    return 1
  fi

  rpane_id=$(herdr pane split --direction right --cwd "$PWD" | jq -er '.result.pane.pane_id') || return 1
  herdr pane run "$rpane_id" env -C "$PWD" leaf -w "$1" || return 1
  nvim "$1"
  herdr pane close "$rpane_id" || return 1
}

### bat ###
export BAT_THEME="Dracula"

### Zabrze ###
eval "$(zabrze init --bind-keys)"
# brew install ryooooooga/tap/zabrze

### Zoxide ###
eval "$(zoxide init zsh)"

### for Linux only ###
if [[ "$(uname -s)" == "Linux" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

  tcopy() {
    printf "\033]52;c;%s\a" "$(base64 -w0 | tr -d '\n')"
  }
fi

### Command Alias ###
alias ytdh="$HOME/Documents/ShellScript/ytd.sh --hd"
alias ytd4="$HOME/Documents/ShellScript/ytd.sh --4k"
alias ytda="$HOME/Documents/ShellScript/ytd.sh --aud"

### My Functions ###
7zc() {
  if [[ -z "${1:-}" ]]; then
    echo "Usage: 7zc <source> [output.7z] [7-Zip options]"
    return 1
  fi

  local source="$1"
  shift

  local output="${source%/}.7z"

  if [[ "${1:-}" == *.7z ]]; then
    output="$1"
    shift
  fi

  7zz a -t7z "$@" "$output" "$source"
}

### Plugins ###
# ABBR_SET_LINE_CURSOR=1
# export ABBR_USER_ABBREVIATIONS_FILE="$HOME/.dotfiles/zsh/abbreviations"
# source "$BREW_PREFIX/share/zsh-abbr/zsh-abbr.zsh"
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$BREW_PREFIX/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

function zvm_after_init() {
  zvm_bindkey viins '^R' fzf-history-widget
  zvm_bindkey vicmd '^R' fzf-history-widget

  zvm_bindkey viins '^G' fzf-cd-widget
  zvm_bindkey vicmd '^G' fzf-cd-widget

  zvm_bindkey viins '^F' fzf-file-widget

  zvm_bindkey viins '^O' edit-command-line
  zvm_bindkey vicmd '^O' edit-command-line

  # zvm_bindkey viins ' ' abbr-expand-and-insert
  zvm_bindkey viins ' ' __zabrze::expand-and-self-insert
  # shift + Tab
  zvm_bindkey viins $'\e[Z' reverse-menu-complete
}

source "$HOME/.dotfiles/zsh/widgets.zsh"

### zsh-syntax-highlighting ###
source "$HOME/.dotfiles/zsh/themes/dracula-zsh-syntax-highlighting.zsh"

ZSH_HIGHLIGHT_STYLES[path]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#BD93F9'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#BD93F9'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#8BE9FD'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#8BE9FD'

source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

### Additional config ###
ZSH_DIR="${HOME}/.zsh.d"
if [[ -d "$ZSH_DIR" && -r "$ZSH_DIR" && -x "$ZSH_DIR" ]]; then
  for file in "$ZSH_DIR"/*.zsh(N); do
    [[ -r "$file" ]] && source "$file"
  done
fi
