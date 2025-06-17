local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
    -- Complex figure with caption and label
    s(
        { trig = "fig", dscr = "Figure with image" },
        fmta(
            [[
            #figure(
              image("<>", width: <>),
              caption: [<>],
            ) <label("<>")>
            ]],
            { i(1, "path/to/image.png"), i(2, "80%"), i(3), i(4) }
        )
    ),

    -- Table (most complex structure)
    s(
        { trig = "tab", dscr = "Table with caption" },
        fmta(
            [[
            #figure(
              table(
                columns: <>,
                stroke: none,
                table.header(
                  [<>], [<>]
                ),
                table.hline(),
                [<>], [<>],
                [<>], [<>],
              ),
              caption: [<>],
            ) <label("<>")>
            ]],
            { i(1, "2"), i(2), i(3), i(4), i(5), i(6), i(7), i(8), i(9) }
        )
    ),

    -- Equation with numbering
    s(
        { trig = "eq", dscr = "Numbered equation" },
        fmta(
            [[
            $ <> $ <label("<>")>
            ]],
            { i(1), i(2) }
        )
    ),

    -- Theorem-like box (complex formatting)
    s(
        { trig = "thm", dscr = "Theorem box" },
        fmta(
            [[
            #block(
              fill: luma(230),
              inset: 8pt,
              radius: 4pt,
              [
                *<>:* <>
              ]
            )
            ]],
            { i(1, "Theorem"), i(2) }
        )
    ),

    -- Code block with syntax highlighting
    s(
        { trig = "code", dscr = "Code block" },
        fmta(
            [[
            ```<>
            <>
            ```
            ]],
            { i(1, "python"), i(2) }
        )
    ),

    -- Bibliography entry (complex)
    s(
        { trig = "bib", dscr = "Bibliography entry" },
        fmta(
            [[
            #bibliography("<>")
            ]],
            { i(1, "references.bib") }
        )
    ),

    -- Complex enumeration with custom numbering
    s(
        { trig = "enumc", dscr = "Custom enumeration" },
        fmta(
            [[
            #enum(
              numbering: "<>",
              [<>],
              [<>],
              [<>]
            )
            ]],
            { i(1, "1.a)"), i(2), i(3), i(4) }
        )
    ),

    -- Grid layout (complex positioning)
    s(
        { trig = "grid", dscr = "Grid layout" },
        fmta(
            [[
            #grid(
              columns: (<>, <>),
              gutter: 1em,
              [<>],
              [<>],
              [<>],
              [<>]
            )
            ]],
            { i(1, "1fr"), i(2, "1fr"), i(3), i(4), i(5), i(6) }
        )
    ),
} 