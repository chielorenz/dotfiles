-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add your plugins here
		
		-- Install oxocarbon color scheme
        {  "nyoom-engineering/oxocarbon.nvim" },

		-- Install treesitter
		{
			"nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function () 
				local configs = require("nvim-treesitter.configs")
				configs.setup({
					ensure_installed = {"lua","javascript", "typescript" },
					sync_install = false,
					auto_install = true,
					highlight = { enable = true },
					indent = { enable = true },  
				})
			end
		}
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "catppuccin-mocha" } },
	-- automatically check for plugin updates
	checker = { enabled = true, notify = false },
})

-- Set colorscheme
vim.opt.background = "dark" -- set this to dark or light
vim.cmd.colorscheme "oxocarbon"

-- Show current line number
vim.opt.nu = true

-- Use relative line number
vim.opt.relativenumber = true

-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 4

-- Number of spaces that a <Tab> counts for while editing
vim.opt.softtabstop = 4

-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 4

-- Do smart autoindenting when starting a new line
vim.opt.smartindent = true

-- This option changes how text is displayed
vim.opt.wrap = true

-- Wrap at a word boundary insead of the middle of a word
vim.opt.linebreak = true

-- Use a swapfile for the buffer
vim.opt.swapfile = false

-- Make a backup before overwriting a file
vim.opt.backup = false

-- When there is a previous search pattern, highlight all its matches
vim.opt.hlsearch = false

-- While typing a search command, show where the pattern, as it was typed so far, matches
vim.opt.incsearch = true

-- Enables 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor while scrolling
vim.opt.scrolloff = 8

-- Columns that are highlighted
vim.opt.colorcolumn = "120"

-- Highlight the text line of the cursor
vim.opt.cursorline = true
