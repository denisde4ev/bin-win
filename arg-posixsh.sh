#!/bin/sh

[ -t 1 ] && { IFS=''; printf %s "$#:${#*} " >&2; }

# shorter and slowest:
# for i; do
# 	printf %s "$i" | sed -e "s/'/'\\\\''/g" -e  "1s/^/${start_space}'/" -e "\$s/\$/'/"
# 	start_space=' ';
# done

case $@ in
	*"'"*)
		start_space=''
		for i; do
			case $i in
				*"'"*) printf "${start_space}'"; printf %s "$i" | sed "s/'/'\\\\''/g"; printf "'";;
				*) printf %s "${start_space}'$i'";;
			esac
			start_space=' '
		done
	;;
	*)
		case $# in
			0) ;;
			1) printf "'%s'" "$1";;
			*)
				printf "'%s'" "$1"
				shift
				printf " '%s'" "$@"
			;; 
		esac
	;;
esac
echo
