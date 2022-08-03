#!/bin/sh
# this is from neofetch fn get_local_ip, for detected Windows

local_ip="$(ipconfig | awk -F ': ' '/IPv4 Address/ {printf $2 ", "}')"
local_ip="${local_ip%","*}"
echo "$local_ip"
