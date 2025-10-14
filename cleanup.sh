#!/bin/bash

####################################################################################################
unlink "$HOME/.vimrc"
unlink "$HOME/.gvimrc"
unlink "$HOME/.vim/syntax"
unlink "$HOME/.config/nvim"

unlink "$HOME/.zshrc"
unlink "$HOME/.zshenv"
unlink "$HOME/.ssh/config"
unlink "$HOME/.warp"

unlink "$HOME/.config/alacritty"
unlink "$HOME/.config/borders"
unlink "$HOME/.config/ghostty"
unlink "$HOME/.config/starship.toml"
unlink "$HOME/.config/wezterm"
unlink "$HOME/.config/yazi"
unlink "$HOME/.config/zabrze"

unlink "$HOME/.config/goneovim/settings.toml"
unlink "$HOME/.config/karabiner/assets/complex_modifications"
unlink "$HOME/.config/tmux/tmux.conf"

##################################################
ln -sfv "$HOME/.dotfiles/.vimrc" "$HOME/.vimrc"
ln -sfv "$HOME/.dotfiles/.gvimrc" "$HOME/.gvimrc"
ln -sfv "$HOME/.dotfiles/nvim/syntax" "$HOME/.vim/syntax"
ln -sfv "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"

ln -sfv "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ln -sfv "$HOME/.dotfiles/zsh/.zshenv" "$HOME/.zshenv"
ln -sfv "$HOME/.dotfiles/ssh/config" "$HOME/.ssh/"
ln -sfv "$HOME/.dotfiles/warp" "$HOME/.warp"

ln -sfv "$HOME/.dotfiles/alacritty" "$HOME/.config/alacritty"
ln -sfv "$HOME/.dotfiles/borders" "$HOME/.config/borders"
ln -sfv "$HOME/.dotfiles/ghostty" "$HOME/.config/ghostty"
ln -sfv "$HOME/.dotfiles/starship/starship.toml" "$HOME/.config/starship.toml"
ln -sfv "$HOME/.dotfiles/wezterm" "$HOME/.config/wezterm"
ln -sfv "$HOME/.dotfiles/yazi" "$HOME/.config/yazi"
ln -sfv "$HOME/.dotfiles/zabrze" "$HOME/.config/zabrze"

ln -sfv "$HOME/.dotfiles/goneovim/settings.toml" "$HOME/.config/goneovim/settings.toml"
ln -sfv "$HOME/.dotfiles/karabiner/complex_modifications" "$HOME/.config/karabiner/assets/complex_modifications"
ln -sfv "$HOME/.dotfiles/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
