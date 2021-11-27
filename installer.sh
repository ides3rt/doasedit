#!/usr/bin/env bash

ERR() {
	printf '%s\n' "ERR: $2" 1>&2
	exit $1
}

type -P doas &>/dev/null ||
	ERR 1 'package doas(1) required by doasedit()...'

File=$(realpath $0)

File="${File%/*}/src/doasedit"

[[ -f "$File" || -r "$File" ]] || ERR 1 "can't access $File"

if ((UID == 0)); then
	Dir=/usr/local/bin
	doas cp $File $Dir/
	chmod 755 $Dir/doasedit
else
	Dir="$HOME/.local/bin"
	[[ -d "$Dir" ]] || mkdir -p $Dir
	cp $File $Dir/
	chmod 700 $Dir/doasedit
if

printf '%s\n' "Installed. Now add \`$Dir\` to your PATH..."
