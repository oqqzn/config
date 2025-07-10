#!/bin/bash

set -e  # Exit on any error

CONFIG_DIR="$HOME/config"

echo "Linking top-level dotfiles..."
ln -sf "$CONFIG_DIR/.bashrc" ~/.bashrc
ln -sf "$CONFIG_DIR/.bash_profile" ~/.bash_profile
ln -sf "$CONFIG_DIR/.tmux.conf" ~/.tmux.conf

echo "Linking Neovim config..."
mkdir -p ~/.config
ln -sf "$CONFIG_DIR/nvim" ~/.config/nvim

echo "Setting up Neovim Python virtual environment (if missing)..."
VENV_PATH="$HOME/.config/nvim/.venv"
if [ ! -x "$VENV_PATH/bin/python3" ]; then
  echo "Creating virtualenv at $VENV_PATH"
  python3 -m venv "$VENV_PATH"
  "$VENV_PATH/bin/pip" install --upgrade pip pynvim
else
  echo "Python venv already exists."
fi

echo "Config setup complete."
