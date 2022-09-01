@echo off
whoami.exe /groups /fo csv | grep -q ^""S-1-16-12288"^"
exit /b %errorlevel%


:: busybox ash -c "case $(id -u) in 0) ;; *) exit 1;; esac"



rem net session >nul 2>&1

rem fltmc 
rem fsutil dirty query %systemdrive% >nul



:: errorlevel 