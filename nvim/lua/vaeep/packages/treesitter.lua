return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require('nvim-ts-autotag').setup()

		vim.cmd([[":TSUpdate"]])

		require 'nvim-treesitter.configs'.setup({
			ensure_installed = { "c", "javascript", "lua" },
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
		})
	end,
}
