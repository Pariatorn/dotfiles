-- Typst conditions for snippets
local M = {}

-- Check if we're in a Typst math zone (between $ delimiters)
function M.in_mathzone()
    -- For Typst, we can use a simple pattern check or syntax highlighting
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    
    -- Check if cursor is between $ symbols
    local before = line:sub(1, col)
    local after = line:sub(col + 1)
    
    local dollar_before = before:gsub("\\$", ""):match(".*%$") ~= nil
    local dollar_after = after:gsub("\\$", ""):match("%$.*") ~= nil
    
    return dollar_before and dollar_after
end

-- Check if we're at the beginning of a line (for block-level snippets)
function M.in_text_line_begin()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    
    -- Check if we're at the start or after only whitespace
    local before = line:sub(1, col)
    return before:match("^%s*$") ~= nil
end

-- Check if we're in regular text (not in code blocks or math)
function M.in_text()
    return not M.in_mathzone()
end

return M 