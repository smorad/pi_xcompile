#!/bin/bash
set -x
multistrap -f aarch64.conf
pushd aarch64
# We need /dev/null, etc
sudo mount -t proc /proc proc/
sudo mount --rbind /sys sys/
sudo mount --rbind /dev dev/
# So we have a user
cp /etc/passwd etc/passwd
# Networking
cp /etc/resolv.conf etc/resolv.conf
# Certs for pip3
cp /etc/ssl/certs/ca-certificates.crt etc/ssl/certs/ca-certificates.crt

# Pytorch specific stuff
git clone https://github.com/pytorch/pytorch
pushd pytorch
git checkout origin/1.7
git submodule update --init --recursive
popd

# Ray rllib specific stuff
git clone https://github.com/ray-project/ray.git
ray/ci/travis/install-bazel.sh

popd
