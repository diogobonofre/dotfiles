vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "90"
vim.opt.cursorline = true
vim.opt.linespace = 3
vim.opt.numberwidth = 5

--vim.cmd('wincmd v')

vim.g.mapleader = " "

-- VimWiki Pre-requesites

-- Disable compatibility mode
vim.cmd('set nocompatible')

-- Enable file type detection and plugins
vim.cmd('filetype plugin on')

-- Enable syntax highlighting
vim.cmd('syntax on')
