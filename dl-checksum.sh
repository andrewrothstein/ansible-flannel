#!/usr/bin/env sh
VER=${1:-v0.11.0}
DIR=~/Downloads
MIRROR=https://github.com/coreos/flannel/releases/download

dl () {
    local os=$1
    local arch=$2
    local platform=${os}-${arch}
    local file=flannel-$VER-$platform.tar.gz
    local lfile=$DIR/$file
    local url=$MIRROR/$VER/$file
    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')

}

printf "  %s:\n" $VER
dl linux amd64
dl linux arm
dl linux arm64
dl linux ppc64le
dl windows amd64
