
echo not tested >&2
exit 123


	err(){
printf %s\\n "${0##*/}: $1"
	exit "${2:-1}"
}
quote(){ if(:
	: "${_@Q}")2>&-
then set -- "${*@Q}"
	elif(:
: "${_//"'"/"\'\\\'\'"}")2>&-
	then set -- "$(printf "'%s' " "${@//"'"/"\'\\\'\'"}")"
else set -- "$(printf '%s\n' "$@"|sed "s/'/'\\\\''/g; s/^/'/; s/$/'/"|tr '\n' ' ')"
	fi && \
[ $# -eq 1 ] && [ "$1" != '' ] || err "Can not find way to quote arguments for the curent sh interpreter"
	printf %s "$1"
}

case $@ in
-S|--stdin)exec su -c "$(quote "$@")"; exit;;
	-*)err "options are not implemented -- '$1' " 1;;
''|--help)printf %s\\n "Usage: ${0##*/} [-S|--stdin] <command> [...arguments]"
	exit;;
esac

find_tty(){ printf %s '9<&0 8>&1 7>&2 '
	if [ -r /dev/tty ]&&[ -w /dev/tty ]
then printf '0</dev/tty 1>/dev/tty 2>/dev/tty '
	else for i in 0 2 3 4 5 6 7 8 9
do [ -t "$i" ]||continue
	printf '%s' "0<&$i 1>&$i 2>&$i "
break
done
[ -t 0 ]||printf "err 'can not find input file descriptor from terminal to read password'
#"
fi
}
echo eval "$(find_tty)"' exec su -c "0<&9 1>&8 2>&1  exec $(quote "$@")"'
