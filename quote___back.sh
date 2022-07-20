#!/bin/ash
# sh + replace

printf "'%s' " "${@//'/\'\\\'\'}"
echo
