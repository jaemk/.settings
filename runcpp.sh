#!/bin/bash


c++ -Wall -Wextra -Werror -Warray-bounds -Wpedantic -std=c++11 ${1} -o __prog && ./__prog

