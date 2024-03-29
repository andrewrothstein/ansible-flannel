#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/flannel-io/flannel/releases/download

dl() {
    local ver=$1
    local os=$2
    local arch=$3
    local platform="${os}-${arch}"
    local file="flannel-${ver}-${platform}.tar.gz"
    local lfile=$DIR/$file
    # https://github.com/flannel-io/flannel/releases/download/v0.24.3/flannel-v0.24.3-linux-ppc64le.tar.gz
    local url=$MIRROR/$ver/$file
    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')

}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver linux amd64
    dl $ver linux arm
    dl $ver linux arm64
    dl $ver linux riscv64
    dl $ver linux ppc64le
    dl $ver linux s390x
    dl $ver windows amd64

}

dl_ver ${1:-v0.24.3}
