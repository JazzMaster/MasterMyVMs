#!/bin/sh

qemu-system-x86_64 \
-M pc,accel=kvm \
-soundhw hda \
-m 512 \
-hda reactor.qcow2 \
-boot c \
-usb -device usb-tablet \
-cdrom react.iso
# -net nic,model=rtl8139 -net user \        
