#!/bin/bash

LNOPT="-snv"
# LNOPT="-snvf"
DOTDIR="$HOME/.dotfiles"

### Zsh
ln $LNOPT "$DOTDIR/zsh/.zshrc"  "$HOME/.zshrc"
ln $LNOPT "$DOTDIR/zsh/.zshenv" "$HOME/.zshenv"
### Vim
ln $LNOPT "$DOTDIR/vim/.vimrc"  "$HOME/.vimrc"
ln $LNOPT "$DOTDIR/vim/.gvimrc" "$HOME/.gvimrc"
ln $LNOPT "$DOTDIR/nvim"        "$HOME/.config/nvim"
ln $LNOPT "$DOTDIR/nvim/syntax" "$HOME/.vim/syntax"
### etc
# ln $LNOPT "$DOTDIR/ssh/config"  "$HOME/.ssh/"

### ~/.config : directories
ln $LNOPT "$DOTDIR/borders"     "$HOME/.config/borders"
ln $LNOPT "$DOTDIR/ghostty"     "$HOME/.config/ghostty"
ln $LNOPT "$DOTDIR/goneovim"    "$HOME/.config/goneovim"
ln $LNOPT "$DOTDIR/wezterm"     "$HOME/.config/wezterm"
ln $LNOPT "$DOTDIR/yazi"        "$HOME/.config/yazi"
ln $LNOPT "$DOTDIR/zonvie"      "$HOME/.config/zonvie"
ln $LNOPT "$DOTDIR/lazygit"     "$HOME/.config/lazygit"
ln $LNOPT "$DOTDIR/superfile"   "$HOME/.config/superfile"
ln $LNOPT "$DOTDIR/zabrze"      "$HOME/.config/zabrze"
ln $LNOPT "$DOTDIR/karabiner/complex_modifications" "$HOME/.config/karabiner/assets/complex_modifications"

### ~/.config : files
ln $LNOPT "$DOTDIR/goneovim/settings.toml" "$HOME/.config/goneovim/settings.toml"
ln $LNOPT "$DOTDIR/herdr/config.toml"      "$HOME/.config/herdr/config.toml"
ln $LNOPT "$DOTDIR/starship/starship.toml" "$HOME/.config/starship.toml"
ln $LNOPT "$DOTDIR/tmux/scripts"           "$HOME/.config/tmux/scripts"
ln $LNOPT "$DOTDIR/tmux/tmux.conf"         "$HOME/.config/tmux/tmux.conf"
