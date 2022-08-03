#!/bin/sh
set -ue
set -x

_explorer(){
	cmd /c "explorer.exe $*" || \
	case $? in 1) true;; esac # # explorer aways exits with 1 ..
}

slep(){
	echo Waiting 3 seconds before exit >&2
	sleep 3
}

 
# printf "\$0=$0"
# arg "$@"



main() {
	case $# in
		0)
		echo 0
			case $PWD in
				"${SYSTEMDRIVE:-C:}"[/\\]Windows[/\\]system32|"${0%["${PATHSEP:?}"]*}")
					cd ~
				;;
				"$HOME")
					set -- "$(cout)"
					case $1 in \"*\") set -- "${1#\"}"; set -- "${1%\"}" ; esac
					file="${1##*["${PATHSEP:?}"]}"
					cd "${1%["${PATHSEP:?}"]*}"
					_explorer /select,"$file"
					exit
				;;
				*) cd ..;;
			esac
			_explorer .
		;;
		1)
			echo 1
			case $1 in "${SYSTEMDRIVE:-C:}"'\Users\pc57\usr\bin\cd__.sh') main; return ; esac

			echo cd -- "${1%["${PATHSEP:?}"]*}"
			cd -- "${1%["${PATHSEP:?}"]*}"
			file="${1##*["${PATHSEP:?}"]}"
			if [ -e "$file" ]; then
				_explorer /select,"$file"
			else
				_explorer .
			fi
			;;
		*) echo "Usage: __ [path]  goes to upper dir" >&2; slep; exit 1;;
	esac
}
main "$@"
slep
# $ pause

