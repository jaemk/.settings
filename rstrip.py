#!/usr/bin/env python

import sys


def write(s):
    if s is not None:
        sys.stdout.write(s)


def main():
    prev = None
    for line in sys.stdin:
        write(prev)
        prev = line
    write(prev.rstrip())


if __name__ == '__main__':
    main()
