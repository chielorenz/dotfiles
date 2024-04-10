#!/bin/sh
# Source all needed dotfiles here

# Source zsh config
source ~/.dotfiles/zsh/.zshrc
source ~/.dotfiles/zsh/.p10k.zsh

# Source oh-my-zsh config
source $ZSH/oh-my-zsh.sh

# Remove oh-my-zsh aliases
unalias ${(k)aliases}

# Source custom aliases
source ~/.dotfiles/.alias
source ~/.dotfiles/.git-shorthands
