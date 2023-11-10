#!/bin/bash

BASE_PATH=$1

/usr/bin/tarsnap -c \
	--keyfile "${BASE_PATH}/.tarsnap.key" \
	--cachedir "${BASE_PATH}/.cache/tarsnap" \
	-f "$(uname -n)-$(date +%Y-%m-%d_%H-%M-%S)" \
	"${BASE_PATH}/Documents" \
	"${BASE_PATH}/Pictures" \
	"${BASE_PATH}/.password-store"
