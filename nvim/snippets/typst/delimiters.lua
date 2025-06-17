local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local typst = require("typst.conditions")

return {
    -- Auto-sizing delimiters (complex in Typst)
    s(
        { trig = "lr", dscr = "Auto-sizing parentheses" },
        fmta(
            [[
            lr(( <> ))
            ]],
            { i(0) }
        ),
        { condition = typst.in_mathzone }
    ),
    s(
        { trig = "lrc", dscr = "Auto-sizing curly braces" },
        fmta(
            [[
            lr({ <> })
            ]],
            { i(0) }
        ),
        { condition = typst.in_mathzone }
    ),
    s(
        { trig = "lrb", dscr = "Auto-sizing brackets" },
        fmta(
            [[
            lr([ <> ])
            ]],
            { i(0) }
        ),
        { condition = typst.in_mathzone }
    ),
    s(
        { trig = "lra", dscr = "Auto-sizing angle brackets" },
        fmta(
            [[
            lr(angle.l <> angle.r)
            ]],
            { i(0) }
        ),
        { condition = typst.in_mathzone }
    ),
    s(
        { trig = "lrv", dscr = "Auto-sizing absolute value" },
        fmta(
            [[
            lr(| <> |)
            ]],
            { i(0) }
        ),
        { condition = typst.in_mathzone }
    ),
    s(
        { trig = "lrn", dscr = "Auto-sizing norm" },
        fmta(
            [[
            lr(|| <> ||)
            ]],
            { i(0) }
        ),
        { condition = typst.in_mathzone }
    ),
} 