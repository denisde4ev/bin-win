#!/bin/ash
set -eu

case $# in 0) printf %s\\n "use --hepl for usage" >&2; exit 2; esac
case $1 in --help) printf %s\\n "Usage: ${0##*/} [...mvargs] <file name>" " move 'file name' to 'file-name'"; exit; esac

unset i
case ${OS:-$(uname)} in
	*Windows*) . /^/https%3A//github.com/denisde4ev/shrc/raw/master/__sourceable/pop_to_i.sh ;;
	*)         . /^/\ https://github.com/denisde4ev/shrc/raw/master/__sourceable/pop_to_i.sh ;;
esac
base=${i##*["${PATHSEP:-/}"]}
dir_andsep=${i%"$base"} # dir in most causes will be empty


case ${MV_SUPPORTS_OPT_T+T} in T) ;; *) # when does not support
	[ ! -e "$dir_andsep${base// /-}" ] || {
		printf %s\\n >&2 \\
			"target file exists and mv does not support T arg (and cant't detect if --interactive flag used)" \
			"wont move to existing: '$dir_andsep${base// /-}'" \
		;
		exit 3
	}
esac
mv ${MV_SUPPORTS_ARG_T+"-T"} "$@" -- "$i" "$dir_andsep${base// /-}"
