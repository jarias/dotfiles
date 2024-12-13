#!/bin/bash

set -e

/usr/bin/pass git pull --rebase
/usr/bin/pass git push
