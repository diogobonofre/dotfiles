return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		ensure_installed = {
			"eslint-lsp",
			"prettierd",
			"tailswindcss-language-server",
			"typescript-language-server",
		}
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
			},

			automatic_installation = true,
		})
	end
}
