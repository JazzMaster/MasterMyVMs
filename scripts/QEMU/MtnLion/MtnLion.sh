#     -drive if=pflash,format=raw,readonly,file=OVMF_CODE.fd \
#	  -drive if=pflash,format=raw,file=OVMF_VARS.fd \


sudo  /usr/bin/qemu-system-x86_64 \
      -M q35,accel=kvm \
      -m 4096 \
      -cpu core2duo,vendor=GenuineIntel -smp 2,cores=2 \
 	  -smbios type=2 \
	  -device ich9-intel-hda -device hda-duplex \
	  -device ide-drive,bus=ide.1,drive=MacHDD \
	  -drive id=MacHDD,if=none,file=./mtnLion.qcow2,format=qcow2 \
	  -device ide-drive,bus=ide.0,drive=MacDVD \
	  -drive id=MacDVD,if=none,snapshot=on,media=cdrom,file=/dev/cdrom \
      -boot c \
	  -usb -device usb-kbd -device usb-tablet \
      -no-reboot \
	  -display gtk \
      -vga qxl \
      -soundhw hda \
      -net nic,model=rtl8139 \
      -net user \
      -no-kvm-irqchip \
      
# samba has to be running to share the home folder(with auth for rw support)      
#      -smb $HOME 
