return {
    -- LaTeX support
    {
        "lervag/vimtex",
        lazy = false,
        config = function()
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_compiler_method = 'latexmk'
            vim.g.vimtex_compiler_latexmk = { engine = 'lualatex' }
            vim.g.vimtex_quickfix_mode = 0
            vim.g.vimtex_syntax_enabled = 1
            vim.g.vimtex_format_enabled = 1
            vim.g.vimtex_mappings_enabled = 0  -- Disable default mappings
            vim.g.vimtex_imaps_enabled = 0     -- Disable insert mode mappings
        end,
    },
} 