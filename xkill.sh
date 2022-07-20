#!/bin/sh

if ! pidof XKill.exe >/dev/null; then
	XKill.exe
else
	taskkill /F /IM  XKill.exe
fi
