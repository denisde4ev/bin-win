#!/bin/ash
# SH wrapper FOR Windows Recycle.exe
# SH +(replace sh extension) -> target shells ash/yash/bash/zsh

# todo: rmtrash-restore-Recycle-exe-wrapper.sh using `RECYCLE /U "C:\temp\junk.txt"`


#local IFS=' '
IFS=' '; set -f
case ${@:-} in --help) echo todo: help message; exit; esac

#local new_args
while :; do
	case $1 in
		--) shift; break;;
		-i|-vi|-iv) new_args="$new_args /P";; # P is for "Prompt"
		-v) ;; # win is verbose by default
		[/-][A-Za-z0-9_]) new_args="$new_args $1";;
		# note if HOMEDRIVE is not leter but '/[a-z]' then will get to infinite loop :
		/[!"${PATHSEP:-/}"]*) i=${HOMEDRIVE:-"C:"}\\$1; shift; set -- "$1" "$@"; continue;;
		[/-]*) echo err arg: "'$1'" >&2; exit 2;;
		*) break;;
	esac
	shift || exit 22
done

case $# in 0) "Recycle.exe" $new_args; exit; esac

for i; do
	i=${i%["${PATHSEP:-/}"]}

	if
			case ${new_args:+$i} in # test if is relative path
				'') false;;
				[A-Z]:*) false;;
				.["${PATHSEP:-/}"]*) true;;
				["${PATHSEP:-/}"]*) false;;
				*) true;;
			esac
	then
		i=${i#.["${PATHSEP:-/}"]}
		"Recycle.exe" $new_args "${PWD//\//\\}\\${i//\//\\}"
	else
		"Recycle.exe" $new_args "${i//\//\\}"
	fi
	# || {
	# 	printf %s\\n "exit code: $?" >&2
	# }

done
