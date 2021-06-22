#!/bin/bash
set -e

if [[ -z "$UPASTE_TTL_SECONDS" ]]; then
    ttl=
else
    ttl="ttl_seconds=$UPASTE_TTL_SECONDS"
fi

function post() {
    infile="@-"
    if [[ ! -z "$1" ]]; then
        infile="@$1"
    fi

    if [[ -z "$UPASTE_ENCRYPTION_KEY" ]]; then
        curl $UPASTE_PASTEROOT?$ttl -s --data-binary $infile
    else
        curl $UPASTE_PASTEROOT?$ttl -s --data-binary $infile -H "x-upaste-encryption-key: $UPASTE_ENCRYPTION_KEY"
    fi
}

if [ -z "$1" ]; then
    post | jq -r .key | echo "$UPASTE_READROOT_RAW/$(cat -)"
else
    post $1 | jq -r .key | echo "$UPASTE_READROOT_RAW/$(cat -)"
fi
