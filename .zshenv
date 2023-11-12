export EDITOR="vim"
export PATH="$PATH:$HOME/.poetry/bin:$HOME/.local/bin"
export PATH="$PATH:/home/jarias/.local/share/JetBrains/Toolbox/scripts"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.dotnet:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

. "$HOME/.cargo/env"

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP="${XDG_SESSION_DESKTOP:-sway}"
export XDG_SESSION_TYPE=wayland

export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export OBS_USE_EGL=1
export QT_QPA_PLATFORMTHEME=qt5ct
