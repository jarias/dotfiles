export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

unamestr=$(uname)
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


