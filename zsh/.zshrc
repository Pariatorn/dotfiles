# ~/.zshrc — zsh + oh-my-zsh + starship
# Per-machine overrides go into ~/.zshrc.local (sourced at the end).

# --- oh-my-zsh ---------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""                       # prompt is drawn by starship
DISABLE_AUTO_TITLE="false"
COMPLETION_WAITING_DOTS="true"
zstyle ':omz:update' mode reminder # never auto-update silently

# zsh-syntax-highlighting must stay last
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Autosuggestion color: Tokyo Night comment grey
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#565f89"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source "$ZSH/oh-my-zsh.sh"

# --- Environment -------------------------------------------------------------
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!'
export GPG_TTY=$(tty)              # lets gpg (e.g. git commit signing) ask for the passphrase

# --- History -----------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS SHARE_HISTORY

# --- Aliases -----------------------------------------------------------------
alias v='nvim'
alias vim='nvim'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias g='git'
# gst, gc, gp, ... come from the oh-my-zsh git plugin

# --- Functions ---------------------------------------------------------------
mkcd() { mkdir -p -- "$1" && cd -- "$1"; }

# --- Optional tools ----------------------------------------------------------
command -v zoxide   >/dev/null && eval "$(zoxide init zsh --cmd cd)"
command -v starship >/dev/null && eval "$(starship init zsh)"

# --- Local overrides ---------------------------------------------------------
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
