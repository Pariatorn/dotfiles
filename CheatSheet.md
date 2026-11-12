# Cheat Sheet

`<leader>` is **Space**. Press it and wait to see every available key in which-key.

## Navigation

| Keys | Action |
| --- | --- |
| `<C-h/j/k/l>` | Move to window left / down / up / right |
| `<C-Up/Down/Left/Right>` | Resize window |
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `j` / `k` | Move by visual (wrapped) line |

## Files and buffers

| Keys | Action |
| --- | --- |
| `<leader>w` / `<leader>q` / `<leader>Q` | Save / quit / force quit |
| `<leader>e` | Toggle file explorer (nvim-tree) |
| `<leader>bc` / `<leader>bC` | Close / force close buffer |
| `<leader>bn` | New buffer |
| `<leader>ba` | Close all other buffers |

## Find (Telescope)

| Keys | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |

## Code and LSP

| Keys | Action |
| --- | --- |
| `gd` / `gD` | Definition / declaration |
| `K` | Hover documentation *(Neovim default)* |
| `grr` / `gri` / `grn` / `gra` | References / implementation / rename / code action *(defaults)* |
| `gO` | Document symbols *(default)* |
| `]d` / `[d` | Next / previous diagnostic *(default)* |
| `<leader>cr` / `<leader>ca` | Rename / code actions |
| `<leader>cf` | Format document (Typst: typstyle) |
| `<leader>cd` | Diagnostics (Telescope) |
| `<leader>cj` / `<leader>ck` | Next / previous diagnostic with float |
| `<leader>cq` | Diagnostics to location list |
| `<leader>cl` | Lint file (if a linter is installed) |

## Editing

| Keys | Action |
| --- | --- |
| `gcc` / `gc{motion}` | Toggle comment *(Neovim default)* |
| `v` then `an` / `in` | Grow / shrink selection by syntax node *(Neovim 0.12 default)* |

## Completion (blink.cmp)

| Keys | Action |
| --- | --- |
| `<Tab>` / `<S-Tab>` | Next / previous item |
| `<CR>` | Accept |
| `<C-Space>` / `<C-e>` | Open / close menu |
| `<C-f>` / `<C-b>` | Scroll documentation |

## Spelling

Turned on automatically for TeX, Typst, Markdown and git commits.

| Keys | Action |
| --- | --- |
| `<leader>st` | Toggle spell check |
| `<leader>se` / `sb` / `sd` / `sf` / `sm` | English US / GB / German / French / EN+DE |
| `<leader>sn` | Take first suggestion |
| `<leader>ss` | Show suggestions |
| `<leader>sp` / `<leader>sP` | Next / previous misspelled word |
| `<leader>sa` | Add word to dictionary (`:SpellAdd [word]`) |

## Typst (only in `.typ` buffers)

| Keys | Action |
| --- | --- |
| `<leader>tc` | Compile once |
| `<leader>tw` | Toggle `typst watch` (recompile on change) |
| `<leader>tv` | Open PDF (Zathura, else system viewer) |
| `<leader>tp` / `<leader>tu` | Pin / unpin main file (tinymist, multi-file projects) |

## LaTeX (only in `.tex` buffers, only if `latexmk` is installed)

| Keys | Action |
| --- | --- |
| `<leader>lc` | Toggle continuous compilation (lualatex) |
| `<leader>lv` | View PDF (forward search in Zathura) |
| `<leader>lt` | Toggle table of contents |
| `<leader>le` / `<leader>lo` | Errors / compiler output |
| `<leader>li` | VimTeX info |
| `<leader>lk` | Clean auxiliary files |

In Zathura, `Ctrl+click` jumps back to the source line (SyncTeX).

## Zathura

| Keys | Action |
| --- | --- |
| `j` / `k` / `h` / `l` | Scroll |
| `K` / `J` | Zoom in / out |
| `<Space>` | Table of contents |
| `w` | Toggle dark recolor |
| `R` | Rotate |
| `<C-v>` | Fullscreen |

## Kitty

| Keys | Action |
| --- | --- |
| `ctrl+space` then `c` / `k` | New tab (in cwd) / close tab |
| `ctrl+space` then `n` / `p` | Next / previous tab |
| `ctrl+shift+t` | New tab in cwd |
| `ctrl+shift+enter` | New window in cwd |
| `ctrl+shift+c` / `ctrl+shift+v` | Copy / paste (selection is also copied automatically) |
| `ctrl+shift+=` / `ctrl+shift+-` / `ctrl+shift+backspace` | Font size + / − / reset |

## zsh

- Autosuggestions: `→` or `End` accepts the grey suggestion.
- oh-my-zsh `git` plugin aliases: `gst`, `ga`, `gc`, `gp`, `gl`, `gd`, `gco`, … (`alias | grep git`).
- `mkcd <dir>` creates a directory and enters it. `v` / `vim` run `nvim`.
- With `zoxide` installed, `cd foo` jumps to the most-used matching directory.
