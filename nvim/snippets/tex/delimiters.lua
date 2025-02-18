local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local tex = require("snippets.tex.conditions")

-- mathzone detection

return {
    s(
        { trig = "lr", dscr = "Left Right Delimiters" },
        fmta(
            [[
            \left(
            <>
            \right)
            ]],
            { i(0) }
        ),
        { condition = tex.in_mathzone }
    ),
    s(
        { trig = "lrc", dscr = "Left Right Delimiters with curly braces" },
        fmta(
            [[
            \left\{
            <>
            \right\}
            ]],
            { i(0) }
        ),
        { condition = tex.in_mathzone }
    ),
    s(
        { trig = "lrb", dscr = "Left Right Delimiters with brackets" },
        fmta(
            [[
            \left[
            <>
            \right]
            ]],
            { i(0) }
        ),
        { condition = tex.in_mathzone }
    )
}