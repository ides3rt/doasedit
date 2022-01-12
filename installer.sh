#!/usr/bin/env bash

trap 'sync' EXIT

Program="${0##*/}"

Err() {
	printf '%s\n' "$Program: $2" 1>&2
	(( $1 > 0 )) && exit $1
}

(( $# > 0 )) && Err 1 "don't accept arguments..."

type -P doas &>/dev/null ||
	Err 1 'package doas(1) required by doasedit(1)...'

File="${0%/*}"/src/doasedit

[[ -f $File || -r $File ]] || Err 1 "can't access '$File'..."

if ((UID)); then
	Dir="$HOME"/.local/bin
	Perms=700
else
	Dir=/usr/local/bin
	Perms=755
if

[[ -d "$Dir" ]] || mkdir -p "$Dir"
cp "$File" "$Dir"/
chmod "$Perms" "$Dir"/doasedit

printf '%s\n' "Installed. Now add '$Dir' to \$PATH..."
