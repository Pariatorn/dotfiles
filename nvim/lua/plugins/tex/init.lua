-- LaTeX support. Only loaded when latexmk is installed, so a Typst-only
-- machine without a TeX distribution gets no errors and no LaTeX keymaps.
return {
    {
        "lervag/vimtex",
        lazy = false, -- VimTeX handles lazy loading itself (recommended by its docs)
        cond = function() return vim.fn.executable("latexmk") == 1 end,
        init = function()
            vim.g.tex_flavor = "latex"
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_compiler_latexmk = {
                continuous = 1,
                options = {
                    "-verbose",
                    "-file-line-error",
                    "-synctex=1",
                    "-interaction=nonstopmode",
                },
            }
            -- default engine (a `% !TeX program = ...` magic comment still overrides it)
            vim.g.vimtex_compiler_latexmk_engines = { _ = "-lualatex" }
            vim.g.vimtex_quickfix_mode = 0
            vim.g.vimtex_mappings_enabled = 0 -- own maps in core/autocmds.lua
            vim.g.vimtex_imaps_enabled = 0
        end,
    },
}
