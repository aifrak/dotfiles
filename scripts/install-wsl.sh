#!/usr/bin/env bash

sh -c "$(curl -fsLS https://get.chezmoi.io)"

source "$(dirname "$0")/scripts/install-common-debian.sh"
source "$(dirname "$0")/scripts/install-common-unix.sh"
