#!/usr/bin/env bash
##
##  Debugging script to run OS images supplied with Alpine Term.
##

USE_KVM=true
PRIMARY_CDROM="${PWD}/alpine-linux-cdrom.iso"
PRIMARY_HDD="${PWD}/alpine-linux-hdd.qcow2"
#PRIMARY_HDD="nbd://192.168.43.1:10050/hd0"
SNAPSHOT_MODE=true

set -e -u

set -- "-name" "Alpine Term"

if [ "${USE_KVM}" = "true" ]; then
	# KVM makes things run faster.
	set -- "${@}" "-enable-kvm"
else
	set -- "${@}" "-cpu" "max"
	set -- "${@}" "-tb-size" "256"
fi

# Set RAM size to 1 GB.
set -- "${@}" "-m" "1024M"

# Do not create default devices.
set -- "${@}" "-nodefaults"

# Setup drives.
set -- "${@}" "-drive" "file=${PRIMARY_CDROM},if=none,media=cdrom,index=0,id=cd0"
set -- "${@}" "-drive" "file=${PRIMARY_HDD},if=none,discard=unmap,detect-zeroes=unmap,cache=writeback,id=hd0"
set -- "${@}" "-device" "virtio-scsi-pci,id=virtio-scsi-pci0"
set -- "${@}" "-device" "scsi-cd,bus=virtio-scsi-pci0.0,id=scsi-cd0,drive=cd0"
set -- "${@}" "-device" "scsi-hd,bus=virtio-scsi-pci0.0,id=scsi-hd0,drive=hd0"

if [ "${SNAPSHOT_MODE}" = "true" ]; then
	# In snapshot mode no writes to the original image is being done.
	set -- "${@}" "-snapshot"
fi

# Allow to select boot device.
set -- "${@}" "-boot" "c,menu=on"

# Use virtio RNG. Provides a faster RNG for the guest OS.
set -- "${@}" "-object" "rng-random,filename=/dev/urandom,id=rng0"
set -- "${@}" "-device" "virtio-rng-pci,rng=rng0,id=virtio-rng-pci0"

# Setup networking.
set -- "${@}" "-netdev" "user,id=vmnic0"
set -- "${@}" "-device" "virtio-net-pci,netdev=vmnic0,id=virtio-net-pci0"

# Host storage access.
set -- "${@}" "-fsdev" "local,security_model=none,id=fsdev0,path=${HOME}"
set -- "${@}" "-device" "virtio-9p-pci,fsdev=fsdev0,mount_tag=shared_storage,id=virtio-9p-pci0"

# We need only monitor & serial consoles.
set -- "${@}" "-nographic"

# Setup VGA with no display.
set -- "${@}" "-device" "VGA,id=vga-pci0,vgamem_mb=32" "-vnc" "none"

# Use usb tablet as pointer device as PS/2 mouse has issues with VNC.
set -- "${@}" "-device" "qemu-xhci,id=qemu-xhci-pci0"
set -- "${@}" "-device" "usb-tablet,bus=qemu-xhci-pci0.0,id=usb-tablet0"

# Explicitly specify that only EN-US keyboard supported.
# This option is used by VNC.
set -- "${@}" "-k" "en-us"

# Disable parallel port.
set -- "${@}" "-parallel" "none"

# Monitor.
set -- "${@}" "-chardev" "tty,id=console0,mux=on,path=$(tty)"
set -- "${@}" "-serial" "chardev:console0"
set -- "${@}" "-monitor" "chardev:console0"

qemu-system-x86_64 "$@" || true
stty sane
