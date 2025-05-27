local ls = require("luasnip")

local tex = {}

tex.in_mathzone = function()  -- math context detection
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

tex.in_text = function()
    return not tex.in_mathzone()
end

tex.in_comment = function()  -- comment detection
    return vim.fn['vimtex#syntax#in_comment']() == 1
end

tex.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

-- Line begin function that works with LuaSnip's context
tex.line_begin = function(line_to_cursor, matched_trigger, captures)
    -- If line_to_cursor is nil, we get it ourselves
    if not line_to_cursor then
        line_to_cursor = vim.api.nvim_get_current_line():sub(1, vim.api.nvim_win_get_cursor(0)[2])
    end
    
    -- Check if we're at the beginning of a line (possibly with whitespace)
    return line_to_cursor:match("^%s*$") ~= nil
end

-- Combined conditions using the proper line_begin function
tex.in_text_line_begin = function(line_to_cursor, matched_trigger, captures)
    return tex.in_text() and tex.line_begin(line_to_cursor, matched_trigger, captures)
end

tex.in_mathzone_line_begin = function(line_to_cursor, matched_trigger, captures)
    return tex.in_mathzone() and tex.line_begin(line_to_cursor, matched_trigger, captures)
end

tex.in_text_not_comment = function()
    return tex.in_text() and not tex.in_comment()
end

tex.in_mathzone_not_comment = function()
    return tex.in_mathzone() and not tex.in_comment()
end

return tex 