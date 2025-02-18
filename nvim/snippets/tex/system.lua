local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local tex = require("snippets.tex.conditions")

return {
    -- preamble
    s({trig= "up", dscr = "usepackage"}, 
      fmta("\\usepackage{<>}", {i(1)}), 
      { condition = tex.in_text_line_begin }
    ),
    s(
        { trig = "upo", dscr = "usepackage with options" },
        fmta([[\usepackage[<>]{<>}]], { i(1), i(2) }),
        { condition = tex.in_text_line_begin }
    ),

    -- sections
    s({ trig = "sec", dscr = "section" }, 
      fmta([[\section{<>}]], { i(1) }), 
      { condition = tex.in_text_line_begin }
    ),
    s({ trig = "ssec", dscr = "subsection" }, 
      fmta([[\subsection{<>}]], { i(1) }), 
      { condition = tex.in_text_line_begin }
    ),
    s({ trig = "sssec", dscr = "subsubsection" }, 
      fmta([[\subsubsection{<>}]], { i(1) }), 
      { condition = tex.in_text_line_begin }
    ),
    s({ trig = "par", dscr = "paragraph" }, 
      fmta([[\paragraph{<>}]], { i(1) }), 
      { condition = tex.in_text_line_begin }
    ),

    -- labels and references
    s({ trig = "lab", dscr = "label" }, 
      fmta([[\label{<>}]], { i(1) }),
      { condition = tex.in_text_not_comment }
    ),
    s({ trig = "flab", dscr = "Figure label" }, 
      fmta([[\label{fig:<>}]], { i(1) }),
      { condition = tex.in_text_not_comment }
    ),
    s({ trig = "elab", dscr = "Equation label" }, 
      fmta([[\label{eq:<>}]], { i(1) }),
      { condition = tex.in_text_not_comment }
    ),
    s({ trig = "tlab", dscr = "Tabular label" }, 
      fmta([[\label{tab:<>}]], { i(1) }),
      { condition = tex.in_text_not_comment }
    ),

    s({ trig = "ref", dscr = "reference" }, 
      fmta([[\ref{<>}]], { i(1) }),
      { condition = tex.in_text_not_comment }
    ),
    s({ trig = "fref", dscr = "Figure reference" }, 
      fmta([[\ref{fig:<>}]], { i(1) }),
      { condition = tex.in_text_not_comment }
    ),
    s({ trig = "eref", dscr = "Equation reference" }, 
      fmta([[\ref{eq:<>}]], { i(1) }),
      { condition = tex.in_text_not_comment }
    ),
    s({ trig = "tref", dscr = "Tabular reference" }, 
      fmta([[\ref{tab:<>}]], { i(1) }),
      { condition = tex.in_text_not_comment }
    ),

    s({ trig = "cit", dscr = "Cite" }, 
      fmta([[\cite{<>}]], { i(1) }),
      { condition = tex.in_text_not_comment }
    ),
}