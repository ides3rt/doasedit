#!/usr/bin/env bash

trap 'sync' EXIT

Program="${0##*/}"

Err() {
	printf '%s\n' "$Program: $2" 1>&2
	(( $1 > 0 )) && exit $1
}

(( $# > 0 )) && Err 2 "needn't argument...'"

if ! type -P doas &>/dev/null; then
	Err 1 'dependency, `doas`, not met...'
fi

File="${0%/*}"/src/doasedit

[[ -f $File || -r $File ]] || Err 1 "can't access '$File'..."

if ((UID)); then
	Dir="$HOME"/.local/bin
	Perms=700
else
	Dir=/usr/local/bin
	Perms=755
if

[[ -d $Dir ]] || mkdir -p "$Dir"
cp -- "$File" "$Dir"
chmod "$Perms" "$Dir"/doasedit

printf '%s\n' "Installed. Now, add '$Dir' to \$PATH..."
