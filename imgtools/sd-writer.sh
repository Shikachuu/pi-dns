#!/bin/env bash

set -ouex pipefail

read -p "Enter the device to install to: " device;
echo "Installing to $device"
sudo podman run --pull=always --privileged --rm \
    -v /dev:/dev -v /run/udev:/run/udev -v .:/data -w /data \
    quay.io/coreos/coreos-installer:release \
    install "$device" -i pi.ign
