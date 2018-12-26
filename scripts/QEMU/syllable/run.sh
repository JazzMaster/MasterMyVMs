#!/bin/sh

qemu-system-x86_64 \
-M pc,accel=kvm \
-soundhw hda \
-m 512 \
-hda syllable.qcow2 \
-cdrom syllable.iso
