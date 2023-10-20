# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="/Users/hamu/dotfiles/starship.toml"

# zsh-autocomplete
### Add at or near the top
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Alias
alias bu='brew update && brew upgrade && brew cleanup'
alias v='nvim'
alias vcd='nvim ~/Music/CD'
alias fd='fd -H'
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

##### iTerm2 #####
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

##### zsh extensions #####
# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
# Write at the end
#source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-fast-syntax-highlighting
#add the following at the end of your .zshrc:
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
