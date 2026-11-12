local M = {}

-- Linters per filetype; a linter is only used when its executable exists
local wanted = {
    tex = { "chktex" },
    bib = { "chktex" },
}

function M.setup()
    local lint = require("lint")

    lint.linters_by_ft = {}
    for ft, linters in pairs(wanted) do
        local available = vim.tbl_filter(function(l) return vim.fn.executable(l) == 1 end, linters)
        if #available > 0 then lint.linters_by_ft[ft] = available end
    end

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("UserLint", { clear = true }),
        callback = function() lint.try_lint() end,
    })

    vim.api.nvim_create_user_command("Lint", function()
        if not lint.linters_by_ft[vim.bo.filetype] then
            vim.notify("No linter available for '" .. vim.bo.filetype .. "'", vim.log.levels.WARN)
            return
        end
        lint.try_lint()
        vim.notify("Linting… see <leader>cd for diagnostics")
    end, { desc = "Lint current file" })
end

return M
