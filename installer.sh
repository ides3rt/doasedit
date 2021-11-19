#!/usr/bin/env bash

ERR(){
	printf '%s\n' "ERR: $2" && exit "$1"
}

type -P doas &>/dev/null ||
	ERR 1 'package doas() required by doasedit()...'

File=$(realpath $0)

File="${File%/*}/src/doasedit"

[ -f "$File" -o -r "$File" ] || ERR 1 "can't access $File"

Dir="$HOME/.local/bin"

[ -d "$Dir" ] || mkdir -p -- $Dir

cp -- $File $Dir/

chmod u+x -- $Dir/doasedit

printf '%s\n' "Installed. Now add \`$Dir\` to your PATH..."

unset ERR File Dir
