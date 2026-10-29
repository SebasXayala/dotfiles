# ===== Historial =====
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# ===== Autocompletado =====
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ===== Teclas =====
bindkey -e
bindkey '^[[1;5C' forward-word      # Ctrl + →
bindkey '^[[1;5D' backward-word     # Ctrl + ←

# ===== Alias =====
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
alias tree='eza --tree --icons'
alias cat='bat --paging=never'
alias ff='fastfetch'
export BAT_THEME="ansi"

# ===== Herramientas =====
eval "$(zoxide init zsh)"
source <(fzf --zsh)
eval "$(starship init zsh)"

# ===== Plugins (resaltado siempre al final) =====
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ===== Al abrir la terminal =====
fastfetch
export PATH="$HOME/.local/bin:$PATH"
