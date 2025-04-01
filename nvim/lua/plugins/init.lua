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
            vim.g.vimtex_mappings_enabled = 0  -- Disable default mappings
            vim.g.vimtex_imaps_enabled = 0     -- Disable insert mode mappings
        end,
    },

    -- Dashboard
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local alpha = require('alpha')
            local dashboard = require('alpha.themes.dashboard')
            
            -- Set header
            dashboard.section.header.val = {
                [[                                                                              ]],
                [[███    ███  █████  ███    ██ ██    ██ ███████  ██████ ██████  ██ ██████     ]],
                [[████  ████ ██   ██ ████   ██ ██    ██ ██      ██      ██   ██ ██ ██   ██    ]],
                [[██ ████ ██ ███████ ██ ██  ██ ██    ██ ███████ ██      ██████  ██ ██████     ]],
                [[██  ██  ██ ██   ██ ██  ██ ██ ██    ██      ██ ██      ██   ██ ██ ██         ]],
                [[██      ██ ██   ██ ██   ████  ██████  ███████  ██████ ██   ██ ██ ██         ]],
                [[                                                                              ]],
                [[     λ Write with Vim's Power • Compile with TeX's Grace • \begin{art}       ]],
                [[                                                                              ]],
            }
            
            -- Set menu
            dashboard.section.buttons.val = {
                dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
                dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
                dashboard.button("t", "  Find text", ":Telescope live_grep<CR>"),
                dashboard.button("l", "  LaTeX files", ":cd ~/Documents/latex<CR>:Telescope find_files<CR>"),
                dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
                dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
            }

            -- Footer
            local function footer()
                local plugins = #vim.tbl_keys(require('lazy').plugins())
                local v = vim.version()
                return string.format(" Neovim %d.%d.%d   %d plugins loaded", v.major, v.minor, v.patch, plugins)
            end
            dashboard.section.footer.val = footer()

            -- Send config to alpha
            alpha.setup(dashboard.opts)
            
            -- Auto start alpha when no arguments
            vim.api.nvim_create_autocmd("VimEnter", {
                pattern = "*",
                callback = function()
                    if vim.fn.argc() == 0 and vim.fn.line2byte('$') == -1 then
                        require('alpha').start()
                    end
                end,
            })
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
                mapping = {
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
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })

            -- Set up cmdline completion
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                    { name = "cmdline" },
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

    -- Linting
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")
            
            lint.linters_by_ft = {
                tex = { "chktex" },
                bib = { "bibclean" },
            }
            
            -- Set up autocommands for linting
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
            
            -- Commands for manual linting
            vim.api.nvim_create_user_command("Lint", function()
                require("lint").try_lint()
            end, { desc = "Trigger linting for current file" })
        end,
    },

    -- Status Line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            -- VimTeX status component
            local vimtex_status = {
                function()
                    if vim.bo.filetype ~= 'tex' then return '' end
                    local status = ''
                    
                    -- Check if VimTeX is loaded
                    if vim.fn.exists('*vimtex#state#get_id') == 0 then
                        return 'VimTeX not loaded'
                    end
                    
                    -- Get the VimTeX compiler state
                    local compiler_status = ''
                    if vim.g.vimtex_compiler_enabled and vim.b.vimtex and vim.b.vimtex.compiler then
                        local compiler = vim.b.vimtex.compiler
                        if compiler.is_running() then
                            compiler_status = " 󰄭 Running"
                        else
                            if vim.fn.jobid(0) then
                                compiler_status = " 󰄭 Idle"
                            end
                        end
                    end
                    
                    -- Get errors count from QuickFix
                    local errors_count = 0
                    if vim.fn.exists('*getqflist') == 1 then
                        for _, item in ipairs(vim.fn.getqflist()) do
                            if item.type == 'E' then
                                errors_count = errors_count + 1
                            end
                        end
                    end
                    
                    local errors_info = ''
                    if errors_count > 0 then
                        errors_info = " 󰅚 " .. errors_count .. " errors"
                    end
                    
                    -- Combine the status components
                    status = "LaTeX" .. compiler_status .. errors_info
                    return status
                end,
                icon = '󱕪',
                color = { fg = '#7aa2f7', gui = 'bold' }
            }
            
            -- Spell checker component
            local spell_status = {
                function()
                    if vim.wo.spell then
                        return '󰓆 ' .. vim.bo.spelllang
                    else
                        return ''
                    end
                end,
                color = { fg = '#a3be8c', gui = 'bold' }
            }
            
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'tokyonight',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {},
                    always_divide_middle = true,
                    globalstatus = true,
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {
                        vimtex_status,
                        spell_status,
                        'encoding', 
                        'fileformat', 
                        'filetype'
                    },
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {'nvim-tree', 'fugitive'}
            }
        end
    },
} 