#!/usr/bin/env bash

trap 'sync' EXIT

progrm=${0##*/}

panic() {
	printf '%s\n' "$progrm: $2" 1>&2
	(( $1 > 0 )) && exit $1
}

(( $# > 0 )) && panic 1 "needn't argument...'"

if ! type -P doas &>/dev/null; then
	panic 1 'dependency, `doas`, not met...'
fi

file=${0%/*}/src/doasedit

[[ -f $file || -r $file ]] || panic 1 "$file: not found..."

if ((UID)); then
	dir=$HOME/.local/bin
	perm=700
else
	dir=/usr/local/bin
	perm=755
if

if [[ ! -d $dir ]]; then
	mkdir -p "$dir" || panic 1 "$dir: failed to create..."
fi

cp -- "$file" "$dir" || panic 1 'failed to copy to destination...'

chmod -- "$perm" "$dir"/doasedit || panic 1 'falied to change permissions...'
