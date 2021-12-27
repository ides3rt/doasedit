#!/usr/bin/env bash

trap 'sync' EXIT

Err() {
	printf '%s\n' "Err: $2" 1>&2
	(( $1 > 0 )) && exit $1
}

type -P doas &>/dev/null ||
	Err 1 'package doas(1) required by doasedit()...'

File=$(realpath "$0") File="${File%/*}"/src/doasedit

[[ -f $File || -r $File ]] || Err 1 "can't access '$File'"

if ((UID)); then
	Dir="$HOME"/.local/bin
	[[ -d "$Dir" ]] || mkdir -p "$Dir"
	cp "$File" "$Dir"/
	chmod 700 "$Dir"/doasedit
else
	Dir=/usr/local/bin
	cp "$File" "$Dir"/
	chmod 755 "$Dir"/doasedit
if

printf '%s\n' "Installed. Now add '$Dir' to \$PATH..."
