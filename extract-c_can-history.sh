#!/bin/bash
# see also: http://stackoverflow.com/questions/5998987/splitting-a-set-of-files-within-a-git-repo-into-their-own-repository-preserving

#ls drivers/net/can/c_can/
#c_can.c  c_can.h  c_can_pci.c  c_can_platform.c  Kconfig  Makefile

git filter-branch \
    --prune-empty \
    --index-filter '
        git ls-tree -z -r --name-only --full-tree $GIT_COMMIT \
        | grep -z -v "^drivers/net/can/c_can/c_can.c$" \
        | grep -z -v "^drivers/net/can/c_can/c_can_pci.c$" \
        | grep -z -v "^drivers/net/can/c_can/c_can.h$" \
        | grep -z -v "^drivers/net/can/c_can/c_can_platform.c$" \
        | grep -z -v "^drivers/net/can/c_can/Kconfig$" \
        | grep -z -v "^drivers/net/can/c_can/Makfile$" \
        | xargs -0 -r git rm --cached -r
    ' \
    -- \
    --all


