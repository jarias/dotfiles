export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec uwsm start -- sway.desktop
fi
