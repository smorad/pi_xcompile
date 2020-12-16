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
# Pytorch specific stuff
git clone https://github.com/pytorch/pytorch
pushd pytorch
git checkout origin/1.7
git submodule update --init --recursive
popd
popd
