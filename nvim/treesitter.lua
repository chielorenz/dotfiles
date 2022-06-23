-- Config treesitter
-- see https://github.com/nvim-treesitter/nvim-treesitter#available-modules

local configs = require("nvim-treesitter.configs")
configs.setup {
	ensure_installed = { "javascript", "json", "lua" }, -- Automatically install
  	sync_install = false, -- Install parsers synchronously
  	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,
    	disable = { "" }, -- list of language that will be disabled
    	additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { "yaml" }
	},
}
