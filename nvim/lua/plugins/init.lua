return {
    -- LaTeX support
    {
        "lervag/vimtex",
        lazy = false,
        config = function()
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_compiler_method = 'latexmk'
            vim.g.vimtex_quickfix_mode = 0
            vim.g.vimtex_syntax_enabled = 1
            vim.g.vimtex_format_enabled = 1
        end,
    },

    -- Which-key for key bindings
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },

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

    -- LSP Support
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "texlab" },
            })
            
            -- Configure texlab
            require("lspconfig").texlab.setup({
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                settings = {
                    texlab = {
                        build = {
                            onSave = true,
                        },
                        latexFormatter = "latexindent",
                        latexindent = {
                            modifyLineBreaks = false,
                        },
                    },
                },
            })
        end,
    },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local ls = require("luasnip")
            
            -- Load snippets from the snippets directory
            require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})
            require("luasnip").filetype_extend("latex", { "tex" })

            -- Snippet settings
            ls.config.set_config({
                history = true,                -- keep around last snippet local to jump back
                updateevents = "TextChanged,TextChangedI", -- update changes as you type
                enable_autosnippets = false,
                ext_opts = {
                    [require("luasnip.util.types").choiceNode] = {
                        active = {
                            virt_text = { { "●", "GruvboxOrange" } },
                        },
                    },
                },
            })

            -- Load VSCode style snippets
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 30,
                },
                filters = {
                    dotfiles = false,
                },
            })
        end,
    },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = {
                        "%.aux",
                        "%.fls",
                        "%.fdb_latexmk",
                        "%.synctex.gz",
                    },
                },
            })
        end,
    },

    -- Theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = false,
                terminal_colors = true,
            })
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
} 