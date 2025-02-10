#!/bin/sh

echo "[dotfiles] Dotfiles installation 🤘🤘🤘"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [[ $SCRIPT_DIR != "$HOME/.dotfiles" ]]; then
  echo "[dotfiles] The repository must be cloned in ~/.dotfiles"
  exit 1
fi

if [[ $(command -v brew) == "" ]]; then
  echo "[dotfiles] Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "\n# Add Homebrew to path" >> ~/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

else
  echo "[dotfiles] Homebrew already installed"
fi

if ! brew list --cask ghostty &>/dev/null; then
  echo "[dotfiles] Installing Ghostty"
  brew install --cask ghostty
  if [ -f ~/.config/ghostty/config ]; then
      echo "[dotfiles] Backup existing Ghostty config file"
      mv ~/.config/ghostty/config ~/.config/ghostty/config.bak
  fi
  echo "[dotfiles] Symlink Ghostty config file"
  mkdir -p ~/.config/ghostty/
  ln -sf ./ghostty/config ~/.config/ghostty/config
else
  echo "[dotfiles] Ghostty already installed"
fi

if ! brew list antigen &>/dev/null; then
  echo "[dotfiles] Installing Antigen"
  brew install antigen
else
  echo "[dotfiles] Antigen already installed"
fi

echo "[dotfiles] Installing git-shorthands"
curl https://raw.githubusercontent.com/chielorenz/git-shorthands/main/git-shorthands.sh -s -o ~/.dotfiles/zsh/git-shorthands

if ! grep -q "source ~/.dotfiles/zsh/.zshrc" ~/.zshrc; then
    echo "[dotfiles] Update ~/.zshrc to source custom config"
    echo "\n# Source dotfiles config" >> ~/.zshrc
    echo "source ~/.dotfiles/zsh/zshrc" >> ~/.zshrc
else
    echo "[dotfiles] Custom config already sourced in ~/.zshrc"
fi

casks=(
    google-chrome
    visual-studio-code
    docker
    phpstorm
    slack
)
echo "[dotfiles] There are some optional packages:"
printf '[dotfiles] • %s\n' "${casks[@]}"
read -p "[dotfiles] Do you want to install them [y/n]? " choice
if [[ $choice =~ ^[Yy]$ ]]; then
    echo "[dotfiles] Install homebrew optional casks"
    for c in "${casks[@]}"; do
        brew list $c &>/dev/null || (echo "[dotfiles] Install $c" && brew install --cask $c)
    done
fi

echo "[dotfiles] All done 🎉"
