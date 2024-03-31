return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"onsails/lspkind.nvim",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"hrsh7th/cmp-nvim-lua",
	},
	config = function()
		local cmp = require("cmp")

		vim.api.nvim_set_hl(0, "CustomPmenu", { bg = "Black", fg = "White" })
		vim.api.nvim_set_hl(0, "CustomPmenuSel", { bg = "#111111", fg = "White" })

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				documentation = cmp.config.window.bordered({
					border = "single",
					winhighlight = "Normal:CustomPmenu,FloatBorder:CustomPmenu,CursorLine:CustomPmenuSel,Search:None",
				}),
				completion = cmp.config.window.bordered({
					border = "single",
					winhighlight = "Normal:CustomPmenu,FloatBorder:CustomPmenu,CursorLine:CustomPmenuSel,Search:None",
				}),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<Tab>'] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				format = require("lspkind").cmp_format({
					maxwidth = 30,
					ellispsis_char = "...",
				}),
			},
			experimental = {
				ghost_text = false,
			},
		})
	end,
}
