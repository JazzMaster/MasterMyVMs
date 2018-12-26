# need clover kernel to get this going.

MY_OPTIONS="+aes,+xsave,+avx,+xsaveopt,avx2,+smep"

qemu-system-x86_64 -enable-kvm -m 4096 -cpu Penryn,kvm=on,vendor=GenuineIntel,+invtsc,vmware-cpuid-freq=on,$MY_OPTIONS\
	  -machine pc-q35-2.9 \
	  -smp 4,cores=2 \
	  -usb -device usb-kbd -device usb-tablet \
	  -device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" \
	  -drive if=pflash,format=raw,readonly,file=OVMF_CODE.fd \
	  -drive if=pflash,format=raw,file=OVMF_VARS-1024x768.fd \
	  -smbios type=2 \
	  -device ich9-intel-hda -device hda-duplex \
	  -object iothread,id=io1 \
	  -device ide-drive,bus=ide.1,drive=MacHDD \
	  -drive id=MacHDD,if=none,file=./Sierra.qcow2,format=qcow2 \
	  -device ide-drive,bus=ide.0,drive=MacDVD \
	  -drive id=MacDVD,if=none,snapshot=on,media=cdrom,file=/dev/cdrom \
	  -netdev tap,id=net0,ifname=tap0,script=no,downscript=no \
      -device e1000-82545em,netdev=net0,id=net0,mac=52:54:00:c9:18:27 \


#needs OUTPUT tweaking 
#-device ioh3420,bus=pci.0,addr=1c.0,multifunction=on,port=1,chassis=1,id=root.1 \
#-device vfio-pci,host=01:00.0,bus=root.1,addr=00.0,multifunction=on \
#-device vfio-pci,host=01:00.1,bus=root.1,addr=00.1 \

#USB bus
#-device piix3-usb-uhci \

#(logitech k520+mouse combo chip)
# -device usb-host,vendorid=0x46d,productid=0xc52b \

# samba has to be running to share the home folder(with auth for rw support)      
#      -smb $HOME 
