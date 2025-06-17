local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local typst = require("typst.conditions")

return {
    -- Complex fractions and roots
    s({trig = "ff", dscr = "Fraction"}, 
      fmta("(<>)/(<>)", {i(1), i(2)}),
      { condition = typst.in_mathzone }
    ),
    s({trig = "sq", dscr = "Square root"}, 
      fmta("sqrt(<>)", {i(1)}),
      { condition = typst.in_mathzone }
    ),

    -- Complex integrals
    s(
        {trig = "intt", dscr = "Integral with limits"},
        fmta(
            [[
            integral_<>^<> <> dif <>
            ]],
            {i(1), i(2), i(0), i(3)}
        ),
        { condition = typst.in_mathzone }
    ),
    s(
        {trig = "innt", dscr = "Symmetric integral"},
        fmta(
            [[
            integral_(-<>)^<> <> dif <>
            ]],
            {i(1), rep(1), i(0), i(2)}
        ),
        { condition = typst.in_mathzone }
    ),

    -- Complex sums
    s(
        {trig = "sum", dscr = "Sum with limits"},
        fmta(
            [[
            sum_(<>)^(<>) <>
            ]],
            {i(1), i(2), i(0)}
        ),
        { condition = typst.in_mathzone }
    ),
    s(
        {trig = "summ", dscr = "Sum with lower limit"},
        fmta(
            [[
            sum_(<>) <>
            ]],
            {i(1), i(0)}
        ),
        { condition = typst.in_mathzone }
    ),

    -- Products
    s(
        {trig = "prod", dscr = "Product with limits"},
        fmta(
            [[
            product_(<>)^(<>) <>
            ]],
            {i(1), i(2), i(0)}
        ),
        { condition = typst.in_mathzone }
    ),

    -- Limits
    s(
        {trig = "lim", dscr = "Limit"},
        fmta(
            [[
            lim_(<> -> <>) <>
            ]],
            {i(1), i(2), i(0)}
        ),
        { condition = typst.in_mathzone }
    ),

    -- Matrix (complex in both systems)
    s(
        {trig = "pmat", dscr = "Parentheses matrix"},
        fmta(
            [[
            mat(
              <>, <>;
              <>, <>
            )
            ]],
            {i(1), i(2), i(3), i(4)}
        ),
        { condition = typst.in_mathzone }
    ),
} 