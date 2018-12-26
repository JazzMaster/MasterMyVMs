#!/bin/bash
#this is deadmoo or similar

qemu-system-i386 
    -M pc \
    -cpu core2duo,vendor=GenuineIntel,kvm=off \
    -boot dc \
    -m 2048 \
    -drive file=Tigerx86.img,format=vmdk \
    -cdrom /dev/cdrom \
    -usb \
    -device usb-kbd \
    -device usb-mouse \
    -vga qxl \
    -display gtk \

#sound hda
#-voodoo support    
    
#video
# need to work on vbox/qemu video post install
    
#net    
# not sumgem- atheros

# intel gm series does come with FireWire v1

#fakeSMC.kext
# -device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" \

