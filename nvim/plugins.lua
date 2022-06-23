-- Packer config file
-- see https://github.com/wbthomason/packer.nvim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
	-- Required
	use 'wbthomason/packer.nvim' 

	-- Custom plugins here
	
	-- Github theme
	use "projekt0n/github-nvim-theme"

	-- Telescope
	use {
  		'nvim-telescope/telescope.nvim',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Trisitter
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }	

	-- Automatically set up your configuration after cloning packer.nvim
  	-- Put this at the end after all plugins
  	if packer_bootstrap then
    	require('packer').sync()
  	end
end)
