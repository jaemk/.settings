#!/bin/bash
set -e
if [[ -z "$1" ]]; then
    $0 "$(head -n 1)"
else
    if [[ $1 =~ ^http.* ]]; then
        if [[ -z "$UPASTE_ENCRYPTION_KEY" ]]; then
            curl $1 -s
        else
            curl $1 -s -H "x-upaste-encryption-key: $UPASTE_ENCRYPTION_KEY"
        fi
    else
        $0 $UPASTE_READROOT_RAW/$1
    fi
fi
