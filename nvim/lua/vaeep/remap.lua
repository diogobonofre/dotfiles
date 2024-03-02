local opt = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap('n', '<leader>dt', [[:r!date '+\%d-\%m-\%Y'<CR>]], opt)
