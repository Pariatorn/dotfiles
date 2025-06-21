local M = {}

function M.setup()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = { "texlab", "tinymist" },
    })
    
    -- Configure diagnostic display
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })
    
    -- Configure diagnostic signs to be more visually consistent and modern
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
    
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
    
    -- Configure tinymist for Typst
    require("lspconfig").tinymist.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
            formatterMode = "typstyle",
            exportPdf = "onType",
            semanticTokens = "disable",
        },
        on_attach = function(client, bufnr)
            -- Enable formatting capability
            client.server_capabilities.documentFormattingProvider = true
            
            -- Typst-specific keymaps for pin/unpin main file functionality
            vim.keymap.set("n", "<leader>tp", function()
                client:exec_cmd({
                    title = "pin",
                    command = "tinymist.pinMain",
                    arguments = { vim.api.nvim_buf_get_name(0) },
                }, { bufnr = bufnr })
            end, { desc = "[T]inymist [P]in Main File", noremap = true, buffer = bufnr })

            vim.keymap.set("n", "<leader>tu", function()
                client:exec_cmd({
                    title = "unpin",
                    command = "tinymist.pinMain",
                    arguments = { vim.v.null },
                }, { bufnr = bufnr })
            end, { desc = "[T]inymist [U]npin Main File", noremap = true, buffer = bufnr })
            
            -- Optional: Format on save for Typst files
            -- Uncomment the following if you want automatic formatting on save
            -- vim.api.nvim_create_autocmd("BufWritePre", {
            --     buffer = bufnr,
            --     callback = function()
            --         vim.lsp.buf.format({ bufnr = bufnr })
            --     end,
            -- })
        end,
    })
end

return M 