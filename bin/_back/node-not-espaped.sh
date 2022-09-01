#!/bin/ash
set -feu
_='' # fix '_: parameter not set'

case ${1:-} in [a-zA-Z]:*)

	case $1 in # p=path:
		?:/*) p=${1#?:/} ;;
		?:\\*) p=${1#?:\\} ;;
		*) exit 3;;
	esac

	# d=disk
	d=${1%%:*}
	# ${1%":$p"}
	[ ${#d} -eq 1 ] || exit 2

	#if (: "${_//'\'/'/'}") 2>&-; then
	#	p=${p//'\'/'/'}
	#else
	#	p=\'$(printf %s "%$p" | sed "s/'/'\\\''/g")\'
	#fi


	#if d2=$(printf %s ${d,,}) 2>&-; then # not supported in sh/ash
	#	d=$d2
	#else
		case $d in [A-Z]) d=$(printf %s "$d" | tr 'A-Z' 'a-z'); esac
	#fi
	shift
	set -- "/mnt/$d/$p" "$@"
esac

#exec $ node "$@"
#printf ">%s<\\n" 
exec wsl -d Artix "node $( #"
	if (: "${_/a/b}") 1>&- 2>&-; then
	 	for i; do
	 		printf "'%s' " "${i//"'"/"'\\''"}"
	 	done
	else
		for i; do
			printf %s\\n "$i" | sed "s/'/'\\''/g; 1s/^/'/; \$s/\$/' \\\\/"
		done 
		# support even plan9 sed
		#echo ' ' # no need, added new line
	fi #"
)
"
