#!/bin/bash

## EXPORTED IN entry.sh
#TO=
#LOGDIR=
#LOGFILE=

## SET IN ENVIRONMENT VARIABLES
#MERCURIAL_URL=
#MERCURIAL_SOURCE=

is_empty() {
    [[ -z $(ls -A "$1" 2>/dev/null) ]]
}

set -eu
[[ $DEBUG = true ]] && set -x

MERCURIAL_SOURCE="${MERCURIAL_SOURCE:-default}"

is_empty "$TO" && hg clone -v --noupdate "$MERCURIAL_URL" "$TO"

cd "$TO" || exit 1
hg pull -v "$MERCURIAL_SOURCE"

