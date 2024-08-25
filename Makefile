gen-ignition:
	@echo "Generating Ignition Configs"
	@podman run --interactive --rm quay.io/coreos/butane:release \
       --pretty --strict < pi.butane > pi.ign

get-pi-dirvers:
	@echo "Getting Raspberry Pi drivers"
	@podman run --interactive --rm -v $(shell pwd):/app -w /app registry.fedoraproject.org/fedora:40 \
		sh -c 'dnf install -y make rpm cpio && ls && bash imgtools/get-drivers.sh'

install-sd:
	@/bin/env bash imgtools/sd-writer.sh
	sudo /bin/env bash imgtools/copy-drivers.sh
