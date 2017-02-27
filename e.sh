#!/bin/sh
if [ -z "$1" ]
then
    TMP="$(mktemp /tmp/stdin-XXX)"
    cat >$TMP
    emacsclient -n $TMP
    rm $TMP
elif [ "$1" = "-w" ]
then
    emacsclient "${@:2}"
else
    emacsclient -n "$@"
fi
