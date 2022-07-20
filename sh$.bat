@echo OFF
set OLDPWD=%CD%
busybox64.exe ash -l "%~dpn0.ash" %*
