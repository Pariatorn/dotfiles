local M = {}

-- Count diagnostics by severity
local function count_diagnostics()
    local diagnostics = vim.diagnostic.get(0)
    local counts = {
        error = 0,
        warning = 0,
        info = 0,
        hint = 0
    }
    
    for _, d in ipairs(diagnostics) do
        if d.severity == vim.diagnostic.severity.ERROR then
            counts.error = counts.error + 1
        elseif d.severity == vim.diagnostic.severity.WARN then
            counts.warning = counts.warning + 1
        elseif d.severity == vim.diagnostic.severity.INFO then
            counts.info = counts.info + 1
        elseif d.severity == vim.diagnostic.severity.HINT then
            counts.hint = counts.hint + 1
        end
    end
    
    return counts
end

function M.setup()
    local lint = require("lint")
    
    lint.linters_by_ft = {
        tex = { "chktex" },
        latex = { "chktex" },
        bib = { "chktex" },
    }
    
    -- Set up autocommands for linting
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        callback = function()
            require("lint").try_lint()
        end,
    })
    
    -- Commands for manual linting
    vim.api.nvim_create_user_command("Lint", function()
        require("lint").try_lint()
        
        -- Report diagnostic counts
        local counts = count_diagnostics()
        local msg = string.format("Lint complete: %d errors, %d warnings, %d info, %d hints", 
            counts.error, counts.warning, counts.info, counts.hint)
        vim.notify(msg, vim.log.levels.INFO)
        
        -- If there are errors or warnings, prompt to open diagnostics
        if counts.error > 0 or counts.warning > 0 then
            vim.notify("Use <leader>cd to see all diagnostics", vim.log.levels.INFO)
        end
    end, { desc = "Trigger linting for current file" })
end

return M 