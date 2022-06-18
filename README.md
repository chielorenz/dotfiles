# Dotfiles

Configuration files to automate the setup of my macos development environment

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

The installation script is a "rolling" setup, which meas you can it multiple time without worring to screw things up, so ff you want to change the setup you can cnahge this repo and run the script again.

The installation script will install and setup:

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
- Alactritty Github theme

## Caveat

- The first time alacritty is opened it must be done with `control + click` and then `Open`
- The setup is on early development and it has been created on MacOS 12.4 Monterrey, could not work on other system. Please backup your configuration files before running any script
