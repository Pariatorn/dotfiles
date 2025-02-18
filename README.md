# Dotfiles

```
███    ███  █████  ███    ██ ██    ██ ███████  ██████ ██████  ██ ██████  
████  ████ ██   ██ ████   ██ ██    ██ ██      ██      ██   ██ ██ ██   ██ 
██ ████ ██ ███████ ██ ██  ██ ██    ██ ███████ ██      ██████  ██ ██████  
██  ██  ██ ██   ██ ██  ██ ██ ██    ██      ██ ██      ██   ██ ██ ██      
██      ██ ██   ██ ██   ████  ██████  ███████  ██████ ██   ██ ██ ██      
                                                                          
     λ Write with Vim's Power • Compile with TeX's Grace • \begin{art}
```

A streamlined configuration for Neovim, Kitty, Zathura, and Fish shell, forked and adapted from [benbrastmckie's config](https://github.com/benbrastmckie/.config). The main goal of this fork is to provide a minimal yet powerful setup for writing and development, with special focus on LaTeX integration.

## Features

- **Neovim** (v0.9.5+) configuration with:
  - LaTeX integration via VimTeX
  - Modern UI with Lazy package manager
  - Efficient code completion and LSP support
  - Custom keybindings for improved workflow
- **Kitty** terminal emulator with:
  - Modern, GPU-accelerated performance
  - Custom color scheme and fonts
  - Convenient keyboard shortcuts
- **Zathura** PDF viewer with:
  - Vim-like keybindings
  - Synctex support for LaTeX
  - Dark mode and custom colors
- **Fish** shell configuration with:
  - Enhanced command completion
  - Custom prompt and aliases
  - Integration with common tools

## Requirements

- Neovim (>= 0.9.5)
- Git
- Node.js and npm
- Python 3 and pip
- A Nerd Font (included in repo)
- LaTeX distribution (for LaTeX support)
- ripgrep, fd-find (for telescope)

## Quick Installation

1. Clone this repository:
```bash
git clone https://github.com/Pariatorn/config-files.git ~/.config
```

2. Install required dependencies (example using apt-based systems):
```bash
# Core dependencies
sudo apt install neovim python3-pip nodejs npm ripgrep fd-find

# Optional but recommended
sudo apt install kitty zathura fish
```

3. Install Python provider for Neovim:
```bash
pip3 install --user pynvim
```

4. Install the included Nerd Font:
```bash
mkdir -p ~/.local/share/fonts
cp -r ~/.config/fonts/MesloLGS\ NF/* ~/.local/share/fonts/
fc-cache -f -v
```

5. Set up configurations:
```bash
# Fish shell (optional)
chsh -s /usr/bin/fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source

# Neovim will install plugins on first launch
nvim
```

## Configuration Structure

```
.
├── nvim/           # Neovim configuration
├── kitty/          # Kitty terminal configuration
├── zathura/        # Zathura PDF viewer configuration
├── fish/           # Fish shell configuration
└── fonts/          # Nerd Fonts
```

## Customization

- Neovim: Edit `~/.config/nvim/init.lua` and files in `~/.config/nvim/lua/`
- Kitty: Edit `~/.config/kitty/kitty.conf`
- Zathura: Edit `~/.config/zathura/zathurarc`
- Fish: Edit `~/.config/fish/config.fish`

## Key Features and Bindings

See [CheatSheet.md](CheatSheet.md) for detailed keybindings and features.

## Credits

This configuration was originally forked from [benbrastmckie's config](https://github.com/benbrastmckie/.config). Later, I diverged more and more from the original config and added my own features tailored to my needs. Please see his original repository for the comprehensive version and additional features.

Thanks a lot to the other contributors of the different projects that I used in this configuration. I know, there is a lot of work put into them.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

To delete the welcome message, run:

    set -U fish_greeting ""
