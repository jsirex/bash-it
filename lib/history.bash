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

export AUTOFEATURE=true autotest

function rh {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}
