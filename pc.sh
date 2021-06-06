#!/bin/bash
set -e
if [ -z "$1" ]; then
    curl $UPASTE_PASTEROOT -s -d @- | jq -r .key | echo "$UPASTE_READROOT_RAW/$(cat -)"
else
    curl $UPASTE_PASTEROOT -s -d @$1 | jq -r .key | echo "$UPASTE_READROOT_RAW/$(cat -)"
fi
