#!/usr/bin/env bash

set -e

if [ -z $1 ]; then
    echo "Please specify venv prompt"
    exit 1
fi

if [ -d venv ]; then
    echo "wiping old venv..."
    rm -rf venv
fi

echo "building new venv..."
if [ -z $2 ]; then
    pyenv exec python -m virtualenv venv --prompt="($1)"
elif [ $2 = "-p2" ]; then
    python3 -m virtualenv venv -p python2.7 --prompt="($1)"
elif [ $2 = "-p3" ]; then
    python3 -m virtualenv venv --prompt="($1)"
fi
source venv/bin/activate

REQ_FILE="requirements.txt"
if [ -f "requirements.dev.txt" ]; then
    REQ_FILE="requirements.dev.txt"
fi

pip install -r $REQ_FILE
