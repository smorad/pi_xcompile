#!/bin/bash
set -x
pushd aarch64
sudo umount -fl /proc 
sudo umount -fl /sys 
sudo umount -fl /dev 
popd
