#!/bin/sh
set -eu

###TODO:! this script is not executed before the real EcMenu.exe when running $ EcMenu


#'My-Computer (for Win10 bug)') exec "${SYSTEMROOT:?}/explorer.exe" "/e,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}";;
#'My-Computer (for Win10 bug)'

unset a
case $(
	printf %s\\n \
	'Lock User' 'Switch User' 'Log Off' 'Sleep' 'Hibernate' 'Restart' 'Shut Down' 'Shut Down Force' \
	'Turn Off Menu' | fzf --no-sort
) in
	'Lock User') a=UL;;
	'Switch User') a=US;;
	'Log Off') a=L;;
	'Sleep') a=SM;;
	'Hibernate') a=H;;
	'Restart') a=R;;
	'Shut Down') a=S;;
	'Shut Down Force') a=SF;;
	'Turn Off Menu') a=M;;
	*) exit $(( $? ? $? : 11 ));;
esac

exec "$PROGRAMFILES/Easy Context Menu/EcMenu.exe" /Shutdown /"${a?}"
