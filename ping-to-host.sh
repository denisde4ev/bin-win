
##nslookup "$@" | sed -ne 's/^Address: *//p'
\ping -n 1 "$@" | sed -nEe 's/Ping statistics for ([^:]*):*/\1/gp'
