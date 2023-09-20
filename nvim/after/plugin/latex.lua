vim.g.vimtex_view_method = 'zathura'

vim.g.vimtex_compiler_latexmk = {
  executable = 'latexmk',
  continuous = 1,
  hooks = {
    TexdocAfter = {'silent !zathura %:r.pdf &', 'redraw!'}
  }
}

-- Define a key mapping that saves the file and then compiles using Vimtex
vim.api.nvim_set_keymap('n', '<leader>ex', [[:silent! w | execute "VimtexCompile"<CR>]], { noremap = true, silent = true })

