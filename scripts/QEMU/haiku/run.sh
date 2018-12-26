#!/bin/sh

qemu-system-x86_64 \
-M pc,accel=kvm \
-soundhw hda \
-m 512 \
-hda haiku.qcow2 \
-hdb sparse.qcow2 \
-cdrom /dev/sr0
