#!/bin/sh
set -eu

unset i
case $@ in
	''|--sid) i=s;;
	-n|--name|-un|-nu|"-u -n"|"-n -u") i=n;;
	--help) printf %s\\n "usage: id-u [--sid] " "       id-u <-n | --name>"; exit 0;;
	*) exit 5
esac

####while getopts ugGnr


whoami.exe /USER /FO TABLE /NH | {
	read -r n s
	if read j; then
		printf %s\\n >&2 \
			"wrong output from whoami.exe, expected 1 line with /[^ ]+ [^ ]+/, but got got:" \
			"$n $s" \
			"$j" \
			"$(cat)" \
		;
		exit 7
	fi
	case $i in
		s) printf %s\\n "$s";;
		n) printf %s\\n "$n";;
		*) exit 5;;
	esac
}





# whoami.exe /user /fo csv | (
#	read -r header
#	str_sid=${header#*,}
#	case $str_sid in '"SID"'|SID) ;; *) exit 2; esac
