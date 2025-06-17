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
vim.opt.termguicolors = true -- True color support

-- LaTeX specific settings
vim.g.tex_flavor = "latex"
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Enhanced spell checking for LaTeX files
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"tex", "latex", "markdown"},
    callback = function()
        vim.opt_local.spell = true
        -- Set spell suggestions popup options
        vim.opt_local.spelloptions = "camel"
        vim.opt_local.spellsuggest = "best,10"
    end
})

-- Typst file settings (filetype detection handled by typst.vim)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function()
        -- Enable spell checking for typst files
        vim.opt_local.spell = true
        vim.opt_local.spelloptions = "camel"
        vim.opt_local.spellsuggest = "best,10"
    end
})

-- Custom spell checking commands
vim.api.nvim_create_user_command("SpellAdd", function(opts)
    local word = opts.args
    if word == "" then
        -- If no argument provided, use word under cursor
        word = vim.fn.expand("<cword>")
    end
    vim.cmd("spellgood " .. word)
    print("Added '" .. word .. "' to spell file")
end, { nargs = "?" })

-- Better navigation for wrapped lines
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('v', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('v', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("plugins")

-- Load configurations
require("config.keymaps")
require("config.whichkey") 