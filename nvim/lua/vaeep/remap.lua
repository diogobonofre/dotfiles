vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap('n', '<leader>dt', [[:r!date '+\%d-\%m-\%Y'<CR>]], { noremap = true, silent = true })
