# Dotfiles

```
███    ███  █████  ███    ██ ██    ██ ███████  ██████ ██████  ██ ██████
████  ████ ██   ██ ████   ██ ██    ██ ██      ██      ██   ██ ██ ██   ██
██ ████ ██ ███████ ██ ██  ██ ██    ██ ███████ ██      ██████  ██ ██████
██  ██  ██ ██   ██ ██  ██ ██ ██    ██      ██ ██      ██   ██ ██ ██
██      ██ ██   ██ ██   ████  ██████  ███████  ██████ ██   ██ ██ ██

        λ Write with Vim's power • Typeset with Typst or TeX
```

A small, distro-independent setup for **Neovim**, **Kitty**, **zsh** (oh-my-zsh + Starship) and **Zathura**, themed with **Tokyo Night** throughout. It started as a fork of [benbrastmckie's config](https://github.com/benbrastmckie/.config) and focuses on writing with Typst and (optionally) LaTeX.

LaTeX and Typst support are both optional. Neovim only enables a part if its tools are installed:

| Installed tool | What gets enabled |
| --- | --- |
| `typst` | `<leader>t…` compile / watch / view in Typst buffers |
| `tinymist` (auto-installed via Mason) | Typst LSP, formatting (typstyle), pin/unpin main file |
| `latexmk` (+ a TeX distribution) | VimTeX and the `<leader>l…` maps in TeX buffers |
| `texlab` (`:MasonInstall texlab`) | LaTeX LSP |
| `chktex` | LaTeX linting |

---

## 1. Install packages

Package names differ slightly between distributions, so use your package manager's search. Versions are minimums.

**Core**

- `git`, `curl`, `unzip`, `tar`, `gzip` (used by the plugin managers / Mason)
- `neovim` ≥ 0.12
- `ripgrep`, `fd` (Telescope)
- `tree-sitter-cli` and a C compiler (`gcc` or `clang`) to build Treesitter parsers
- `zsh`
- `starship`
- `kitty` ≥ 0.37 (animated cursor trail; Nerd Font symbols are built in since 0.36)
- **JetBrains Mono** font, e.g. `ttf-jetbrains-mono` / `fonts-jetbrains-mono` / `jetbrains-mono-fonts`
- `zathura` and a PDF backend: `zathura-pdf-mupdf` (or `zathura-pdf-poppler`)

**Optional**

- `zoxide` (smarter `cd`, picked up automatically by `.zshrc`)
- `typst` (Typst CLI for compile/watch)
- A TeX distribution with `latexmk` and `lualatex` (e.g. `texlive`), plus `chktex` for linting
- `xclip` / `wl-clipboard` (system clipboard on X11 / Wayland)
- Liberation / DejaVu / Noto fonts if you use the optional `fontconfig/fonts.conf`

## 2. Install oh-my-zsh and its plugins

```bash
# oh-my-zsh (unattended: no shell switch, no zsh launched)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Community plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
git clone https://github.com/zsh-users/zsh-autosuggestions     "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
```

The installer writes a default `~/.zshrc`. Step 4 replaces it.

## 3. Clone the repository

Clone it into its own folder, **not** into `~/.config`:

```bash
git clone https://github.com/Pariatorn/dotfiles.git ~/code/dotfiles
cd ~/code/dotfiles
```

## 4. Link (or copy) the configs

Back up anything you want to keep first (e.g. `mv ~/.config/nvim ~/.config/nvim.bak`).

**Option A: symlinks** (recommended; `git pull` updates everything)

```bash
mkdir -p ~/.config
ln -sfn "$PWD/nvim"                  ~/.config/nvim
ln -sfn "$PWD/kitty"                 ~/.config/kitty
ln -sfn "$PWD/zathura"               ~/.config/zathura
ln -sfn "$PWD/starship/starship.toml" ~/.config/starship.toml
ln -sfn "$PWD/zsh/.zshrc"            ~/.zshrc
ln -sfn "$PWD/fontconfig"            ~/.config/fontconfig   # optional: MS → Liberation font mapping
```

**Option B: copies** (independent from the repo)

```bash
mkdir -p ~/.config
cp -r nvim kitty zathura ~/.config/
cp starship/starship.toml ~/.config/starship.toml
cp zsh/.zshrc ~/.zshrc
cp -r fontconfig ~/.config/                               # optional
```

## 5. Finish up

```bash
chsh -s "$(command -v zsh)"   # make zsh the login shell (log out and in again)
fc-cache -f                   # refresh the font cache after installing fonts
nvim                          # lazy.nvim installs plugins, Mason installs tinymist
```

Inside Neovim, `:checkhealth` shows anything that's still missing. `:Lazy` and `:Mason` manage plugins and language servers.

Check the font in kitty with `kitty +list-fonts | grep -i jetbrains` (or pick one interactively with `kitten choose-fonts`).

Put machine-specific shell settings (PATH additions, secrets, aliases) in `~/.zshrc.local`. It's sourced automatically and not part of the repo.

---

## Structure

```
.
├── nvim/                    # Neovim (lazy.nvim)
│   ├── init.lua
│   └── lua/
│       ├── core/            # options, keymaps, autocmds (incl. buffer-local TeX/Typst maps)
│       ├── plugins/
│       │   ├── editor/      # treesitter
│       │   ├── lsp/         # mason, LSP servers, blink.cmp, nvim-lint
│       │   ├── tex/         # VimTeX (only if latexmk exists)
│       │   └── ui/          # tokyonight, alpha, bufferline, lualine, nvim-tree, telescope, which-key
│       └── utils/typst.lua  # typst compile / watch / view helpers
├── kitty/                   # kitty.conf + Tokyo Night theme.conf
├── zsh/.zshrc               # oh-my-zsh + plugins + starship
├── starship/starship.toml   # prompt
├── zathura/zathurarc        # minimal PDF viewer config
└── fontconfig/fonts.conf    # optional font fallbacks
```

## Keybindings

See [CheatSheet.md](CheatSheet.md).

## Credits

Originally forked from [benbrastmckie's config](https://github.com/benbrastmckie/.config). It has diverged a lot since, so see his repository for the comprehensive original. Thanks to everyone behind the projects used here.

## License

MIT, see [LICENSE](LICENSE).
