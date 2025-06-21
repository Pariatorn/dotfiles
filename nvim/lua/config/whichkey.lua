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
    { "<leader>lo", "<cmd>VimtexCompileOutput<CR>", desc = "Show Compile Output" },
    { "<leader>li", "<cmd>VimtexInfo<CR>", desc = "Show Info" },
    { "<leader>lk", "<cmd>VimtexClean<CR>", desc = "Clean Files" },

    -- Typst operations
    { "<leader>tw", "<cmd>TypstWatch<CR>", desc = "Watch & Compile" },
    { "<leader>tc", function()
        local filepath = vim.api.nvim_buf_get_name(0)
        if filepath:match("%.typ$") then
            vim.fn.system("typst compile " .. vim.fn.shellescape(filepath))
            print("Typst compilation complete")
        else
            print("Not a Typst file")
        end
    end, desc = "Compile Once" },
    { "<leader>tv", function()
        local filepath = vim.api.nvim_buf_get_name(0)
        if filepath:match("%.typ$") then
            local pdf_path = filepath:gsub("%.typ$", ".pdf")
            if vim.fn.executable("zathura") == 1 then
                vim.fn.jobstart({"zathura", pdf_path}, {detach = true})
                print("Opening PDF in Zathura")
            elseif vim.fn.executable("open") == 1 then
                vim.fn.jobstart({"open", pdf_path}, {detach = true})
                print("Opening PDF with system viewer")
            elseif vim.fn.executable("xdg-open") == 1 then
                vim.fn.jobstart({"xdg-open", pdf_path}, {detach = true})
                print("Opening PDF with default viewer")
            else
                print("No suitable PDF viewer found")
            end
        else
            print("Not a Typst file")
        end
    end, desc = "View PDF" },
    { "<leader>tp", desc = "Pin Main File" }, -- Configured in LSP on_attach
    { "<leader>tu", desc = "Unpin Main File" }, -- Configured in LSP on_attach
    { "<leader>tf", function() vim.lsp.buf.format() end, desc = "Format Document" },
    { "<leader>tr", function()
        require("typst-preview").toggle()
    end, desc = "Toggle Preview", cond = function()
        return pcall(require, "typst-preview")
    end },
    { "<leader>ts", function()
        require("typst-preview").sync_with_cursor()
    end, desc = "Sync Preview with Cursor", cond = function()
        return pcall(require, "typst-preview")
    end },

    -- LSP operations
    { "gd", function() 
        -- Jump directly to definition if there's only one
        local params = vim.lsp.util.make_position_params()
        vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result, ctx, config)
            if result and #result == 1 then
                vim.lsp.util.jump_to_location(result[1], vim.lsp.get_client_by_id(ctx.client_id).offset_encoding)
            else
                vim.lsp.buf.definition()
            end
        end)
    end, desc = "Go to Definition" },
    { "gD", function() vim.lsp.buf.declaration() end, desc = "Go to Declaration" },
    { "gi", function() vim.lsp.buf.implementation() end, desc = "Go to Implementation" },
    { "gr", function() vim.lsp.buf.references() end, desc = "Find References" },
    { "K", function() vim.lsp.buf.hover() end, desc = "Show Documentation" },

    -- Spell checking
    { "<leader>s", group = "Spell Checking" },
    { "<leader>st", "<cmd>setlocal spell!<CR>", desc = "Toggle Spell Check" },
    { "<leader>se", "<cmd>setlocal spelllang=en_us<CR>", desc = "English (US)" },
    { "<leader>sb", "<cmd>setlocal spelllang=en_gb<CR>", desc = "English (GB)" },
    { "<leader>sd", "<cmd>setlocal spelllang=de_de<CR>", desc = "German" },
    { "<leader>sf", "<cmd>setlocal spelllang=fr<CR>", desc = "French" },
    { "<leader>sm", "<cmd>setlocal spelllang=en_us,de_de<CR>", desc = "Multi (EN+DE)" },
    { "<leader>sn", "<cmd>normal! 1z=<CR>", desc = "Choose First Suggestion" },
    { "<leader>ss", "<cmd>Telescope spell_suggest<CR>", desc = "Show Suggestions" },
    { "<leader>sp", "<cmd>normal! ]s<CR>", desc = "Next Misspelled Word" },
    { "<leader>sP", "<cmd>normal! [s<CR>", desc = "Previous Misspelled Word" },
    { "<leader>sa", "<cmd>SpellAdd<CR>", desc = "Add Word to Dictionary" },

    -- Code actions and refactoring
    { "<leader>cr", function() vim.lsp.buf.rename() end, desc = "Rename Symbol" },
    { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Code Actions" },
    { "<leader>cf", function() vim.lsp.buf.format() end, desc = "Format Document" },
    { "<leader>cl", "<cmd>Lint<CR>", desc = "Lint Current File" },
    { "<leader>cd", "<cmd>Telescope diagnostics<CR>", desc = "Show Diagnostics" },
    { "<leader>cj", function() vim.diagnostic.goto_next() end, desc = "Next Diagnostic" },
    { "<leader>ck", function() vim.diagnostic.goto_prev() end, desc = "Previous Diagnostic" },
    { "<leader>cq", function() vim.diagnostic.setloclist() end, desc = "Diagnostics in Quickfix" },
})

-- Visual mode mappings
wk.add({
    { "<leader>", group = "Visual Mode Commands", mode = "v" },
}) 
