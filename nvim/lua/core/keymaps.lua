-- Better navigation for wrapped lines
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('v', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('v', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Navigate to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate to right window" })

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation with shift
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Enhanced buffer management
map("n", "<leader>bc", ":bd<CR>", { desc = "Close current buffer" })
map("n", "<leader>bC", ":bd!<CR>", { desc = "Force close current buffer" })
map("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })
map("n", "<leader>ba", ":%bd|e#<CR>", { desc = "Close all buffers except current" })
map("n", "<leader>bl", ":Telescope buffers<CR>", { desc = "List all buffers" })

-- File operations
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force Quit" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File Explorer" })

-- Find operations (Telescope)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find File" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })

-- LaTeX operations
map("n", "<leader>lc", "<cmd>VimtexCompileSS<CR>", { desc = "Compile" })
map("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "View PDF" })
map("n", "<leader>lt", "<cmd>VimtexTocToggle<CR>", { desc = "Toggle TOC" })
map("n", "<leader>le", "<cmd>VimtexErrors<CR>", { desc = "Show Errors" })
map("n", "<leader>lo", "<cmd>VimtexCompileOutput<CR>", { desc = "Show Compile Output" })
map("n", "<leader>li", "<cmd>VimtexInfo<CR>", { desc = "Show Info" })
map("n", "<leader>lk", "<cmd>VimtexClean<CR>", { desc = "Clean Files" })

-- Typst operations
local typst_utils = require("utils.typst")
map("n", "<leader>tw", "<cmd>TypstWatch<CR>", { desc = "Watch & Compile" })
map("n", "<leader>tc", typst_utils.compile, { desc = "Compile Once" })
map("n", "<leader>tv", typst_utils.view, { desc = "View PDF" })
map("n", "<leader>tp", ":lua require'typst-lsp'.pin_main_file()<CR>", { desc = "Pin Main File" })
map("n", "<leader>tu", ":lua require'typst-lsp'.unpin_main_file()<CR>", { desc = "Unpin Main File" })
map("n", "<leader>tf", function() vim.lsp.buf.format() end, { desc = "Format Document" })

-- LSP operations
map("n", "gd", function() 
    -- Jump directly to definition if there's only one
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result, ctx, config)
        if result and #result == 1 then
            vim.lsp.util.jump_to_location(result[1], vim.lsp.get_client_by_id(ctx.client_id).offset_encoding)
        else
            vim.lsp.buf.definition()
        end
    end)
end, { desc = "Go to Definition" })
map("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "Go to Declaration" })
map("n", "gi", function() vim.lsp.buf.implementation() end, { desc = "Go to Implementation" })
map("n", "gr", function() vim.lsp.buf.references() end, { desc = "Find References" })
map("n", "K", function() vim.lsp.buf.hover() end, { desc = "Show Documentation" })

-- Spell checking
map("n", "<leader>st", "<cmd>setlocal spell!<CR>", { desc = "Toggle Spell Check" })
map("n", "<leader>se", "<cmd>setlocal spelllang=en_us<CR>", { desc = "English (US)" })
map("n", "<leader>sb", "<cmd>setlocal spelllang=en_gb<CR>", { desc = "English (GB)" })
map("n", "<leader>sd", "<cmd>setlocal spelllang=de_de<CR>", { desc = "German" })
map("n", "<leader>sf", "<cmd>setlocal spelllang=fr<CR>", { desc = "French" })
map("n", "<leader>sm", "<cmd>setlocal spelllang=en_us,de_de<CR>", { desc = "Multi (EN+DE)" })
map("n", "<leader>sn", "<cmd>normal! 1z=<CR>", { desc = "Choose First Suggestion" })
map("n", "<leader>ss", "<cmd>Telescope spell_suggest<CR>", { desc = "Show Suggestions" })
map("n", "<leader>sp", "<cmd>normal! ]s<CR>", { desc = "Next Misspelled Word" })
map("n", "<leader>sP", "<cmd>normal! [s<CR>", { desc = "Previous Misspelled Word" })
map("n", "<leader>sa", "<cmd>SpellAdd<CR>", { desc = "Add Word to Dictionary" })

-- Code actions and refactoring
map("n", "<leader>cr", function() vim.lsp.buf.rename() end, { desc = "Rename Symbol" })
map("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Code Actions" })
map("n", "<leader>cf", function() vim.lsp.buf.format() end, { desc = "Format Document" })
map("n", "<leader>cl", "<cmd>Lint<CR>", { desc = "Lint Current File" })
map("n", "<leader>cd", "<cmd>Telescope diagnostics<CR>", { desc = "Show Diagnostics" })
map("n", "<leader>cj", function() vim.diagnostic.goto_next() end, { desc = "Next Diagnostic" })
map("n", "<leader>ck", function() vim.diagnostic.goto_prev() end, { desc = "Previous Diagnostic" })
map("n", "<leader>cq", function() vim.diagnostic.setloclist() end, { desc = "Diagnostics in Quickfix" })
