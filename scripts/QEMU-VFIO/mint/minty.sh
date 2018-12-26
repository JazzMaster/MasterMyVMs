#!/bin/bash

# QEMU name and PID
OPTS="-name MintOS"
 
# Processor core2duo qemu64 host
OPTS="$OPTS -cpu core2duo,kvm=off,vendor=GenuineIntel"
OPTS="$OPTS -smp 2"
OPTS="$OPTS -enable-kvm"
 
# Machine-reboot loop= ATI needs pc instead of q35
OPTS="$OPTS -machine type=pc,accel=kvm"

 
# The following setting enables S3 (suspend to RAM). OVMF supports S3
# suspend/resume. Disable when using Q35
OPTS="$OPTS -global PIIX4_PM.disable_s3=0"
 
# Memory
OPTS="$OPTS -m 4G"
 
# Hardware clock
OPTS="$OPTS -rtc clock=host,base=utc"
 
# Sound hardware
#OPTS="$OPTS -device intel-hda,id=sound0,bus=pci.0,addr=0x4"
#OPTS="$OPTS -device hda-duplex,id=sound0-codec0,bus=sound0.0,cad=0" 
#OPTS="$OPTS -device hda-micro,id=sound0-codec1,bus=sound0.0,cad=1"

# Keyboard layout
OPTS="$OPTS -k en-us"
 
# Boot priority
OPTS="$OPTS -boot order=cd"
 
# OVMF
OPTS="$OPTS -drive if=pflash,format=raw,readonly,file=OVMF_CODE.fd"
OPTS="$OPTS -drive if=pflash,format=raw,file=OVMF_VARS.fd"
 
#VFIO
OPTS="$OPTS -device ioh3420,bus=pci.0,addr=1c.0,multifunction=on,port=1,chassis=1,id=root.1"
OPTS="$OPTS -device vfio-pci,host=01:00.0,bus=root.1,addr=00.0,multifunction=on "
OPTS="$OPTS -device vfio-pci,host=01:00.1,bus=root.1,addr=00.1,multifunction=on "

# System drive

OPTS="$OPTS -object iothread,id=io1"
OPTS="$OPTS -drive id=disk0,if=virtio,cache=none,format=qcow2,file=mint.qcow2 "

#  installer(actual disc)
OPTS="$OPTS -drive id=cd0,if=none,format=raw,readonly,file=/dev/sr0"
OPTS="$OPTS -device driver=ide-cd,bus=ide.0,drive=cd0"


# only works for install

OPTS="$OPTS -device piix3-usb-uhci"
OPTS="$OPTS -usbdevice tablet"

#post install(logitech k520+mouse combo chip)
#OPTS="$OPTS -device usb-host,vendorid=0x46d,productid=0xc52b "

# Network-works oob(e1000)

#install only
OPTS="$OPTS -display gtk" 
OPTS="$OPTS -vga qxl"

#post install(must install vfio real hw driver before removing the qxl 'chip')
#failing to set these leads to "blue screen" reboot loop after install
#OPTS="$OPTS -vga none"
#OPTS="$OPTS -monitor none"

OPTS="$OPTS -serial null"
OPTS="$OPTS -parallel null"

OPTS="$OPTS -no-reboot" 

qemu-system-x86_64 $OPTS

