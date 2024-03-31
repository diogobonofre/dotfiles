return {
	"casonadams/nord.vim",
	"rose-pine/neovim",
	"saulhoward/kaodam",
	{
		"mcchrish/zenbones.nvim",
		dependencies = {
			"tjdevries/colorbuddy.nvim",
			"rktjmp/lush.nvim",
		},
		config = function()
			vim.cmd([[:colorscheme neobones]])
			vim.cmd([[:hi Normal guibg=#121212]])
			vim.cmd([[:hi Pmenu guibg=#121212]])
			vim.cmd([[:hi ColorColumn guibg=#222222]])
			vim.cmd([[:hi LineNr guibg=#121212]])
			vim.cmd([[:hi LineNr guifg=#222222]])
			vim.cmd([[:hi CursorLineNr guibg=#121212]])
			vim.cmd([[:hi CursorLineNr guifg=#ebeeee]])
			vim.cmd([[:hi Comment guifg=#444444]])
			vim.cmd([[:hi Type guifg=#ffcc22]])
			vim.cmd([[:hi Delimiter guifg=#ebeeee]])
			vim.cmd([[:hi IncSearch guibg=#ffcc22]])
			vim.cmd([[:hi IncSearch guifg=#121212]])
			vim.cmd([[:hi Search guibg=#ebeeee]])
			vim.cmd([[:hi Search guifg=#121212]])
			vim.cmd([[:hi Error guifg=#888888]])
			vim.cmd([[:hi MoreMsg guifg=#444444]])
			vim.cmd([[:hi MatchParen guifg=#121212]])
			vim.cmd([[:hi MatchParen guifg=#ffcc22]])
			vim.cmd([[:hi NormalFloat guibg=#222222]])
			vim.cmd([[:hi FloatBorder guibg=#ebeeee]])
			vim.cmd([[:hi TelescopeNormal guibg=#121212]])
			vim.cmd([[:hi TelescopeBorder guibg=#121212]])
			vim.cmd([[:hi StatusLine guibg=#121212]])
			vim.cmd([[:hi StatusLine guifg=#444444]])
			--vim.api.nvim_set_hl(0, 'Comment', { italic = true })
			--vim.api.nvim_set_hl(0, 'Keyword', { italic = true })
			--vim.api.nvim_set_hl(0, 'Variable', { italic = false })
		end
	},
}
