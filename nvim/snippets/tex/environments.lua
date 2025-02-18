local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local tex = require("snippets.tex.conditions")

return {
    s(
        { trig = "beg", dscr = "Environment Begin" },
        fmta(
            [[
            \begin{<>}
            <>
            \end{<>}
            ]],
            { i(1), i(0), rep(1) }
        ),
        { condition = tex.in_text_line_begin }
    ),
    s(
        { trig = "ali", dscr = "Environment Align" },
        fmta(
            [[
            \begin{align}
            <>
            \end{align}
            ]],
            { i(0) }
        ),
        { condition = tex.in_text_line_begin }
    ),
    s(
        { trig = "alis", dscr = "Environment Align*" },
        fmta(
            [[
            \begin{align*}
            <>
            \end{align*}
            ]],
            { i(0) }
        ),
        { condition = tex.in_text_line_begin }
    ),
    s(
        { trig = "ite", dscr = "Environment Itemize" },
        fmta(
            [[
            \begin{itemize}
            <>
            \end{itemize}
            ]],
            { i(0) }
        ),
        { condition = tex.in_text_line_begin }
    ),
    s(
        { trig = "enum", dscr = "Environment Enumerate" },
        fmta(
            [[
            \begin{enumerate}
            <>
            \end{enumerate}
            ]],
            { i(0) }
        ),
        { condition = tex.in_text_line_begin }
    ),
    s(
        { trig = "enumc", dscr = "Environment Enumerate Custom" },
        fmta(
            [[
            \begin{enumerate}[\label=<>]
            <>
            \end{enumerate}
            ]],
            { i(1, "alph*"), i(0) }
        ),
        { condition = tex.in_text_line_begin }
    ),
    s(
        { trig = "fig", dscr = "Environment Figure" },
        fmta(
            [[
            \begin{figure}[h]
            \centering
            \includegraphics[width=\textwidth]{<>}
            \caption{<>}
            \label{fig:<>}
            \end{figure}
            ]],
            { i(1, "path/to/image"), i(2), i(3) }
        ),
        { condition = tex.in_text_line_begin }
    ),
    s(
        { trig = "figp", dscr = "Environment Figure* Position" },
        fmta(
            [[
            \begin{figure}[<>]
            \centering
            \includegraphics[width=\textwidth]{<>}
            \caption{<>}
            \label{fig:<>}
            \end{figure}
            ]],
            { i(1, "h"), i(2, "path/to/image"), i(3), i(4) }
        ),
        { condition = tex.in_text_line_begin }
    ),
    s(
        { trig = "tab", dscr = "Environment Table with booktabs" },
        fmta(
            [[
            \begin{table}[h]
            \centering
            \caption{<>}
            \begin{tabular}{<>}
            \toprule
            <>
            \midrule
            <>
            \bottomrule
            \end{tabular}
            \label{tab:<>}
            \end{table}
            ]],
            { i(1), i(2, "positions"), i(4), i(0), i(3) }
        ),
        { condition = tex.in_text_line_begin }
    ),
    s(
        { trig = "tabp", dscr = "Environment Table* Position" },
        fmta(
            [[
            \begin{table}[<>]
            \centering
            \caption{<>}
            \begin{tabular}{<>}
            \toprule
            <>
            \midrule
            <>
            \bottomrule
            \end{tabular}
            \label{tab:<>}
            \end{table}
            ]],
            { i(1, "h"), i(2), i(3, "positions"), i(5), i(0), i(4) }
        ),
        { condition = tex.in_text_line_begin }
    ),
}