--Your all definded options mustbbe added here.
-- Options are those that changes default behavior to something you want.
-- E.g vim.o.tabstop = 4
-- =====================
-- (1).Basic editor settings
-- =====================
local o = vim.o
vim.o.number = true
vim.o.relativenumber = false
o.cursorline = true
o.termguicolors = true
o.signcolumn = "yes"
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true
o.clipboard = "unnamedplus"
vim.cmd("filetype plugin indent on")
-- Minimal custom tabline: show current file + indicator for more tabs
vim.o.showtabline = 2

-- ======================
-- Session Requirements
-- ======================
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- ------------------
-- Truecolor
-- -----------------
vim.opt.termguicolors = true
-- =====================
-- (2) Leader keys
-- =====================
vim.g.mapleader = " "
vim.g.maplocalleader = "'"

-- ======================
-- Provider set to Zero
-- ======================
-- Disable unused language providers to remove health warnings
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

