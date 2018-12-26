#!/bin/bash

# machine =q35 (unless reformatted w x64 disc I dont have) w UEFI OVMF
#therefore limited devices on the bus
#otherwise- no passthru
#cant turn qxl off with q35(bug??)

qemu-system-x86_64 \
-machine q35,accel=kvm \
-cpu core2duo,kvm=off,vendor=GenuineIntel \
-smp 2 \
-m 4096 \
-boot c \
-usb \
-device usb-host,vendorid=0x046d,productid=0xc52b \
-device usb-host,vendorid=0x1b80,productid=0xe31d \
-drive media=disk,format=qcow2,file=seven.qcow2 \
-drive format=raw,readonly,media=cdrom,file=roxio.iso \
-device vfio-pci,host=01:00.0,addr=1c.0,multifunction=on \
-device vfio-pci,host=01:00.1,addr=1c.1,multifunction=on \
-parallel none \
-serial none \
-display gtk \
-vga qxl \
-monitor none \

#logitech wireless keyb and mouse
#046d:c52b

#SELPHY(needs drivers)
#04a9:3214
#-device usb-host,vendorid=0x04a9,productid=0x3214 \

#usb video capture
#1b80:e31d 

#cdrom
#/dev/sr0
     
# samba has to be running to share the home folder(with auth for rw support)      
#      -smb $HOME 
