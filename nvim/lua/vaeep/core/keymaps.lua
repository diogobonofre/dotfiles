local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- NORMAL
-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Window resizing
map("n", "<C-S-k>", ":resize -2<CR>", opts)
map("n", "<C-S-j>", ":resize +2<CR>", opts)
map("n", "<C-S-h>", ":vertical resize -2<CR>", opts)
map("n", "<C-S-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<Leader>bn", ":bnext<CR>", opts)
map("n", "<Leader>bp", ":bprevious<CR>", opts)

-- Manage buffers
map("n", "<Leader>bd", ":bdelete<CR>", opts)
map("n", "<Leader>bfd", ":bdelete!<CR>", opts)

-- Navigate tabs
map("n", "<S-ll>", ":tabnext<CR>", opts)
map("n", "<S-hh>", ":tabprevious<CR>", opts)

-- Manage tabs
map("n", "<S-n>", ":tabnew<CR>", opts)
map("n", "<S-c>", ":tabclose<CR>", opts)

-- VISUAL
-- Indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Persistent yank
map("v", "p", "_dP", opts)

-- NETRW
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

map("n", "<Leader>e", ":Lexplore 30<CR>", opts)

-- Theme Switcher
map("n", "<Leader>td", ":set background=dark<CR>", opts)
map("n", "<Leader>tl", ":set background=light<CR>", opts)
