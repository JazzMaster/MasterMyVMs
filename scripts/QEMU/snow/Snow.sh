
# qemu-img create -f qcow2 mac_hdd.img 30G

# applesmc hack allows updates but w q35 use fakesmc
#        -device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" \

#apple usb controller      
#passthru neeeds root access

sudo  /usr/bin/qemu-system-x86_64 \
      -M q35,accel=kvm \
      -m 4096 \
      -cpu core2duo,vendor=GenuineIntel -smp 2,cores=2 \
      -cdrom /dev/cdrom \
      -hda howie.img \
      -boot c \
      -usb -device pci-ohci -device usb-kbd -device usb-tablet \
      -no-reboot \
	  -display gtk \
      -vga qxl \
      -soundhw hda \
      -net nic,model=rtl8139 \
      -net user \
      -no-kvm-irqchip \
      
# samba has to be running to share the home folder(with auth for rw support)      
#      -smb $HOME 
      
#intel GigEnet:
# -device e1000-82545em,netdev=hub0port3,id=mac_vnet0 \
