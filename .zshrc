# プロンプトカスタマイズ

eval "$(starship init zsh)"

# function left-prompt {
#   name_t='179m%}'            # user name text clolr
# # name_b='000m%}'            # user name background color
#   path_t='255m%}'            # path text clolr
#   path_b='031m%}'            # path background color
#   arrow='087m%}'             # arrow color
#   text_color='%{\e[38;5;'    # set text color
#   back_color='%{\e[30;48;5;' # set background color
#   reset='%{\e[0m%}'          # reset
#   sharp='\uE0B0'             # triangle

#   user="${back_color}${name_b}${text_color}${name_t}"
#   dir="${back_color}${path_b}${text_color}${path_t}"
# # echo "${user}%n%#@%m${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset} ${reset}"
#   echo "${dir}%~${reset}${text_color}${path_b}${sharp}${reset} ${reset}"
# }
# # PROMPT='
# # [%B%F{cyan}%n@%m%f%b:%F{green}%~%f]%F{cyan}%F{white}$%f '
# PROMPT=`left-prompt`

# "-F":ディレクトリに"/"を表示 / "-G"でディレクトリを色表示
# alias ls='ls -FG'
# alias ll='ls -alFG'
alias bu='brew update && brew upgrade && brew cleanup'
##### exa #####
alias ls='exa --icons'
alias ll='exa --icons -l'
alias la='exa --icons -la'
##### zoxide #####
alias cd='z'

# Enable Compsys
autoload -U compinit
compinit

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
##### zsh extensions #####
#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

##### fzf #####
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border \
--preview-window 'right:50%' \
--bind 'ctrl-/:change-preview-window(80%|hidden|)' \
--bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"
##### zoxide #####
eval "$(zoxide init zsh)"
