#!/bin/sh

nl='
'
[ "$1" = -n ] && { nl=''; shift; }
# new line , -n -> no new line , simular to echo -n 

printf 'Lorem '
dd if=/dev/urandom count="${1:-9}" 2>/dev/null | tr -dc "$nl"'A-Za-z@#$%0-9,.!? -' | {
	sed -Ee '
		s/[@#]/ /g;
		s/([A-Za-z123])[A-Z ]+/\1/g;

		s/-* /-/g;
		s/-([^A-Za-z])|([^A-Za-z])-/\1\2/g;

		s/ *([,.!?])/\1 /g;
		s/ [,.!? -]* */ /g;

		s/^[,.!? -]*|[ -]*$//g;
		s/[ -]*$//g;
	'
}
echo
