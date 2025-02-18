# Fish shell configuration

if status is-interactive
    # Environment Variables
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx TERM xterm-256color
    set -gx MANPAGER 'nvim +Man!'

    # Remove conflicting keybindings
    bind --erase --all \ct  # Conflicts with NeoVim terminal

    # Theme and Prompt
    fish_config prompt choose scales
    set -g fish_greeting  # Disable greeting

    # Aliases
    alias vim='nvim'
    alias v='nvim'
    alias ll='ls -lah'
    alias la='ls -A'
    alias l='ls -CF'
    alias ..='cd ..'
    alias ...='cd ../..'
    alias g='git'
    alias gc='git commit'
    alias gp='git push'
    alias gst='git status'

    # Directory Navigation
    if type -q zoxide
        zoxide init fish --cmd cd | source
    end
end

# Custom Functions
function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

function update
    sudo apt update
    and sudo apt upgrade -y
    and sudo apt autoremove -y
end

# Load local config if it exists
if test -f ~/.config/fish/local.config.fish
    source ~/.config/fish/local.config.fish
end
