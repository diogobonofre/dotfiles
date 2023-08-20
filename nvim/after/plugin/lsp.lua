local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)

	lsp.default_keymaps({buffer = bufnr})

end)

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'nvim_lsp'},
        { name = 'luasnip' },
        {
            name = 'bulma',
            option = {
                filetypes = {
                    "cshtml",
                },
            },
        },
        {
            name = 'buffer',
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            },
        },
        { name = 'vsnip' },
        { name = "cmp_tabnine" },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete()
    }
})
