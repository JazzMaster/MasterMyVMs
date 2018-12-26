#!/bin/bash

# QEMU name and PID
OPTS="-name windows-10-pro"
 
# Processor core2duo 
OPTS="$OPTS -cpu core2duo,kvm=off,vendor=GenuineIntel"
OPTS="$OPTS -smp 2"
OPTS="$OPTS -enable-kvm"
 
# Machine-reboot loop= ATI needs pc instead of q35
OPTS="$OPTS -machine type=pc,accel=kvm"

 
# The following setting enables S3 (suspend to RAM). OVMF supports S3
# suspend/resume. Disable when using Q35
OPTS="$OPTS -global PIIX4_PM.disable_s3=0"
 
# Memory
OPTS="$OPTS -m 8G"
 
# Hardware clock, not UTC. UTC is linux drift.
OPTS="$OPTS -rtc clock=host,base=utc"
 
# Sound hardware
#(Use HDMI out)

# Keyboard layout
OPTS="$OPTS -k en-us"
 
# Boot priority
OPTS="$OPTS -boot order=c"
 
# OVMF
OPTS="$OPTS -drive if=pflash,format=raw,readonly,file=OVMF_CODE.fd"
OPTS="$OPTS -drive if=pflash,format=raw,file=OVMF_VARS.fd"
 
#VFIO
OPTS="$OPTS -device ioh3420,bus=pci.0,addr=1c.0,multifunction=on,port=1,chassis=1,id=root.1"
OPTS="$OPTS -device vfio-pci,host=01:00.0,bus=root.1,addr=00.0,multifunction=on"
OPTS="$OPTS -device vfio-pci,host=01:00.1,bus=root.1,addr=00.1,multifunction=on "

# System drive C
OPTS=" $OPTS -object iothread,id=io1"
OPTS="$OPTS -drive id=disk0,if=virtio,cache=none,format=qcow2,file=win10.qcow "

# Windows 10 Pro installer(actual disc)
OPTS="$OPTS -drive id=cd0,if=none,format=raw,readonly,file=/dev/sr0"
OPTS="$OPTS -device driver=ide-cd,bus=ide.0,drive=cd0"
 
# Virtio driver during install for HDD-use v8.1 amd64
#OPTS="$OPTS -drive id=virtiocd,if=none,format=raw,file=virtio-cd.iso"
#OPTS="$OPTS -device driver=ide-cd,bus=ide.1,drive=virtiocd"
 

#USB bus

OPTS="$OPTS -device piix3-usb-uhci"

# only works for install
#OPTS="$OPTS -usbdevice tablet"

#post install(logitech k520+mouse combo chip)
OPTS="$OPTS -device usb-host,vendorid=0x46d,productid=0xc52b"

# vhs->usb capture device
# OPTS="$OPTS -device usb-host,vendorid=0x1b80,productid=0xe31d"

# samba has to be running to share the home folder(with auth for rw support)      
#      -smb $HOME 


#post install(must install vfio real hw driver before removing the qxl 'chip')
#failing to set these leads to "blue screen" reboot loop after install
OPTS="$OPTS -vga none"
OPTS="$OPTS -monitor none"

OPTS="$OPTS -serial null"
OPTS="$OPTS -parallel null"

OPTS="$OPTS -no-reboot" 

sudo qemu-system-x86_64 $OPTS

