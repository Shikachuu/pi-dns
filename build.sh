#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

systemctl enable podman.socket

# Install adguardhome and copy the configuration file
mkdir -p /etc/adguardhome
cp /tmp/adguard/deployment.yaml /etc/adguardhome/deployment.yaml

cp /tmp/adguard/adguard.kube /etc/containers/systemd/adguard.kube
systemctl enable adguard
