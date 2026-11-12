-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"         -- no jumping text when diagnostics appear
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false           -- mode is shown in lualine
opt.laststatus = 3             -- single global statusline
opt.showtabline = 2            -- always show bufferline
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitbelow = true
opt.splitright = true
opt.mouse = "a"

-- Wrapping (prose friendly)
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "↪ "

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Behaviour
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.updatetime = 300
opt.timeoutlen = 300
opt.conceallevel = 0
opt.fileencoding = "utf-8"

-- Spelling (enabled per filetype in core/autocmds.lua)
opt.spelllang = "en_us"

vim.lsp.log.set_level(vim.log.levels.OFF)
