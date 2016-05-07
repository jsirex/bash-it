#!/usr/bin/env bash

# append to bash_history if Terminal.app quits
shopt -s histappend

# history handling
#
# Erase duplicates
# Bash History
export HISTCONTROL="erasedups"

# resize history size
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash_internal_history

shopt -s histappend              # append to bash_history if Terminal.app quits
export AUTOFEATURE=${AUTOFEATURE:-true autotest} # Cucumber / Autotest integration

function rh {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}
