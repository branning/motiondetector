#!/usr/bin/env bash
#
# Run CMake and then use the Makefile

OpenCV_DIR=${OpenCV_DIR:-/home/philip/opencv/build/}

here=$(cd $(dirname $BASH_SOURCE[0]); echo $PWD)

cmake $here/..
make ..
