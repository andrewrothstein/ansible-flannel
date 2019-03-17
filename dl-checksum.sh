#!/usr/bin/env sh
VER=v0.11.0
DIR=~/Downloads
MIRROR=https://github.com/coreos/flannel/releases/download
for PLATFORM in linux-amd64 linux-arm linux-arm64 linux-ppc64le windows-amd64
do
    DIST=flannel-$VER-$PLATFORM.tar.gz
    wget -O $DIR/$DIST $MIRROR/$VER/$DIST
done
sha256sum $DIR/flannel-$VER-*.tar.gz
#shasum -a 256 $DIR/flannel-*-$VER
