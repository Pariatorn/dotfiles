return {
    -- Typst.vim - Syntax highlighting and basic typst support
    {
        "kaarmu/typst.vim",
        ft = "typst",
        lazy = false,
        init = function()
            -- Enable typst syntax highlighting
            vim.g.typst_syntax_highlight = 1
            
            -- Set the typst command (modify if typst is not in PATH)
            vim.g.typst_cmd = "typst"
            
            -- Enable concealment (optional - can be disabled if too distracting)
            vim.g.typst_conceal = 0
            vim.g.typst_conceal_math = 0
            vim.g.typst_conceal_emoji = 0
            
            -- Auto-open quickfix on errors
            vim.g.typst_auto_open_quickfix = 1
            
            -- Embedded languages for syntax highlighting
            vim.g.typst_embedded_languages = {"python", "rust", "javascript", "bash"}
            
            -- Enable folding for headings
            vim.g.typst_folding = 1
            vim.g.typst_foldnested = 1
        end,
    },

    -- Tinymist LSP support
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            table.insert(opts.ensure_installed, "tinymist")
        end,
    },

    -- Typst preview (DISABLED - was causing performance issues in visual mode)
    -- {
    --     "chomosuke/typst-preview.nvim",
    --     ft = "typst",
    --     version = "1.*",
    --     build = function()
    --         require("typst-preview").update()
    --     end,
    --     opts = {
    --         -- Settings for typst-preview
    --         get_main_file = function(path_of_current_buffer)
    --             return path_of_current_buffer
    --         end,
    --         get_root = function(path_of_main_file)
    --             return vim.fn.fnamemodify(path_of_main_file, ":p:h")
    --         end,
    --     },
    -- },
} 