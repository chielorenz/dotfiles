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

## Dependencies

The installation script will install and setup:

- [Homebrew](https://github.com/Homebrew/brew)
- [Oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
    - [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme
    - [Autosuggestion](https://github.com/zsh-users/zsh-autosuggestions) plugin
- [Nvim](https://github.com/neovim/neovim)
    - [Packer](https://github.com/wbthomason/packer.nvim)
    - [Github theme](https://github.com/projekt0n/github-nvim-theme)
- [Alactritty](https://github.com/alacritty/alacritty)
    - [Github theme](https://github.com/projekt0n/github-nvim-theme/tree/main/terminal/alacritty)

[OPTIONALLY]
- [Amethyst](https://github.com/ianyh/Amethyst)
- Google Chrome
- Visual Studio Code

## Alias and function documentation

The `list` function prints out all available aliases and functions, to make this work there a special syntax:
```
#@doc name: Desctiption
```

## Caveat

- The first time alacritty is opened it must be done with `control + click` and then `Open`
- The setup is on early development and it has been created on MacOS 12.4 Monterrey, could not work on other system. Please backup your configuration files before running any script
