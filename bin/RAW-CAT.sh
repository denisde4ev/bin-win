#!/bin/ash
set -euf
IFS=

while read -r -s -n 1 i; do
	case $i in
		$'\4') return 0;;
		$'\xFC') i=$'\33[C';; # Right
		$'\xFB') i=$'\33[D';; # Left
		$'\xFE') i=$'\33[A';; # Up
		$'\xFD') i=$'\33[B';; # Down

#		$'\xF6') i='' # PgUp
#		$'xF5') i='' # PgDown
		$'\xFA') i=$'\r';; # Home
#		$'xF9') i='' # End
	esac

	printf %s "$i"
done
