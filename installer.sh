#!/usr/bin/env bash

trap 'sync' EXIT

readonly progrm=${0##*/}

eprintf() { printf "$@" 1>&2; }

panic() {
	eprintf '%s\n' "$progrm: $2"
	(( $1 )) && exit $1
}

(( $# )) && panic 1 "needn't argument...'"

if ! type -P doas &>/dev/null; then
	panic 1 'dependency, `doas`, not met...'
fi

readonly file=${0%/*}/src/doasedit

[[ -f $file && -r $file ]] || panic 1 "$file: not found..."

if ((UID)); then
	readonly dir=$HOME/.local/bin perm=700
else
	readonly dir=/usr/local/bin perm=755
if

if [[ ! -d $dir ]]; then
	mkdir -p -- "$dir" || panic 1 "$dir: failed to create..."
fi

cp -a -- "$file" "$dir" || panic 1 'failed to copy to destination...'

chmod -- $perm "$dir"/doasedit || panic 1 'falied to change permissions...'
