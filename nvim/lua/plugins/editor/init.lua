return {
    -- Comment plugin
    {
        'numToStr/Comment.nvim',
        opts = {
            -- Keybindings for normal mode
            toggler = {
                line = 'gcc',    -- Line-comment toggle keymap
                block = 'gbc',   -- Block-comment toggle keymap
            },
            -- Keybindings for operator-pending mode
            opleader = {
                line = 'gc',     -- Line-comment keymap
                block = 'gb',    -- Block-comment keymap
            },
            -- Extra mappings
            extra = {
                above = 'gcO',   -- Add comment on the line above
                below = 'gco',   -- Add comment on the line below
                eol = 'gcA',     -- Add comment at the end of line
            },
            -- Enable sticky comments (maintain indentation)
            sticky = true,
            -- Ignore empty lines when commenting
            ignore = '^$',
            -- Enable mappings
            mappings = {
                basic = true,    -- gcc, gbc, gc[count]{motion}, gb[count]{motion}
                extra = true,    -- gco, gcO, gcA
            },
            -- Pre-hook, called before commenting the line
            pre_hook = nil,
            -- Post-hook, called after commenting is done
            post_hook = nil,
        },
        lazy = false,
    },

    -- Treesitter for syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "vim", "vimdoc", "latex", "bibtex" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "latex", "markdown" },
                },
                indent = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<CR>",
                        node_incremental = "<CR>",
                        node_decremental = "<BS>",
                        scope_incremental = "<TAB>",
                    },
                },
            })
        end,
    },
} 