return {
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
                dashboard.button("l", "  LaTeX files", ":cd " .. vim.fn.expand("~") .. "/Documents/latex<CR>:Telescope find_files<CR>"),
                dashboard.button("c", "  Configuration", ":e " .. vim.fn.stdpath("config") .. "/init.lua<CR>"),
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

    -- Buffer line (tabs)
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    separator_style = "slant",
                    always_show_bufferline = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    color_icons = true,
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(_, _, diagnostics_dict)
                        local s = " "
                        if diagnostics_dict.error then
                            s = s .. " " .. diagnostics_dict.error
                        end
                        if diagnostics_dict.warning then
                            s = s .. " " .. diagnostics_dict.warning
                        end
                        return s
                    end,
                }
            })
        end,
    },

    -- Status Line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("plugins.ui.statusline").setup()
        end
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("plugins.ui.filetree").setup()
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
                pickers = {
                    spell_suggest = {
                        theme = "dropdown",
                        initial_mode = "normal",
                    },
                    diagnostics = {
                        theme = "dropdown",
                        initial_mode = "normal",
                    }
                },
            })
            
            -- Load extensions
            pcall(require('telescope').load_extension, 'fzf')
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
} 