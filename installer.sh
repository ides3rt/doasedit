#!/bin/sh

[ ! -f '/usr/bin/doas' ] && echo 'doasedit: Package `doas` required by `doasedit`...' && exit 1

[ ! -f 'doasedit/doasedit' ] && echo 'doasedit: Please be in the same directory as `doasedit`...' && exit 1

[ ! -d "$HOME/.local/bin" ] && mkdir -p $HOME/.local/bin

cp doasedit/doasedit $HOME/.local/bin/

chmod u+x $HOME/.local/bin/doasedit

echo 'doasedit: Done...'
