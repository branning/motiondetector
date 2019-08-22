#!/usr/bin/env bash
#
# Install OpenCV if it's missing

set -o errexit

quiet(){ "$@" >/dev/null 2>&1; }

info(){ echo "OpenCV install: $*"; }

here=$(cd $(dirname $BASH_SOURCE[0]); echo $PWD)

case $OSTYPE in
  darwin*)
    info "installing latest OpenCV"
    brew install "opencv"
    info "complete!"
    ;;
  linux*)
    $here/opencv_dependencies.sh

    info "cloning OpenCV sources"
    git clone https://github.com/opencv/opencv.git
    git clone https://github.com/opencv/opencv_contrib.git

    info "building OpenCV with CMake"
    cd opencv
    mkdir build
    cd build
    cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..

    info "complete!"
    ;;
  win*)
    info "whoops don't know how to install OpenCV on windows yet"
    ;;
esac

