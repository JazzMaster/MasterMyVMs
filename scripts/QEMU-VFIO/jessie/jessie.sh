#!/bin/bash
#launch script as ROOT!

# QEMU name and PID
OPTS="-name RH-Fedora"
 
# Processor core2duo qemu64 host
OPTS="$OPTS -cpu core2duo,kvm=off"
OPTS="$OPTS -smp 2"
OPTS="$OPTS -enable-kvm"
 
# Machine-reboot loop= ATI needs pc instead of q35
OPTS="$OPTS -machine type=pc,accel=kvm"

 
# The following setting enables S3 (suspend to RAM). OVMF supports S3
# suspend/resume. Disable when using Q35
#OPTS="$OPTS -global PIIX4_PM.disable_s3=0"
 
# Memory
OPTS="$OPTS -m 4G"
 
# Hardware clock
OPTS="$OPTS -rtc clock=host,base=utc"
 
# Sound hardware
OPTS="$OPTS -soundhw hda"

# Keyboard layout
OPTS="$OPTS -k en-us"
 
# Boot priority
OPTS="$OPTS -boot order=dc"
 
# OVMF
OPTS="$OPTS -drive if=pflash,format=raw,readonly,file=OVMF_CODE.fd"
OPTS="$OPTS -drive if=pflash,format=raw,file=OVMF_VARS.fd"
 
#VFIO
#OPTS="$OPTS -device ioh3420,bus=pci.0,addr=1c.0,multifunction=on,port=1,chassis=1,id=root.1"
#OPTS="$OPTS -device vfio-pci,host=01:00.0,bus=root.1,addr=00.0,multifunction=on "
#OPTS="$OPTS -device vfio-pci,host=01:00.1,bus=root.1,addr=00.1 "

# System drive

#OPTS="$OPTS -object iothread,id=io1"
OPTS="$OPTS -drive id=disk0,if=virtio,cache=none,format=qcow2,file=fedora.qcow2 "

#  installer(actual disc)
OPTS="$OPTS -drive id=cd0,if=none,format=raw,readonly,file=/dev/cdrom"
OPTS="$OPTS -device driver=ide-cd,bus=ide.0,drive=cd0"

#install some virtIO packages 
 
# A USB tablet device in the guest allows for accurate pointer tracking
# between the host and the guest.

# only works for install

OPTS="$OPTS -device piix3-usb-uhci"
OPTS="$OPTS -usbdevice tablet"

#post install(logitech k520+mouse combo chip)
#OPTS="$OPTS -device usb-host,vendorid=0x46d,productid=0xc52b "

# Network-works oob
#OPTS="$OPTS -netdev type=tap,id=net0,ifname=vmtap0,vhost=on"
#OPTS="$OPTS -device virtio-net-pci,netdev=net0,mac=00:16:3e:00:01:01"

#install only
OPTS="$OPTS -display gtk" 
OPTS="$OPTS -vga qxl"

#post install(must install vfio real hw driver before removing the qxl 'chip')
#failing to set these leads to "blue screen" reboot loop after install
#OPTS="$OPTS -vga none"
#OPTS="$OPTS -monitor none"

OPTS="$OPTS -serial null"
OPTS="$OPTS -parallel null"

# my chip is old(RX550 vs 480+)
OPTS="$OPTS -no-reboot" 

qemu-system-x86_64 $OPTS
