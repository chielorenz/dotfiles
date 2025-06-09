# Dotfiles

Configuration files to automate the setup of my macos development environment.

The installation script is a "rolling" setup, which means you can run it multiple times without worrying to screw things
up, so if you want to change the setup you can update this repo and run the script again.

## Installation

```bash
git clone git@github.com:chielorenz/dotfiles-macos.git ~/.dotfiles && sh ~/.dotfiles/install.sh
```

## Dependencies

The installation script will install and setup:

- [Homebrew](https://github.com/Homebrew/brew)
- [Ghostty](https://ghostty.org/)

Optional dependencies:

- Google Chrome
- Visual Studio Code
- Docker desktop
- PHPStorm
- Slack

## Alias and function documentation

The `list` function prints out all available aliases and functions, to make this work there a special syntax:

```bash
# @doc name: Description
```

## Zsh plugins
- zsh-completions
- zsh-autosuggestions
- zsh-syntax-highlighting


## Uninstall

```bash
sh ~/.dotfiles/uninstall.sh
```
