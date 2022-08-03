@ECHO OFF
set OLDPWD=%CD%
busybox64.exe  ash -l -c "eval "^""$@"^""" -s %*

:: with no quotes parsing
:: used ony otside unix shells, e.g. Windows search, (IDK but maybe Windows cmd)
:: $$ cant by typed in linux shell without escaping
