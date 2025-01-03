typeset -U path cdpath fpath manpath

# Use viins keymap as the default.
bindkey -v

CDPATH="$HOME/Projects"

unamestr=$(uname)

autoload -Uz compinit && compinit

autoload bashcompinit && bashcompinit
source $HOME/.sdkman/contrib/completion/bash/sdk

if [ -f "$HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh" ]; then
  path+="$HOME/.zsh/plugins/zsh-history-substring-search"
  fpath+="$HOME/.zsh/plugins/zsh-history-substring-search"
  source "$HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
fi

HISTSIZE="10000"
SAVEHIST="10000"
HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY

GPG_TTY="$(tty)"
export GPG_TTY
gpg-connect-agent updatestartuptty /bye > /dev/null

if [ -z "$INSIDE_EMACS" ]; then
  eval "$(starship init zsh)"
fi

fzfbasedir="/usr/share/fzf"

if [[ "$unamestr" == 'Darwin' ]]; then
  fzfbasedir="/opt/homebrew/opt/fzf/shell"
fi

if [[ $options[zle] = on ]]; then
  if [ -f "$fzfbasedir/completion.zsh" ]; then
    . $fzfbasedir/completion.zsh
  fi
  if [ -f "$fzfbasedir/key-bindings.zsh" ]; then
    . $fzfbasedir/key-bindings.zsh
  fi
  if [ -f "$fzfbasedir/shell/key-bindings.zsh" ]; then
    . $fzfbasedir/shell/key-bindings.zsh
  fi
fi

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# autocompletion with an arrow-key driven interface
zstyle ':completion:*:*:*:*:*' menu select

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

zstyle '*' single-ignored show

# Automatically update PATH entries
zstyle ':completion:*' rehash true

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}"  end-of-line
bindkey "\e[3~"              delete-char
bindkey "^[[H"               beginning-of-line
bindkey "^[[F"               end-of-line

function randp() {
  LC_ALL=C tr -dc A-Z-a-z-0-9 < /dev/urandom | head -c${1:-32}
}

# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ..='cd ..'
alias a='ls -A'
alias c='clear'
alias cdd='cd -'
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

if [[ "$unamestr" == 'Linux' ]]; then
  hostname=$(hostnamectl hostname)

  if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    if [ "$hostname" = "elara" ]; then
      exec sway --unsupported-gpu
    else 
      exec sway
    fi
  fi
fi

#direnv
eval "$(direnv hook zsh)"
#direnv end

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#nvm end

# pnpm
export PNPM_HOME="/home/jarias/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

#sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
#sdkman end

