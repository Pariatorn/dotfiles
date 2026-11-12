-- Treesitter (`main` branch: parsers + queries only; highlighting/indent are
-- started by Neovim itself). Requires the `tree-sitter` CLI and a C compiler.
-- Incremental selection is built into Neovim 0.12: `v` then `an` / `in`.
-- Commenting is built in as well: gc / gcc.
local parsers = { "lua", "vim", "vimdoc", "markdown", "markdown_inline", "typst", "bibtex", "bash" }

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            -- Building parsers needs the tree-sitter CLI and a C compiler; skip quietly
            -- otherwise (Neovim still ships lua, vim, vimdoc, markdown parsers).
            local has_cc = vim.iter({ "cc", "gcc", "clang" }):any(function(c) return vim.fn.executable(c) == 1 end)
            if vim.fn.executable("tree-sitter") == 1 and has_cc then
                require("nvim-treesitter").install(parsers)
            end

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
                callback = function(ev)
                    -- VimTeX's syntax is richer for LaTeX than the TS grammar
                    if ev.match == "tex" and vim.fn.executable("latexmk") == 1 then return end
                    if pcall(vim.treesitter.start, ev.buf) then
                        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
}
