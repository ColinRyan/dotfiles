#! /bin/sh
cd git rev-parse --show-toplevel
source "$(git --exec-path)/git-sh-setup"
cd_to_toplevel()
