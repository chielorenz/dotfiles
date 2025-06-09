#!/bin/sh

echo "[dotfiles] Dotfiles installation 🤘🤘🤘"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [[ $SCRIPT_DIR != "$HOME/.dotfiles" ]]; then
	echo "[dotfiles] The repository must be cloned in ~/.dotfiles"
	exit 1
fi

if [[ $(command -v brew) == "" ]]; then
	echo "[dotfiles] Installing homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	echo "\n# Add homebrew to path" >> ~/.zprofile
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
	echo "[dotfiles] Homebrew already installed"
fi

if ! brew list git &>/dev/null; then
	echo "[dotfiles] Installing git"
	brew install git
	if [ -f ~/.gitconfig ]; then
		echo "[dotfiles] Backup existing git config file"
		mv ~/.gitconfig ~/.gitconfig.bak
	fi
	echo "[dotfiles] Symlink git config file"
	ln -sf ~/.dotfiles/git/gitconfig ~/.gitconfig
else
	echo "[dotfiles] Git already installed"
fi

if ! brew list --cask ghostty &>/dev/null; then
	echo "[dotfiles] Installing ghostty"
	brew install --cask ghostty
	if [ -f ~/.config/ghostty/config ]; then
		echo "[dotfiles] Backup existing ghostty config file"
		mv ~/.config/ghostty/config ~/.config/ghostty/config.bak
	fi
	echo "[dotfiles] Symlink ghostty config file"
  	mkdir -p ~/.config/ghostty/
	ln -sf ~/.dotfiles/ghostty/config ~/.config/ghostty/config
else
	echo "[dotfiles] Ghostty already installed"
fi

if ! brew list --cask font-hack-nerd-font &>/dev/null; then
	echo "[dotfiles] Installing font hack"
	brew install --cask font-hack-nerd-font
else
	echo "[dotfiles] Font hack already installed"
fi

if ! brew list neovim &>/dev/null; then
  	echo "[dotfiles] Installing neovim"
	brew install neovim
  	if [ -f ~/.config/nvim/init.lua ]; then
	  		echo "[dotfiles] Backup existing neovim config file"
	  		mv ~/.config/nvim/init.lua ~/.config/nvim/init.lua.bak
  	fi
  	echo "[dotfiles] Symlink neovim config file"
  	mkdir -p ~/.config/nvim/
  	ln -sf ~/.dotfiles/nvim/init.lua ~/.config/nvim/init.lua
else
  	echo "[dotfiles] Neovim already installed"
fi

if ! brew list --cask eurkey &>/dev/null; then
	echo "[dotfiles] Installing eurkey"
	brew install --cask eurkey
	echo "[dotfiles] For the changes to take effect a restart is required"
else
	echo "[dotfiles] Eurkey already installed"
fi

if ! brew list antigen &>/dev/null; then
	echo "[dotfiles] Installing Antigen"
	brew install antigen
else
	echo "[dotfiles] Antigen already installed"
fi

echo "[dotfiles] Installing git-shorthands"
curl https://raw.githubusercontent.com/chielorenz/git-shorthands/main/git-shorthands.sh -s -o ~/.dotfiles/zsh/git-shorthands

if ! grep -q "source ~/.dotfiles/zsh/zshrc" ~/.zshrc; then
	echo "[dotfiles] Update ~/zshrc to source custom config"
	echo "\n# Source dotfiles config" >> ~/.zshrc
	echo "source ~/.dotfiles/zsh/zshrc" >> ~/.zshrc
else
	echo "[dotfiles] Custom config already sourced in ~/.zshrc"
fi

casks=(
	docker
	visual-studio-code
	phpstorm
	google-chrome
	slack
)
echo "[dotfiles] There are ${#casks[@]} optional packages:"
for c in "${casks[@]}"; do
	read -p "[dotfiles] Do you want to install '$c' [y/n]? " choice
	if [[ $choice =~ ^[Yy]$ ]]; then
		brew list $c &>/dev/null || (echo "[dotfiles] Installing $c" && brew install --cask $c)
	fi
done

echo "[dotfiles] All done 🎉"
