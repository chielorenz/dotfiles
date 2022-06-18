# Dotfiles

Personal dotfiles to setup my macos ~

> Please backup your configuration files before running any script

## Installation

Clone the repository
```sh
git clone git@github.com:b1n01/dotfiles.git ~/.dotfiles 
```

And run the installation script
```sh
sh ~/.dotfiles/install.sh
```

## Description

The `install.sh` script will install and setup
- Homebrew
- Homebrew packages
    - nvim
- Homebrew casks
    - amethyst
    - google-chrome
    - visual-studio-code
    - alacritty
- Oh-my-zsh
- Powerlevel10k zsh theme
- Autosuggestion zsh plugin
- Nvim packer
    - Github theme
- Alactritty github theme

## Caveat

The setup is on early development and it has been created on MacOS 12.4 Monterrey, could not work on other system. Please backup your configuration files before running any script.