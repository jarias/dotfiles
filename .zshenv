export EDITOR="nvim"
export ANDROID_HOME=$HOME/Android/sdk

export PATH="$PATH:$HOME/.poetry/bin:$HOME/.local/bin"
export PATH="$PATH:/home/jarias/.local/share/JetBrains/Toolbox/scripts"
export PATH="$(gem env user_gemhome)/bin:$PATH"
export PATH="$HOME/.dotnet:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$PATH:${ANDROID_HOME}/emulator"
export PATH="$PATH:${ANDROID_HOME}/platform-tools"
export PATH="$PATH:${HOME}/.cargo/bin"
export PATH="$PATH:${HOME}/go/bin"

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP="${XDG_SESSION_DESKTOP:-sway}"
export XDG_SESSION_TYPE=wayland

export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM="wayland;xcb"
export _JAVA_AWT_WM_NONREPARENTING=1
export OBS_USE_EGL=1
export QT_QPA_PLATFORMTHEME=qt5ct
