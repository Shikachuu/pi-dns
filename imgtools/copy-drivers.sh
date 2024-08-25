#!/bin/env bash

sudo echo "Thanks!"

FCOSEFIPARTITION=$(lsblk $FCOSDISK -J -oLABEL,PATH  | jq -r '.blockdevices[] | select(.label == "EFI-SYSTEM")'.path)
mkdir /tmp/FCOSEFIpart
sudo mount $FCOSEFIPARTITION /tmp/FCOSEFIpart
sudo rsync -avh --ignore-existing /tmp/RPi4boot/boot/efi/ /tmp/FCOSEFIpart/
sudo umount $FCOSEFIPARTITION
rm -rf /tmp/FCOSEFIpart
