-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.wrap = true          -- Enable line wrapping
vim.opt.linebreak = true     -- Break lines at word boundaries
vim.opt.breakindent = true   -- Preserve indentation in wrapped text
vim.opt.showbreak = '↪ '     -- Show a symbol for wrapped lines
vim.opt.encoding = "utf-8"   -- The encoding displayed
vim.opt.fileencoding = "utf-8" -- The encoding written to file
vim.opt.ruler = true         -- Show the cursor position all the time
vim.opt.mouse = "a"          -- Enable mouse support
vim.opt.splitbelow = true    -- Horizontal splits will automatically be below
vim.opt.splitright = true    -- Vertical splits will automatically be to the right
vim.opt.conceallevel = 0     -- Show `` in markdown files
vim.opt.tabstop = 4          -- Insert 4 spaces for a tab
vim.opt.shiftwidth = 4       -- Change the number of space characters inserted for indentation
vim.opt.smarttab = true      -- Makes tabbing smarter
vim.opt.expandtab = true     -- Converts tabs to spaces
vim.opt.smartindent = true   -- Makes indenting smart
vim.opt.autoindent = true    -- Good auto indent
vim.opt.laststatus = 2       -- Always display the status line
vim.opt.background = "dark"  -- Tell vim what the background color looks like
vim.opt.showtabline = 2      -- Always show tabs
vim.opt.showmode = false     -- We don't need to see things like -- INSERT -- anymore
vim.opt.backup = false       -- This is recommended by coc
vim.opt.writebackup = false  -- This is recommended by coc
vim.opt.updatetime = 300     -- Faster completion
vim.opt.timeoutlen = 500     -- By default timeoutlen is 1000 ms
vim.opt.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.opt.ignorecase = true    -- Ignore case when searching
vim.opt.smartcase = true     -- Smart case when searching
vim.opt.scrolloff = 8        -- Keep 8 lines above/below cursor when scrolling
vim.opt.sidescrolloff = 8    -- Keep 8 columns left/right of cursor when scrolling
vim.opt.termguicolors = true -- True color support

vim.lsp.log.set_level(vim.log.levels.OFF)

-- LaTeX specific settings
vim.g.tex_flavor = "latex"
vim.opt.spelllang = "en_us"
vim.opt.spell = true
