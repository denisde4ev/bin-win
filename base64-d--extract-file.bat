busybox sh -xc "set -f; IFS=''; case $1 in *.base64) base64 -d -- $1 > ${1%%.base64}    ; exit; esac; exit 2" -s %* || pause
