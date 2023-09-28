# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="/Users/hamu/dotfiles/starship.toml"

# zsh-autocomplete
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Alias
alias bu='brew update && brew upgrade && brew cleanup'
##### exa #####
alias ls='exa --icons'
alias ll='exa --icons -l'
alias la='exa --icons -la'
##### zoxide #####
alias cd='z'
##### 7-zip #####
alias 7za='7zz a -ba -t7z -xr'\''!.*'\'''
alias 7zx='7zz x'

# Enable Compsys
#autoload -U compinit
#compinit

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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border \
--preview-window 'right:50%' \
--bind 'ctrl-/:change-preview-window(80%|hidden|)' \
--bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"
##### zoxide #####
eval "$(zoxide init zsh)"

##### zsh extensions #####
# zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi
# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-syntax-highlighting
# Write at the end
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

