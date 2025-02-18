local ls = require("luasnip")
local line_begin = require("luasnip.extras.expand_conditions").line_begin

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

-- Combined conditions
tex.in_text_line_begin = function()
    return tex.in_text() and line_begin()
end

tex.in_mathzone_line_begin = function()
    return tex.in_mathzone() and line_begin()
end

tex.in_text_not_comment = function()
    return tex.in_text() and not tex.in_comment()
end

tex.in_mathzone_not_comment = function()
    return tex.in_mathzone() and not tex.in_comment()
end

return tex 