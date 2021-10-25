#!/bin/sh

ERR(){
	printf '%s\n' "doasedit: $2" && exit "$1"
}

[ -z "$(type -t doas)" ] && ERR 1 'package `doas` required by `doasedit`...'

FullPath="$(realpath $0)"; File="${FullPath%/*}/doasedit"

[ ! -f "$File" -o ! -r "$File" ] && ERR 1 "can't access $File"

[ ! -d "$HOME/.local/bin" ] && mkdir -p $HOME/.local/bin

cp $File $HOME/.local/bin/

chmod u+x $HOME/.local/bin/doasedit

unset ERR FullPath File
