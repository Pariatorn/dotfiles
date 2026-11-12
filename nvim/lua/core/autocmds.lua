local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Spell checking for prose filetypes
autocmd("FileType", {
    group = augroup,
    pattern = { "tex", "plaintex", "markdown", "typst", "gitcommit" },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelloptions = "camel"
        vim.opt_local.spellsuggest = "best,10"
    end,
})

-- Briefly highlight yanked text
autocmd("TextYankPost", {
    group = augroup,
    callback = function() vim.hl.on_yank({ timeout = 150 }) end,
})

-- :SpellAdd [word] (defaults to word under cursor)
vim.api.nvim_create_user_command("SpellAdd", function(opts)
    local word = opts.args ~= "" and opts.args or vim.fn.expand("<cword>")
    vim.cmd.spellgood(word)
    vim.notify("Added '" .. word .. "' to spell file")
end, { nargs = "?" })

-- Register a which-key group for the current buffer (no-op without which-key)
local function wk_group(buf, lhs, name)
    local ok, wk = pcall(require, "which-key")
    if ok then wk.add({ { lhs, group = name, buffer = buf } }) end
end

-- LaTeX: buffer-local maps, only when VimTeX is active (i.e. latexmk is installed)
autocmd("FileType", {
    group = augroup,
    pattern = "tex",
    callback = function(ev)
        -- same condition as the vimtex spec in plugins/tex/init.lua
        if vim.fn.executable("latexmk") ~= 1 then return end
        local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
        end
        wk_group(ev.buf, "<leader>l", "LaTeX")
        map("<leader>lc", "<cmd>VimtexCompile<CR>", "Toggle continuous compile")
        map("<leader>lv", "<cmd>VimtexView<CR>", "View PDF")
        map("<leader>lt", "<cmd>VimtexTocToggle<CR>", "Toggle TOC")
        map("<leader>le", "<cmd>VimtexErrors<CR>", "Show errors")
        map("<leader>lo", "<cmd>VimtexCompileOutput<CR>", "Compile output")
        map("<leader>li", "<cmd>VimtexInfo<CR>", "Info")
        map("<leader>lk", "<cmd>VimtexClean<CR>", "Clean aux files")
    end,
})

-- Typst: buffer-local maps (needs the `typst` CLI; tinymist adds pin/unpin)
autocmd("FileType", {
    group = augroup,
    pattern = "typst",
    callback = function(ev)
        local typst = require("utils.typst")
        local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
        end
        wk_group(ev.buf, "<leader>t", "Typst")
        map("<leader>tc", typst.compile, "Compile once")
        map("<leader>tw", typst.toggle_watch, "Toggle watch")
        map("<leader>tv", typst.view, "View PDF")
    end,
})
