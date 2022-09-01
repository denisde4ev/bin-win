#!/bin/sh
printf "\\x1b[?12l"
exec micro.exe "$@"
exit
# disable cursor blinking - https://docs.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences#cursor-visibility
