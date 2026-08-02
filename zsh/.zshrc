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

### Completion ###
if (( $+commands[brew] )); then
  fpath=("$(brew --prefix)/share/zsh-completions" $fpath)
  fpath=("$(brew --prefix)/share/zsh-abbr" $fpath)
fi

autoload -Uz compinit
compinit -u

zstyle ':completion:*:default' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ''

### ZLE: open buffer line in editor ###
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^O" edit-command-line

### Suffix Aliases ###
alias -s md="bat"
alias -s lua="$EDITOR"

### Alias ###
alias path='echo -e ${PATH//:/\\n}'
alias eza='eza --icons=always --color=always --time-style long-iso'
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
  --ansi
  --walker-skip='.git,Mobile Documents'
"

source <(fzf --zsh)
bindkey -r '^[c'
bindkey "^G" fzf-cd-widget

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

### bat ###
export BAT_THEME="Dracula"

### zoxide ###
eval "$(zoxide init zsh)"

### Zellij ###
export ZELLIJ_CONFIG_DIR="$HOME/.config/zellij"

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
ABBR_SET_LINE_CURSOR=1
export ABBR_USER_ABBREVIATIONS_FILE="$HOME/.dotfiles/zsh/abbreviations"

source "$BREW_PREFIX/share/zsh-abbr/zsh-abbr.zsh"
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$BREW_PREFIX/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

function zvm_after_init() {
  zvm_bindkey viins '^R' fzf-history-widget
  zvm_bindkey vicmd '^R' fzf-history-widget

  zvm_bindkey viins '^G' fzf-cd-widget
  zvm_bindkey vicmd '^G' fzf-cd-widget

  zvm_bindkey viins '^O' edit-command-line
  zvm_bindkey vicmd '^O' edit-command-line

  zvm_bindkey viins ' ' abbr-expand-and-insert
}

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
