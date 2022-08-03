#!/bin/sh

case ${LS_LONG-} in *[a-zA-Z]*) ;;
	unset LS_LONG
esac

exec ${LS_LONG:-ls -AlhF} "$@"
