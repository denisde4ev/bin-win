@ECHO OFF
set OLDPWD=%CD%
busybox64.exe  ash -l -c "com=$1;shift;eval "^""$com"^""${1:+' "^""$@"^""'}" -s %*
