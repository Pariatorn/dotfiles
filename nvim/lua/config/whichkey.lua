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
    window = {
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
    { "<leader>t", group = "Typst" },
    { "<leader>r", group = "Refactor" },
    { "<leader>b", group = "Buffer" },
    { "<leader>c", group = "Code" },
    { "<leader>s", group = "Spell Checking" },
})

-- Visual mode mappings
wk.add({
    { "<leader>", group = "Visual Mode Commands", mode = "v" },
}) 
