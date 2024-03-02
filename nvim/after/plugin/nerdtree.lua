local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', '<leader>fe', '<Cmd>:NERDTreeToggle<CR>', opts)
map('n', '<leader>fd', '<Cmd>:NERDTreeFind<CR>', opts)
