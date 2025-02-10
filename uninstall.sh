#!/bin/sh

echo "[dotfiles] Uninstalling dotfiles 🤘🤘🤘"

if ! brew list --cask ghostty &>/dev/null; then
    echo "[dotfiles] Ghostty is not installed"
else
    echo "[dotfiles] Uninstalling Ghostty"
    brew uninstall ghostty
    rm ~/.config/ghostty/config
fi

if ! brew list antigen &>/dev/null; then
    echo "[dotfiles] Antigen is not installed"
else
    echo "[dotfiles] Uninstalling Antigen"
    brew uninstall antigen
fi

if ! grep -q "source ~/.dotfiles/zsh/zshrc" ~/.zshrc; then
    echo "[dotfiles] Custom config is not sourced in ~/.zshrc"
else
  echo "[dotfiles] Un-source custom config"
  sed -i '' '/^# Source dotfiles config/d' ~/.zshrc
  sed -i '' "/^source ~\/\.dotfiles\/zsh\/zshrc/d" ~/.zshrc
fi

echo "[dotfiles] All done 🎉"