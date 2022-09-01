#!/bin/sh

cd "${PREFIX:?}/etc" || exit

PATH="${HOMEDRIVE:-"C:"}/ProgramData/chocolatey/lib/tor/tools/Tor${PATHSEP:-":"}$PATH" \
exec tor.exe
