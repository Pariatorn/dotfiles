local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local tex = require("snippets.tex.conditions")

return {
    -- Text mode commands
    s({trig = "tbf", dscr = "Textbf"}, 
      fmta("\\textbf{<>}", {i(0)}),
      { condition = tex.in_text }
    ),
    s({trig = "tit", dscr = "Italic"}, 
      fmta("\\textit{<>}", {i(0)}),
      { condition = tex.in_text }
    ),
    s({trig = "tsub", dscr = "Textsubscript"}, 
      fmta("\\textsubscript{<>}", {i(0)}),
      { condition = tex.in_text }
    ),
    s({trig = "tsup", dscr = "Textsuperscript"}, 
      fmta("\\textsuperscript{<>}", {i(0)}),
      { condition = tex.in_text }
    ),

    -- Math mode commands
    s({trig = "mrm", dscr = "Mathrm"}, 
      fmta("\\mathrm{<>}", {i(0)}),
      { condition = tex.in_mathzone }
    ),
    s({trig = "mbf", dscr = "Mathbf"}, 
      fmta("\\mathbf{<>}", {i(0)}),
      { condition = tex.in_mathzone }
    ),
    s({trig = "mbb", dscr = "Mathbb"}, 
      fmta("\\mathbb{<>}", {i(0)}),
      { condition = tex.in_mathzone }
    ),
}