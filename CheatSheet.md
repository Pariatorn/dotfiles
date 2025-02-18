# Cheat Sheet

This document provides a comprehensive list of keybindings and features available in this configuration. The setup is optimized for academic writing in LaTeX and general text editing in Neovim.

## Table of Contents

1. [Core Navigation](#core-navigation)
2. [Window Management](#window-management)
3. [File Operations](#file-operations)
4. [LaTeX Features](#latex-features)
5. [Code and LSP](#code-and-lsp)
6. [Search and Find](#search-and-find)

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

### Buffer Navigation
- `<S-l>` - Next buffer
- `<S-h>` - Previous buffer

## File Operations

### Basic Operations
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>Q` - Force quit
- `<leader>e` - Toggle file explorer (NvimTree)

### Buffer Management
- `<leader>bd` - Delete buffer
- `<S-l>` - Next buffer
- `<S-h>` - Previous buffer

## LaTeX Features

### VimTeX Commands
- `<leader>lc` - Compile (VimtexCompileSS)
- `<leader>lv` - View PDF
- `<leader>lt` - Toggle table of contents
- `<leader>le` - Show errors
- `<leader>ls` - Stop compilation
- `<leader>li` - Show info
- `<leader>lk` - Clean auxiliary files

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

## Search and Find

### Telescope
- `<leader>ff` - Find files
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Search buffers
- `<leader>fh` - Search help tags

## Which-Key Groups

The following key groups are available through Which-Key (`<leader>` key):
- `<leader>f` - Find operations
- `<leader>l` - LaTeX operations
- `<leader>r` - Refactor operations
- `<leader>b` - Buffer operations
- `<leader>c` - Code operations

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




