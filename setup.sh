#!/bin/bash

### Zsh
ln -sfv "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ln -sfv "$HOME/.dotfiles/zsh/.zshenv" "$HOME/.zshenv"
### Zsh for Ubuntu
# ln -sfv "$HOME/.dotfiles/zsh/ubuntu.zshrc" "$HOME/.zshrc"
# ln -sfv "$HOME/.dotfiles/zsh/ubuntu.zshenv" "$HOME/.zshenv"
### VIm
ln -sfv "$HOME/.dotfiles/.vimrc" "$HOME/.vimrc"
ln -sfv "$HOME/.dotfiles/.gvimrc" "$HOME/.gvimrc"
ln -sfv "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
ln -sfv "$HOME/.dotfiles/nvim/syntax" "$HOME/.vim/syntax"
ln -sfv "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
### etc
ln -sfv "$HOME/.dotfiles/ssh/config" "$HOME/.ssh/"

### ~/.config : directorys
ln -sfv "$HOME/.dotfiles/borders" "$HOME/.config/borders"
ln -sfv "$HOME/.dotfiles/ghostty" "$HOME/.config/ghostty"
ln -sfv "$HOME/.dotfiles/goneovim" "$HOME/.config/goneovim"
ln -sfv "$HOME/.dotfiles/karabiner/complex_modifications" "$HOME/.config/karabiner/assets/complex_modifications"
ln -sfv "$HOME/.dotfiles/tmux/scripts" "$HOME/.config/tmux/scripts"
ln -sfv "$HOME/.dotfiles/wezterm" "$HOME/.config/wezterm"
ln -sfv "$HOME/.dotfiles/yazi" "$HOME/.config/yazi"
ln -sfv "$HOME/.dotfiles/zonvie" "$HOME/.config/zonvie"
### ~/.config : files
ln -sfv "$HOME/.dotfiles/goneovim/settings.toml" "$HOME/.config/goneovim/settings.toml"
ln -sfv "$HOME/.dotfiles/herdr/config.toml" "$HOME/.config/herdr/config.toml"
ln -sfv "$HOME/.dotfiles/starship/starship.toml" "$HOME/.config/starship.toml"
ln -sfv "$HOME/.dotfiles/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
