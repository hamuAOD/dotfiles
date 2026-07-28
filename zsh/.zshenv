export LANG=ja_JP.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"

case "$(uname -s)" in
  Darwin)
    export EDITOR=/opt/homebrew/bin/nvim
    ;;
  Linux)
    export EDITOR=/home/linuxbrew/.linuxbrew/bin/nvim
    ;;
  *)
    export EDITOR=nvim
    ;;
esac

export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"
