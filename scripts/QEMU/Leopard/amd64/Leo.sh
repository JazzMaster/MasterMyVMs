/usr/bin/qemu-system-x86_64 \
      -M pc,accel=kvm \
      -m 4096 \
	  -cpu core2duo,vendor=GenuineIntel -smp 2,cores=2 \
      -cdrom /dev/cdrom \
      -drive format=vmdk,media=disk,file=Leo.vmdk \
      -boot c \
      -device piix3-usb-uhci \
      -usb -device usb-kbd -device usb-tablet \
      -no-reboot \
      -soundhw ac97 \
      -net nic,model=rtl8139 \
      -net user \
      -no-kvm-irqchip \

#intel GNT board (usually)
#ich7-9 sata =(q35)
#GMA950 intel graphics(onboard)
