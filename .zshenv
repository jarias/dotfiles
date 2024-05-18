export EDITOR="vim"

export ANDROID_HOME=$HOME/Android/sdk

export PATH="$PATH:$HOME/.poetry/bin:$HOME/.local/bin"
export PATH="$PATH:/home/jarias/.local/share/JetBrains/Toolbox/scripts"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.dotnet:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP="${XDG_SESSION_DESKTOP:-sway}"
export XDG_SESSION_TYPE=wayland

export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM="wayland;xcb"
export _JAVA_AWT_WM_NONREPARENTING=1
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export OBS_USE_EGL=1
export QT_QPA_PLATFORMTHEME=qt5ct
