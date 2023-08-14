local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Open buffer
map('n', '<A-=>', '<Cmd>tabnew<CR>', opts)

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
