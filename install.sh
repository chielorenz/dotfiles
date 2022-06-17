#!/bin/sh

echo "[dotfiles] Install homebrew"
if [[ $(command -v brew) == "" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "[dotfiles] Install homebrew packages"
for p in neovim; do
    brew list $p &>/dev/null || (echo "[dotfiles] Install $p" && brew install $p)
done

echo "[dotfiles] Install homebrew casks"
for c in amethyst google-chrome visual-studio-code alacritty; do
    brew list $c &>/dev/null || (echo "[dotfiles] Install $c" && brew install --cask $c)
done

echo "[dotfiles] Install oh-my-zsh" 
if [ ! -d ~/.oh-my-zsh ]; then
    /bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "[dotfiles] Install powerlevel10k zsh theme"
if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
    git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

echo "[dotfiles] Install autosuggestion zsh plugin"
if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

echo "[dotfiles] Symlink alacritty config file"
ln -sf ~/.dotfiles/.alacritty.yml ~

echo "[dotfiles] Update ~/.zshrc to source custom config" 
if ! grep -q "source ~/.dotfiles/.profile" ~/.zshrc; then
    sed -i '' 's/source $ZSH\/oh-my-zsh.sh/# Source custom config\nsource ~\/.dotfiles\/.profile\n\nsource $ZSH\/oh-my-zsh.sh/' ~/.zshrc
fi
