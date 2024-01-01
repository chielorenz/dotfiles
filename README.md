# Dotfiles

Configuration files to automate the setup of my macos development environment.

The installation script is a "rolling" setup, which means you can run it multiple times without worrying to screw things up, so if you want to change the setup you can update this repo and run the script again.

## Installation

Clone the repository:
```sh
git clone git@github.com:chielorenz/dotfiles-macos.git ~/.dotfiles
```

And run the installation script:
```sh
sh ~/.dotfiles/install.sh
```

## Dependencies

The installation script will install and setup:

- [Homebrew](https://github.com/Homebrew/brew)
- [Oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
    - [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme
    - [Autosuggestion](https://github.com/zsh-users/zsh-autosuggestions) plugin
- [Nvim](https://github.com/neovim/neovim)
    - [Lavy.nvim](https://github.com/folke/lazy.nvim)
	- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
	- [LSP Zero](https://github.com/VonHeikemen/lsp-zero.nvim)
	- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
    - [Github theme](https://github.com/projekt0n/github-nvim-theme)
- [Alactritty](https://github.com/alacritty/alacritty)
    - [Github theme](https://github.com/projekt0n/github-nvim-theme/tree/main/terminal/alacritty)

Optional dependencies:

- [Amethyst](https://github.com/ianyh/Amethyst)
- Google Chrome
- Visual Studio Code
- Docker desktop
- PHPStorm
- Slack

### Telescope

The following Telescope key binds are available (defined in `nvim/after/plugin/telescope.lua`):

```bash
<spacebar>ff # Find files
```

### Treesitter

Tresitter is configured to auto install missing lanugages when files are opened,
but if you need to install a new language manually you can run the Nvim command:

```bash
:TSInstall language # install a language
:TSInstallInfo      # list of all available languages
```

To ensure a language is always installed add the language to the `ensure_installed` array in `nvim/treesitter.lua` 

## Alias and function documentation

The `list` function prints out all available aliases and functions, to make this work there a special syntax:

```bash
#@doc name: Desctiption
```

## Caveat

- The first time alacritty is opened it must be done with `control + click` and then `Open`
- The setup is on early development and it has been created on MacOS 12.4 Monterrey, could not work on other system. Please backup your configuration files before running any script
