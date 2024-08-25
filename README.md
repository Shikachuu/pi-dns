# Raspberry Pi 4 DNS Server

# Purpose

This project is a simple DNS server for the Raspberry Pi 4. It is based on the Universal Blue Project and uses ucore-minimal as the base image.
The DNS server is based on AdGuard Home and is configured to use LibreDNS as it's primary resolver with Quad-9 fallback. (both provider uses DOH and DOT)

# Prerequisites

- Raspberry Pi 4
- uboot bootloader for Raspberry Pi 4
- fedora coreos image for Raspberry Pi 4
- use the provided butane file to configure the fedora coreos image to rebase to this repository

# How to Use

## Installation

1. Generate the ignition file using the provided butane file
2. Flash the fedora coreos image to the SD card
3. Boot the Raspberry Pi 4 with the SD card
4. The Raspberry Pi 4 will automatically rebase to this repository and install the DNS server

## Containerfile

This file defines the operations used to customize the selected image.

- add a k8s deployment file to the /etc/adguardhome folder, contains the deployment for the DNS server and the config as a configmap
- add a systemd service file to the /etc/containers/systemd/ folder for podman to run the container as a systemd service

## Workflows

### build.yml

This workflow creates your custom OCI image and publishes it to the Github Container Registry (GHCR).
By default, the image name will match the Github repository name.
