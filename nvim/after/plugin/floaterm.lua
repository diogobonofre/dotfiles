-- Configure floaterm mappings
vim.g.floaterm_keymap_new = '<F7>'
vim.g.floaterm_keymap_prev = '<F6>'
vim.g.floaterm_keymap_next = '<F8>'
vim.g.floaterm_keymap_toggle = '<F5>'
vim.g.floaterm_keymap_kill = '<F9>'

-- Define custom key mappings for floaterm actions
vim.api.nvim_set_keymap('n', '<F7>', ':FloatermNew<CR>', { silent = true })
vim.api.nvim_set_keymap('t', '<F7>', '<C-\\><C-n>:FloatermNew<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F6>', ':FloatermPrev<CR>', { silent = true })
vim.api.nvim_set_keymap('t', '<F6>', '<C-\\><C-n>:FloatermPrev<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F8>', ':FloatermNext<CR>', { silent = true })
vim.api.nvim_set_keymap('t', '<F8>', '<C-\\><C-n>:FloatermNext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F5>', ':FloatermToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('t', '<F5>', '<C-\\><C-n>:FloatermToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F9>', ':FloatermKill<CR>', { silent = true })
vim.api.nvim_set_keymap('t', '<F9>', '<C-\\><C-n>:FloatermKill<CR>', { silent = true })

-- Configure terminal window display
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
vim.g.floaterm_titleposition = 'left'
vim.g.floaterm_wintype = 'float'
