return {
    -- LSP: server configs from nvim-lspconfig, enabled via vim.lsp.enable
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            require("plugins.lsp.config").setup()
        end,
    },

    -- Completion
    {
        "saghen/blink.cmp",
        version = "1.*",
        opts = {
            keymap = {
                preset = "enter", -- <CR> accepts, <C-Space> opens, <C-e> closes
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            },
            completion = {
                list = { selection = { preselect = true, auto_insert = false } },
                documentation = { auto_show = true, auto_show_delay_ms = 300 },
            },
            sources = { default = { "lsp", "path", "buffer" } },
            signature = { enabled = true },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
    },

    -- Linting (only for linters that are actually installed)
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.lsp.linting").setup()
        end,
    },
}
