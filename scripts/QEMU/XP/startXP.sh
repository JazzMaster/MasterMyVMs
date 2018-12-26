qemu-system-i386 \
-machine pc,accel=kvm \
-cpu pentium3 \
-soundhw es1370 \
-display gtk \
-vga qxl \
-cdrom /dev/sr0 \
-m 512 \
-boot c \
-hda winxp.qcow \
-device piix3-usb-uhci \
-device usb-host,vendorid=0x054c,productid=0x00c9 \
-usb -usbdevice tablet \
-net nic,model=rtl8139 \
-net user \
-no-kvm-irqchip \

#Minidisc is 054c:00c9
     
# samba has to be running to share the home folder(with auth for rw support)      
#      -smb $HOME 
      
#intel GigEnet:
# -device e1000-82545em,netdev=hub0port3,id=mac_vnet0 \
