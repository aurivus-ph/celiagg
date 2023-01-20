#!/bin/bash
set -e -x

curl -L "https://downloads.sourceforge.net/project/libpng/libpng16/1.6.37/libpng-1.6.37.tar.gz" -o libpng-1.6.37.tar.gz
tar zxf libpng-1.6.37.tar.gz
pushd libpng-1.6.37
./configure
make -j $(nproc)
make install
popd

curl -L "https://download.savannah.gnu.org/releases/freetype/freetype-2.12.1.tar.gz" -o freetype-2.12.1.tar.gz
tar zxf freetype-2.12.1.tar.gz
pushd freetype-2.12.1
./configure
make -j $(nproc)
make install
popd

curl -L "https://github.com/harfbuzz/harfbuzz/archive/refs/tags/2.6.8.tar.gz" -o harfbuzz-2.6.8.tar.gz
tar zxf harfbuzz-2.6.8.tar.gz
pushd harfbuzz-2.6.8

# missing macro in the locally installed automake
cp /usr/share/aclocal/pkg.m4 /usr/local/share/aclocal

./autogen.sh
./configure
make -j $(nproc)
make install
popd
