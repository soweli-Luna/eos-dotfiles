#! /bin/env bash

# For endeavouros

# Update system
yay

# Install terminal and shell.
yay -S alacritty
yay -S zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install appearance stuff.
yay -S picom
yay -S xborder-git
yay -S zoxide
yay -S polybar

# Install editor
yay -S helix

# Install Rust
yay -S rustup
rustup update stable
rustup component add rust-analyzeri

# Install music-related programs.
cargo install spotify_player --features streaming
yay -S cava
yay -S cli-visualizer

# Install sound processing
yay -S easyeffects
yay -S lsp-plugins

