local wk = require("which-key")

-- Setup WhichKey with the new configuration format
wk.setup({
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 20,
        },
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    -- Use win instead of window (deprecated)
    win = {
        border = "single",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 1, 2, 1, 2 },
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
    },
})

-- Add mappings using the new v3 spec format
wk.add({
    -- Groups
    { "<leader>f", group = "Find" },
    { "<leader>l", group = "LaTeX" },
    { "<leader>r", group = "Refactor" },
    { "<leader>b", group = "Buffer" },
    { "<leader>c", group = "Code" },

    -- File operations
    { "<leader>w", "<cmd>w<CR>", desc = "Save" },
    { "<leader>q", "<cmd>q<CR>", desc = "Quit" },
    { "<leader>Q", "<cmd>q!<CR>", desc = "Force Quit" },
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" },

    -- Buffer operations
    { "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete Buffer" },
    { "<S-l>", "<cmd>bnext<CR>", desc = "Next Buffer" },
    { "<S-h>", "<cmd>bprevious<CR>", desc = "Previous Buffer" },

    -- Find operations (Telescope)
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },

    -- LaTeX operations
    { "<leader>lc", "<cmd>VimtexCompileSS<CR>", desc = "Compile" },
    { "<leader>lv", "<cmd>VimtexView<CR>", desc = "View PDF" },
    { "<leader>lt", "<cmd>VimtexTocToggle<CR>", desc = "Toggle TOC" },
    { "<leader>le", "<cmd>VimtexErrors<CR>", desc = "Show Errors" },
    { "<leader>ls", "<cmd>VimtexStop<CR>", desc = "Stop Compilation" },
    { "<leader>li", "<cmd>VimtexInfo<CR>", desc = "Show Info" },
    { "<leader>lk", "<cmd>VimtexClean<CR>", desc = "Clean Files" },

    -- LSP operations
    { "gd", function() vim.lsp.buf.definition() end, desc = "Go to Definition" },
    { "gD", function() vim.lsp.buf.declaration() end, desc = "Go to Declaration" },
    { "gi", function() vim.lsp.buf.implementation() end, desc = "Go to Implementation" },
    { "gr", function() vim.lsp.buf.references() end, desc = "Find References" },
    { "K", function() vim.lsp.buf.hover() end, desc = "Show Documentation" },

    -- Code actions and refactoring
    { "<leader>cr", function() vim.lsp.buf.rename() end, desc = "Rename Symbol" },
    { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Code Actions" },
    { "<leader>cf", function() vim.lsp.buf.format() end, desc = "Format Document" },
    { "<leader>cl", "<cmd>Lint<CR>", desc = "Lint Current File" },

    -- Spell checking
    { "<leader>s", group = "Spell Checking" },
    { "<leader>st", "<cmd>setlocal spell!<CR>", desc = "Toggle Spell Check" },
    { "<leader>se", "<cmd>setlocal spelllang=en_us<CR>", desc = "English (US)" },
    { "<leader>sb", "<cmd>setlocal spelllang=en_gb<CR>", desc = "English (GB)" },
    { "<leader>sd", "<cmd>setlocal spelllang=de_de<CR>", desc = "German" },
    { "<leader>sf", "<cmd>setlocal spelllang=fr<CR>", desc = "French" },
    { "<leader>sm", "<cmd>setlocal spelllang=en_us,de_de<CR>", desc = "Multi (EN+DE)" },
    { "<leader>sn", "<cmd>normal! 1z=<CR>", desc = "Choose First Suggestion" },
})

-- Visual mode mappings
wk.add({
    { "<leader>", group = "Visual Mode Commands", mode = "v" },
}) 