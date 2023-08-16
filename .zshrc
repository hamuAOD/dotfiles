# default:cyan / root:red
#if [ $UID -eq 0 ]; then
#    PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
#else
#    PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
#fi

autoload -Uz colors
colors

# プロンプトカスタマイズ
function left-prompt {
  name_t='179m%}'            # user name text clolr
# name_b='000m%}'            # user name background color
  path_t='255m%}'            # path text clolr
  path_b='031m%}'            # path background color
  arrow='087m%}'             # arrow color
  text_color='%{\e[38;5;'    # set text color
  back_color='%{\e[30;48;5;' # set background color
  reset='%{\e[0m%}'          # reset
  sharp='\uE0B0'             # triangle

  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
# echo "${user}%n%#@%m${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset} ${reset}"
  echo "${dir}%~${reset}${text_color}${path_b}${sharp}${reset} ${reset}"
}
# PROMPT='
# [%B%F{cyan}%n@%m%f%b:%F{green}%~%f]%F{cyan}%F{white}$%f '
PROMPT=`left-prompt`

# "-F":ディレクトリに"/"を表示 / "-G"でディレクトリを色表示
alias ls='ls -FG'
alias ll='ls -alFG'
alias bu='brew update && brew upgrade && brew cleanup'
##### exa #####
alias exa='exa --icons'
alias el='exa -l --icons'
alias ea='exa -la --icons'
##### zoxide #####
alias cd='z'

# Enable Compsys
autoload -U compinit
compinit

if [[ "$(uname -m)" == arm64 ]]; then
  # arm64
  export PATH="/opt/homebrew/bin:$PATH"
  export PATH="/opt/homebrew/sbin:$PATH"
  export PATH="/opt/homebrew/opt/curl/bin:$PATH"
  export PATH="/opt/homebrew/opt/git/bin:$PATH"
else
  # x86_64
  export PATH="/usr/local/bin:$PATH"
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/usr/local/opt/curl/bin:$PATH"
  export PATH="/usr/local/opt/git/bin:$PATH"
fi

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
