#!/bin/bash

qemu-system-x86_64 \
-machine pc,accel=kvm \
-cpu core2duo,kvm=off,vendor=GenuineIntel \
-smp 2 \
-m 4096 \
-boot d \
-drive if=pflash,format=raw,readonly,file=OVMF_CODE.fd \
-drive if=pflash,format=raw,file=OVMF_VARS.fd \
-usb \
-device usb-host,vendorid=0x46d,productid=0xc52b \
-device vfio-pci,host=01:00.0,multifunction=on \
-device vfio-pci,host=01:00.1,multifunction=on \
-drive media=disk,format=qcow2,file=ATE.qcow2 \
-drive format=raw,readonly,media=cdrom,file=installers.iso \
-cdrom /dev/sr0 \
-parallel none \
-serial none \
-display gtk \
-vga none \
-monitor none \
-no-reboot \
     
# samba has to be running to share the home folder(with auth for rw support)      
#      -smb $HOME 

