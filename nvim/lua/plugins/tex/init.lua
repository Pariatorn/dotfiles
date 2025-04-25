return {
    -- LaTeX support
    {
        "lervag/vimtex",
        lazy = false,
        config = function()
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_compiler_method = 'latexmk'
            
            -- Completely override latexmk configuration
            vim.g.vimtex_compiler_latexmk = {
                build_dir = '',
                callback = 1,
                continuous = 1,
                executable = 'latexmk',
                args = {
                    '-lualatex',
                    '-verbose',
                    '-file-line-error',
                    '-synctex=1',
                    '-interaction=nonstopmode',
                },
                options = {},  -- Clear options to avoid conflicts
            }
            
            -- Force lualatex engine
            vim.g.vimtex_compiler_latexmk_engines = {
                _                = '-lualatex',
                pdflatex         = '-pdf',
                dvipdfex         = '-pdfdvi',
                lualatex         = '-lualatex',
                xelatex          = '-xelatex',
            }
            vim.g.vimtex_compiler_progname = 'nvr'
            
            -- Remove any local latexmk configuration
            vim.g.vimtex_compiler_latexmk.rc_use_local_rc = 0
            
            vim.g.vimtex_quickfix_mode = 0
            vim.g.vimtex_syntax_enabled = 1
            vim.g.vimtex_format_enabled = 1
            vim.g.vimtex_mappings_enabled = 0  -- Disable default mappings
            vim.g.vimtex_imaps_enabled = 0     -- Disable insert mode mappings
        end,
    },
} 