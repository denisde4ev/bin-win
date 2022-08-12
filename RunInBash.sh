#!/bin/sh
set -euf
{
	[ -d '/\.\C:\Windows' ] || ( cd C:/ && [ "$PWD" = 'C:/' ] );
	# BusyBox-w32
##} && { # calling uname for friquently used '@' might be slow
##	case $(OS:-$(uname)) in
##		*[Ww]indows*) true;;
##		*) false;;
##	esac
} || exit 

# TODO unset unneeded vars

# unset _runinbash_o # allow to be exported or sourced
unset _runinbash_bash_args
unset _runinbash_arg1

_runinbash_o=${0##*["{${PATHSEP:-"/"}"]}
_runinbash_o=${_runinbash_o%.sh}



## set -x


case $_runinbash_o in
	C@) # when using C:/.../... paths
		unset iparesd

		##for i; # todo: consider if it is good idea
		##	case $i in *[A-Z]:[/\\]*)
		##		iparesd=''
		##		i=${} # todo
		##	set -- "$@" "$i"

		case ${iparesd+x} in
			x) ;;
			*) cd /;; # when not parse in args 
		esac

		_runinbash_bash_args=""

		# NOTE: by using C@ any files in current dir ./file wont work!
		# the fix woluld be to use "$PWD"/file
		# or C@ eeds to test if from args files exest before starting, but this will miss args such as: --input=./file
	;;
	?*@) # (xi$ ..) -> (bash -xi ..)
		_runinbash_bash_args="-${_runinbash_o%"@"}"
	;;
	@) # (xi$ ..) -> (bash -il)
		_runinbash_bash_args=""
	;;

	@wsl|@bash|RunInBash|*[!a-zA-Z0-9'@%+:,._-']*|@) ;; # not for next match
	# does quoteing in case work in any shell ?
	[a-zA-Z_@]*)
		_runinbash_arg1=$_runinbash_o
	;;
esac



case ${_runinbash_bash_args+x} in
x)
	case $#:${_runinbash_arg1+x} in
		0:*) ;;
		*:) _runinbash_arg1=$1; shift;;
	esac

	case ${_runinbash_arg1+x} in
		x)
			# known bug of 'wsl' command: wsl won't accept '' / "" as argument: "The parameter is incorrect.\nash: wsl: Exec format error"
			exec wsl -e bash ${_runinbash_bash_args-} -c "${_runinbash_arg1} ${1+\"\$@\" #}" bash "$@";;
		*) exec bash.exe ${_runinbash_bash_args-};;
	esac
	;;
*)
	exec wsl -e ${_runinbash_arg1+"$_runinbash_arg1"} "$@" # TODO! dont use ':+' , use '+' unstead , when done unsetting the 
	;;
esac

exit 111
