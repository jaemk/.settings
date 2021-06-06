#!/bin/bash
set -e
if [[ -z "$1" ]]; then
    $0 "$(head -n 1)"
else
    if [[ $1 =~ ^http.* ]]; then
        curl $1 -s
    else
        $0 $UPASTE_READROOT_RAW/$1
    fi
fi
