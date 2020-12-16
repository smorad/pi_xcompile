# Overview
This repo contains instructions on how to crosscompile any program for arm64/armhf/whatever else. It uses `chroot` and `qemu-user` to create really fast user-space builds compared with `qemu` emulators. These scripts made for debian derivatives such as ubuntu, although the produced `rootfs chroot` should work anywhere. For fedora derivatives like manjaro, see https://nmilosev.svbtle.com/compling-arm-stuff-without-an-arm-board-build-pytorch-for-the-raspberry-pi.

# Requirements
`sudo apt install qemu-user-static qemu-system-arm virt-manager multistrap`

# How to use
```
git clone https://gitlab.developers.cam.ac.uk/cst/prorok-lab/pi-crosscompile
cd pi-crosscompile
mkdir aarch64
sudo ./prepare_chroot
# Get some coffee while everything downloads and installs
sudo chroot aarch64 # Get a shell
```
For `armhf` builds, change the `arch` field in `aarch64.conf`
