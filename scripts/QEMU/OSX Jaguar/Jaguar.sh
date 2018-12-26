#!/bin/bash

# we want similar to an iMac "Bubble..."
# iMacs are SCSI systems(hacked to ide hdd) by default

qemu-system-ppc -L pc-bios \
    -M mac99 \
    -cpu G3 \
    -boot c \
    -m 512 \
    -prom-env 'auto-boot?=true' \
    -drive file=Jaguar.img,format=raw,media=disk \
    -cdrom disc1.iso \
    -usb \
    -device usb-kbd \
    -device usb-mouse \
    -sdl \
    -vga std \
    -display gtk \
    -monitor stdio \
    -netdev user,id=network01 \
    -device sungem,netdev=network01 \

#   -device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" \

# ppc has sdl video acceleration
# ppc uses openhackWare or  openBIOS
# tbxi is the blessed boot magic file
# does come with FireWire v1

#screws with output     -prom-env 'vga-ndrv?=true' \
