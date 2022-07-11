#!/bin/sh
# Install and configure all needed dependencies here

echo "[dotfiles] Dotfiles configuration script 🤘🤘🤘"

read -p "[dotfiles] Please backup your config files first, continue [y/n]? " res
[[ ! $res =~ ^(yes|y) ]] && exit 1

echo "[dotfiles] Install homebrew"
if [[ $(command -v brew) == "" ]]; then
    # Install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/luca/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Install cask for custom fonts
    brew tap homebrew/cask-fonts
fi

echo "[dotfiles] Install homebrew packages"
packs=(
    nvim
)
for p in "${packs[@]}"; do
    brew list $p &>/dev/null || (echo "[dotfiles] Install $p" && brew install $p)
done

echo "[dotfiles] Install homebrew casks"
casks=(
    amethyst
    alacritty
    font-fira-mono-nerd-font
)
for c in "${casks[@]}"; do
    brew list $c &>/dev/null || (echo "[dotfiles] Install $c" && brew install --cask $c)
done

echo "[dotfiles] Install oh-my-zsh" 
if [ ! -d ~/.oh-my-zsh ]; then
    /bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "[dotfiles] Install powerlevel10k zsh theme"
if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
    git clone --depth 1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

echo "[dotfiles] Install autosuggestion zsh plugin"
if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
    git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

echo "[dotfiles] Symlink alacritty config files"
mkdir -p ~/.config/alacritty
ln -sf ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ~/.dotfiles/alacritty/github-dimmed.yml ~/.config/alacritty/github-dimmed.yml

echo "[dotfiles] Update ~/.zshrc to source custom config" 
if ! grep -q "source ~/.dotfiles/.profile" ~/.zshrc; then
    sed -i '' 's/source $ZSH\/oh-my-zsh.sh/# Source custom config\nsource ~\/.dotfiles\/.profile/' ~/.zshrc
fi

echo "[dotfiles] Symlink nvim config files"
mkdir -p ~/.config/nvim/lua
ln -sf ~/.dotfiles/nvim/*.lua ~/.config/nvim/lua/
ln -sf ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim

casks=(
    google-chrome
    visual-studio-code
    docker
    google-chrome
    phpstorm
    slack
	postman
)
echo "[dotfiles]"
echo "[dotfiles] There are some optional packages:"
printf '[dotfiles] brew install --cask %s\n' "${casks[@]}"
read -p "[dotfiles] Do you want to install them [y/n]? " choice
if [[ $choice =~ ^[Yy]$ ]]; then
    echo "[dotfiles] Install homebrew optional casks"
    for c in "${casks[@]}"; do
        brew list $c &>/dev/null || (echo "[dotfiles] Install $c" && brew install --cask $c)
    done
fi

echo "[dotfiles] All done 🎉"
