#!/bin/bash

#screws with output     -prom-env 'vga-ndrv?=true' \

qemu-system-ppc -L pc-bios \
    -cpu G3 \
    -boot c \
    -M mac99 \
    -m 512 \
    -prom-env 'auto-boot?=true' \
    -usb \
    -device usb-kbd \
    -device usb-mouse \
    -drive file=MacOS922.img,format=raw \
    -vga std \
    -netdev user,id=network01 \
    -device sungem,netdev=network01
 #-cdrom /home/jazz/mac-cdroms/MacOS922.iso \
