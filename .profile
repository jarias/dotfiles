#!/bin/bash
export _JAVA_AWT_WM_NONREPARENTING=1
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export OBS_USE_EGL=1
export QT_QPA_PLATFORMTHEME=qt5ct
. "$HOME/.cargo/env"
