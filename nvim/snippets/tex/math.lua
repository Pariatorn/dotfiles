local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local tex = require("snippets.tex.conditions")

return {
    -- operators
    s({trig = "ff", dscr = "Fraction"}, 
      fmta("\\frac{<>}{<>}", {i(1), i(2)}),
      { condition = tex.in_mathzone }
    ),
    s({trig = "sq", dscr = "Square root"}, 
      fmta("\\sqrt{<>}", {i(1)}),
      { condition = tex.in_mathzone }
    ),

    s(
        {trig = "intt", dscr = "Integral with upper and lower limits"},
        fmta(
            [[
            \int_{<>}^{<>}<>\mathrm{\mathstrut d<>}
            ]],
            {i(1), i(2), i(0), i(3)}
        ),
        { condition = tex.in_mathzone }
    ),
    s(
        {trig = "innt", dscr = "Integral with symmetric upper and lower limits"},
        fmta(
            [[
            \int_{-<>}^{<>}<>\mathrm{\mathstrut d<>}
            ]],
            {i(1), rep(1), i(0), i(2)}
        ),
        { condition = tex.in_mathzone }
    ),
    s(
        {trig = "sum", dscr = "Sum with upper and lower limits"},
        fmta(
            [[
            \sum_{<>}^{<>}<>
            ]],
            {i(1), i(2), i(0)}
        ),
        { condition = tex.in_mathzone }
    ),
    s(
        {trig = "summ", dscr = "Sum with lower limit"},
        fmta(
            [[
            \sum_{<>}<>
            ]],
            {i(1), i(0)}
        ),
        { condition = tex.in_mathzone }
    ),

    -- typesetting
    s({trig = "sub", dscr = "Subscript"}, 
      fmta("_{<>}", { i(1) }),
      { condition = tex.in_mathzone }
    ),
    s({trig = "subr", dscr = "Subscript with mathrm"}, 
      fmta("_{\\mathrm{<>}}", { i(1) }),
      { condition = tex.in_mathzone }
    ),
    s({trig = "sup", dscr = "Superscript"}, 
      fmta("^{<>}", { i(1) }),
      { condition = tex.in_mathzone }
    ),
}