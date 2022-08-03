#!/bin/ash
set -eu

#set -x

o=${0##*["${PATHSEP:-/}"]}
o=${o%.sh} # on windows
case $o in
	Z*) end_ln='\0';;
	*) end_ln='\n';;
esac

case $@ in
	*%*) ;;
	*) set -- "$@" %;;
esac

IFS=''

unset _arg
while case $# in 0) false; esac; do
	i="'${1//\'/\'\\\'\'}'"
	case $1 in
		*%*) i=${i//"%"/"'\"\$i\"'"}
	esac
	_arg="${_arg-} $i"
	shift
done

new_line='
'

case $o in
	Ztest-|test-) while read -r i; do
		eval "test $_arg" && printf "%s${end_ln}" "$i"
		# test "${@//%/1}" && printf "%s${end_ln}" "$i"
	done ;;
	Zdirname-|dirname-|Zbasename-|basename-)
		com=${o%-}
		com=${com#Z}
		case $end_ln in
			'\n')
				while read -r i; do
					eval '"$com" '"$_arg"
				done ;;
			'\0')

				while read -r i; do
					# keep when 2 new line, almost all shells will trim all new_line at end
					i=$(eval '"$com" '"$_arg" && printf %s x) && \
					printf %s\\0 "${i%"${new_line}x"}"
				done
		esac
	;;
	*) echo 'cant parse $0 to action, anvalibel are: /Z?(test|dirname|basename)-?/ -> Ztest-, test-, Zdirname-, dirname-, Zbasename-, basename-'; exit 126;;
esac
