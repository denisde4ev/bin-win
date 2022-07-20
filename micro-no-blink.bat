@echo off
busybox printf "\x1b[?12l"
micro.exe %*
exit
rem disable cursor blinking - https://docs.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences#cursor-visibility
