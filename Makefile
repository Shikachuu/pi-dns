gen-ignition:
	@echo "Generating Ignition Configs"
	@podman run --interactive --rm quay.io/coreos/butane:release \
       --pretty --strict < pi.butane > pi.ign

get-pi-firmware:
	@echo "Getting Raspberry Pi Firmware"
	/bin/env bash imgtools/get-firmware.sh

install-sd:
	@/bin/env bash imgtools/sd-writer.sh
	sudo /bin/env bash imgtools/copy-firmware.sh
