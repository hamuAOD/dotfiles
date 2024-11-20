#!/bin/bash

directory="/Users/hamu"

ln -sf "$directory/dotfiles/.vimrc" "$directory/.vimrc"
ln -sf "$directory/dotfiles/.gvimrc" "$directory/.gvimrc"
ln -sf "$directory/dotfiles/nvim/syntax" "$directory/.vim/syntax"
ln -sf "$directory/dotfiles/nvim" "$directory/.config/nvim"

ln -sf "$directory/dotfiles/.zshrc" "$directory/.zshrc"
ln -sf "$directory/dotfiles/.zshenv" "$directory/.zshenv"
ln -sf "$directory/dotfiles/wezterm" "$directory/.config/wezterm"

ln -sf "$directory/dotfiles/.warp" "$directory/.warp"
ln -sf "$directory/dotfiles/alacritty" "$directory/.config/alacritty"
ln -sf "$directory/dotfiles/yazi" "$directory/.config/yazi"
ln -sf "$directory/dotfiles/karabiner.json" "$directory/.config/karabiner/karabiner.json"
ln -sf "$directory/dotfiles/zabrze" "$directory/.config/zabrze"
