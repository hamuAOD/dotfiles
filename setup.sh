#!/bin/bash

LNOPT="-snv"
# LNOPT="-snvf"

### Zsh
ln $LM   "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ln $LM   "$HOME/.dotfiles/zsh/.zshenv" "$HOME/.zshenv"
### Zsh for Ubuntu
# ln $LNOPT "$HOME/.dotfiles/zsh/ubuntu.zshrc" "$HOME/.zshrc"
# ln $LNOPT "$HOME/.dotfiles/zsh/ubuntu.zshenv" "$HOME/.zshenv"
### VIm
ln $LNOPT "$HOME/.dotfiles/.vimrc" "$HOME/.vimrc"
ln $LNOPT "$HOME/.dotfiles/.gvimrc" "$HOME/.gvimrc"
ln $LNOPT "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
ln $LNOPT "$HOME/.dotfiles/nvim/syntax" "$HOME/.vim/syntax"
ln $LNOPT "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
### etc
ln $LNOPT "$HOME/.dotfiles/ssh/config" "$HOME/.ssh/"

### ~/.config : directorys
ln $LNOPT "$HOME/.dotfiles/borders" "$HOME/.config/borders"
ln $LNOPT "$HOME/.dotfiles/ghostty" "$HOME/.config/ghostty"
ln $LNOPT "$HOME/.dotfiles/goneovim" "$HOME/.config/goneovim"
ln $LNOPT "$HOME/.dotfiles/karabiner/complex_modifications" "$HOME/.config/karabiner/assets/complex_modifications"
ln $LNOPT "$HOME/.dotfiles/wezterm" "$HOME/.config/wezterm"
ln $LNOPT "$HOME/.dotfiles/yazi" "$HOME/.config/yazi"
ln $LNOPT "$HOME/.dotfiles/zonvie" "$HOME/.config/zonvie"
ln $LNOPT "$HOME/.dotfiles/lazygit" "$HOME/.config/lazygit"
ln $LNOPT "$HOME/.dotfiles/superfile" "$HOME/.config/superfile"
### ~/.config : files
ln $LNOPT "$HOME/.dotfiles/goneovim/settings.toml" "$HOME/.config/goneovim/settings.toml"
ln $LNOPT "$HOME/.dotfiles/herdr/config.toml" "$HOME/.config/herdr/config.toml"
ln $LNOPT "$HOME/.dotfiles/starship/starship.toml" "$HOME/.config/starship.toml"
ln $LNOPT "$HOME/.dotfiles/tmux/scripts" "$HOME/.config/tmux/scripts"
ln $LNOPT "$HOME/.dotfiles/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
