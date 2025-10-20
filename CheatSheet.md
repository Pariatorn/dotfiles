# Cheat Sheet

This document provides a comprehensive list of keybindings and features available in this configuration. The setup is optimized for academic writing in LaTeX and general text editing in Neovim.

## Table of Contents

1. [Core Navigation](#core-navigation)
2. [Window Management](#window-management)
3. [File and Buffer Management](#file-and-buffer-management)
4. [Search and Find](#search-and-find)
5. [Code and LSP](#code-and-lsp)
6. [Spell Checking](#spell-checking)
7. [LaTeX Features](#latex-features)
8. [Typst Features](#typst-features)

## Core Navigation

### Window Navigation
- `<C-h>` - Navigate to left window
- `<C-j>` - Navigate to bottom window
- `<C-k>` - Navigate to top window
- `<C-l>` - Navigate to right window

### Window Resizing
- `<C-Up>` - Decrease window height
- `<C-Down>` - Increase window height
- `<C-Left>` - Decrease window width
- `<C-Right>` - Increase window width

## File and Buffer Management

### File Operations
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>Q` - Force quit
- `<leader>e` - Toggle file explorer (NvimTree)

### Buffer Management
- `<leader>bc` - Close current buffer
- `<leader>bC` - Force close current buffer
- `<leader>bn` - New buffer
- `<leader>ba` - Close all buffers except current
- `<leader>bl` - List all buffers
- `<S-l>` - Next buffer
- `<S-h>` - Previous buffer

## Search and Find

### Telescope
- `<leader>ff` - Find files
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Search buffers
- `<leader>fh` - Search help tags

## Code and LSP

### Code Navigation
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `gr` - Find references
- `K` - Show documentation

### Code Actions
- `<leader>cr` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>cf` - Format document

## Spell Checking
- `<leader>st` - Toggle Spell Check
- `<leader>se` - English (US)
- `<leader>sb` - English (GB)
- `<leader>sd` - German
- `<leader>sf` - French
- `<leader>sm` - Multi (EN+DE)
- `<leader>sn` - Choose First Suggestion
- `<leader>ss` - Show Suggestions
- `<leader>sp` - Next Misspelled Word
- `<leader>sP` - Previous Misspelled Word
- `<leader>sa` - Add Word to Dictionary

## LaTeX Features

### VimTeX Commands
- `<leader>lc` - Compile (VimtexCompileSS)
- `<leader>lv` - View PDF
- `<leader>lt` - Toggle table of contents
- `<leader>le` - Show errors
- `<leader>lo` - Show compile output
- `<leader>li` - Show info
- `<leader>lk` - Clean auxiliary files

## Typst Features

### Document Compilation
- `<leader>tw` - Watch & compile (automatically recompiles on changes)
- `<leader>tc` - Compile once (single compilation)
- `<leader>tv` - View PDF (opens compiled PDF)

### Document Management
- `<leader>tf` - Format document (using typstyle)
- `<leader>tp` - Pin main file (for multi-file projects)
- `<leader>tu` - Unpin main file
- `<leader>tr` - Toggle web preview (live preview in browser)
- `<leader>ts` - Sync preview with cursor position

### Features
- **Automatic compilation**: Fast incremental compilation on save
- **Live preview**: Real-time web-based preview with cursor sync
- **Multi-file support**: Pin main files for complex projects
- **Smart PDF viewing**: Auto-detects available viewers (Zathura, system default)
- **LSP integration**: Full language server support with tinymist

## Which-Key Groups

The following key groups are available through Which-Key (`<leader>` key):
- `<leader>f` - Find operations
- `<leader>l` - LaTeX operations
- `<leader>t` - Typst operations
- `<leader>r` - Refactor operations
- `<leader>b` - Buffer operations
- `<leader>c` - Code operations
- `<leader>s` - Spell Checking

Note: The `<leader>` key is mapped to the space bar.

## Additional Features

### Terminal Integration
The configuration includes integration with:
- Kitty terminal emulator
- Fish shell
- Zathura PDF viewer (for LaTeX)

For specific configurations of these tools, see their respective config files:
- Kitty: `~/.config/kitty/kitty.conf`
- Fish: `~/.config/fish/config.fish`
- Zathura: `~/.config/zathura/zathurarc`




