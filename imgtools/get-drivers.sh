#!/bin/env bash

mkdir -p /tmp/RPi4boot/boot/efi/
sudo dnf install -y --downloadonly --release=40 --forcearch=aarch64 --destdir=/tmp/RPi4boot/ uboot-images-armv8 bcm283x-firmware bcm283x-overlays
for rpm in /tmp/RPi4boot/*rpm; do rpm2cpio $rpm | sudo cpio -idv -D /tmp/RPi4boot/; done
sudo mv /tmp/RPi4boot/usr/share/uboot/rpi_arm64/u-boot.bin /app/drivers/u-boot.bin
