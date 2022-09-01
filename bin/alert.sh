#!/bin/sh
[ $# -le 3 ] && set -- "${1-undefined}" 0 "${2-"${0##*/}"}" "${3:-0}"

case $1 in --help)
	printf %s\\n \
	"Usage:" \
	"  alert [message] [title] [type]" \
	"  alert <message> <idk/\"10\"> <title> [type]" \
	"" \
	"type cound be one of:" \
	"  16 ok" \
	"  17 ok cancel" \
	"  18 Abro Retry Ignor" \
	"  19 Yes No cancel" \
	"  20 Yes No" \
	"  21 Retry cancel" \
	"  22 cancel Try_again Continue" \
	"  Box | box -> 00" \
	"  Error | error -> 16" \
	"  Help | help -> 32" \
	"  Alert | alert -> 48" \
	"" \
	"will exit code 0 when message closed (clicking on yes/no/cancel/cnose is ignered) " \
	\
	;
	exit
esac

#box
case $4 in
	[Bb]ox*)   set "$1" "$2" "$3" 00;;
	[Ee]rror*) set "$1" "$2" "$3" 16;;
	[Hh]elp*)  set "$1" "$2" "$3" 32;;
	[Aa]lert*) set "$1" "$2" "$3" 48;;
esac
#case $3 in
#	*[a-zA-Z_]-[0-9]) set -- "$1" "$2" "$(( $3 + ${3} ))" "$4";;
#esac

exec mshta.exe "javascript:new ActiveXObject( 'WScript.Shell' ).Popup( '$1', '$2', '$3', '$4' );close()"
exit

# 4.5 - 8
