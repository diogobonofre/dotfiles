return {
	{
		"rose-pine/neovim",
		config = function()
			vim.cmd([[:colorscheme rose-pine]])
			vim.cmd([[:hi Normal guibg=#111111]])
			vim.cmd([[:hi Pmenu guibg=#111111]])
			vim.cmd([[:hi ColorColumn guibg=#1c1c1c]])
			--vim.api.nvim_set_hl(0, 'Comment', { italic = true })
			--vim.api.nvim_set_hl(0, 'Keyword', { italic = true })
			--vim.api.nvim_set_hl(0, 'Variable', { italic = false })
		end
	},
}
