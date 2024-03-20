return {
	"nordtheme/vim",
	"cocopon/iceberg.vim",
	"mellow-theme/mellow.nvim",
	{
		"rose-pine/neovim",
		config = function()
			vim.cmd([[:colorscheme rose-pine]])
			vim.cmd([[:hi Normal guibg=dark]])
			vim.cmd([[:hi Pmenu guibg=dark]])
			vim.cmd([[:hi ColorColumn guibg=#111111]])
			vim.cmd([[:hi LineNr guibg=dark]])
			vim.cmd([[:hi CursorLineNr guibg=dark]])
			vim.cmd([[:hi NormalFloat guibg=#000000]])
			vim.cmd([[:hi FloatBorder guibg=#000000]])
			vim.cmd([[:hi TelescopeNormal guibg=#000000]])
			vim.cmd([[:hi TelescopeBorder guibg=#000000]])
			--vim.api.nvim_set_hl(0, 'Comment', { italic = true })
			--vim.api.nvim_set_hl(0, 'Keyword', { italic = true })
			--vim.api.nvim_set_hl(0, 'Variable', { italic = false })
		end
	},
}
