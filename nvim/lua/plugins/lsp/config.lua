local M = {}

-- Servers are only enabled when their binary exists (system PATH or Mason),
-- so missing toolchains (e.g. no LaTeX) never cause errors.
-- Install extra servers with :Mason or :MasonInstall <name>.
local servers = {
    tinymist = "tinymist", -- Typst
    texlab = "texlab",     -- LaTeX (optional: :MasonInstall texlab)
}

function M.setup()
    require("mason").setup() -- also puts Mason's bin dir on PATH
    require("mason-lspconfig").setup({
        ensure_installed = { "tinymist" },
        automatic_enable = false, -- enabled below, only if installed
    })

    vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = " ",
                [vim.diagnostic.severity.WARN] = " ",
                [vim.diagnostic.severity.HINT] = "󰌵 ",
                [vim.diagnostic.severity.INFO] = " ",
            },
        },
        float = { border = "rounded", source = true },
    })

    vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    vim.lsp.config("texlab", {
        settings = {
            texlab = {
                build = { onSave = false }, -- VimTeX compiles
                latexFormatter = "latexindent",
                latexindent = { modifyLineBreaks = false },
            },
        },
    })

    vim.lsp.config("tinymist", {
        settings = {
            formatterMode = "typstyle",
            exportPdf = "never", -- use <leader>tc / <leader>tw instead
            semanticTokens = "disable",
        },
        on_attach = function(client, bufnr)
            local function pin(arg, desc, lhs)
                vim.keymap.set("n", lhs, function()
                    client:exec_cmd({ title = desc, command = "tinymist.pinMain", arguments = { arg } },
                        { bufnr = bufnr })
                end, { buffer = bufnr, desc = desc })
            end
            pin(vim.api.nvim_buf_get_name(bufnr), "Pin main file", "<leader>tp")
            pin(vim.NIL, "Unpin main file", "<leader>tu")
        end,
    })

    for name, bin in pairs(servers) do
        if vim.fn.executable(bin) == 1 then
            vim.lsp.enable(name)
        end
    end
end

return M
