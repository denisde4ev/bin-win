@ECHO OFF

set NON_INTERACTIVE=1
set ENV=%PREFIX%/etc/profile
busybox64.exe  ash -i -c "com=$1;shift;eval "^""$com"^""${1:+' "^""$@"^""'}" -s %*
