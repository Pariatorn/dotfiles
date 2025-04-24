local M = {}

function M.setup()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = { "texlab" },
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
end

return M 