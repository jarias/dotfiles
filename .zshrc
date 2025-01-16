typeset -U PATH

cdpath+=(~/Projects)

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit ice wait atload'_history_substring_search_config' silent
zinit light zsh-users/zsh-history-substring-search
zinit pack"default+keys" for fzf

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Keybindings
bindkey -v

function _history_substring_search_config() {
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down

  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

  # bind k and j for VI mode
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
}

function randp() {
  LC_ALL=C tr -dc A-Z-a-z-0-9 < /dev/urandom | head -c${1:-32}
}

# Aliases
alias cd="z"
alias ..='z ..'
alias a='ls -A'
alias c='clear'
alias cl='clear; l'
alias cls='clear; ls'
alias dc='docker rm $(docker ps -aq)'
alias dci='docker rmi $(docker images -q -f dangling=true)'
alias e='exit'
alias gl='git l'
alias gp='git push -u'
alias gup='git pull --rebase'
alias h='history'
alias ipe='curl ipinfo.io/ip'
alias k='kubectl'
alias kctx='kubectl ctx'
alias kdi='kubectl describe ingress'
alias kdp='kubectl describe pod'
alias kds='kubectl describe svc'
alias kgi='kubectl get ingress'
alias kgp='kubectl get pod'
alias kgs='kubectl get svc'
alias kl='kubectl logs'
alias kns='kubectl ns'
alias l='ls -lhGt'
alias l.='ls -d .[^.]*'
alias la='ls -A -l -G'
alias ll='ls -lh'
alias ls='ls -G --color=auto'
alias lt='ls -lt'
alias md='mkdir -p'
alias reload='source ~/.zshrc'
alias timestamp='date +%s'
alias vimdiff='nvim -d'
alias vim='nvim'
alias y='yazi'

#direnv
eval "$(direnv hook zsh)"
#direnv end

#sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
[[ -s "$SDKMAN_DIR/contrib/completion/bash/sdk" ]] && source $SDKMAN_DIR/contrib/completion/bash/sdk
#sdkman end

##nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#nvm end

eval "$(starship init zsh)"

eval "$(zoxide init zsh)"
