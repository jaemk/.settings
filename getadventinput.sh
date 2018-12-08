#!/bin/bash

set -ex

function usage_exit {
    echo "Usage:"
    echo "  $0 <day-number> <out-file>"
    exit 1
}

if [[ -z "$1" || -z "$2" ]]; then
    usage_exit
fi


cookie=""
day_n="$1"
out_file="$2"
curl -H "Cookie: session=$cookie" https://adventofcode.com/2018/day/"$day_n"/input -o "$out_file"
