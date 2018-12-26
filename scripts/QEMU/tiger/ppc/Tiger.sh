#!/bin/bash

# we want similar to an iMac "Bubble..."
# iMacs are SCSI systems(hacked to ide hdd) by default

qemu-system-ppc -L pc-bios \
    -M mac99 \
    -cpu G3 \
    -boot c \
    -m 640 \
    -prom-env 'auto-boot?=true' \
    -drive file=Tigers.img,format=vmdk \
    -cdrom /dev/cdrom \
    -usb \
    -device usb-kbd \
    -device usb-mouse \
    -sdl \
    -vga std \
    -display gtk \
    
#net    
#    -netdev user,id=network01 \
#    -device sungem,netdev=network01 \

#scsi cdrom (only two slots on the bus for drives)


# ppc has no video acceleration
# ppc uses openhackWare or  openBIOS
# tbxi is the blessed boot magic file
# does come with FireWire v1

#screws with output     -prom-env 'vga-ndrv?=true' \
# -device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" \

