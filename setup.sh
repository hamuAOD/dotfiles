#!/bin/bash

directory="/Users/hamu"

ln -sf "$directory/dotfiles/.vimrc" "$directory/.vimrc"
ln -sf "$directory/dotfiles/.gvimrc" "$directory/.gvimrc"
ln -sf "$directory/dotfiles/.zshrc" "$directory/.zshrc"
ln -sf "$directory/dotfiles/.wezterm.lua" "$directory/.wezterm.lua"
#ln -sf "$directory/dotfiles/.vim" "$directory/.vim"
ln -sf "$directory/dotfiles/nvim" "$directory/config/nvim"
ln -sf "$directory/dotfiles/.warp" "$directory/.warp"
