#!/bin/ash

case $1 in *%*) ;; *)
	set -- "% $1"
esac

IFS=''
while read -r i; do
	printf %s\\n "${1//"%"/"$i"}"
done
