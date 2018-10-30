MY_OPTIONS="+aes,+xsave,+avx,+xsaveopt,avx2,+smep,+ssse3,+sse4.2,+popcnt "

qemu-system-x86_64 -enable-kvm -m 3072 -cpu Penryn,kvm=on,vendor=GenuineIntel,+invtsc,vmware-cpuid-freq=on,$MY_OPTIONS\
	  -machine pc-q35-2.9 \
	  -smp 4,cores=2 \
	  -usb -device usb-kbd -device usb-tablet \
	  -device isa-applesmc,osk="" \
	  -drive if=pflash,format=raw,readonly,file=OVMF_CODE.fd \
	  -drive if=pflash,format=raw,file=OVMF_VARS.fd \
	  -smbios type=2 \
	  -device ich9-intel-hda -device hda-duplex \
	  -device ide-drive,bus=ide.2,drive=Clover \
	  -drive id=Clover,if=none,snapshot=on,format=qcow2,file=./'Clover.qcow2' \
	  -device ide-drive,bus=ide.1,drive=MacHDD \
	  -drive id=MacHDD,if=none,file=./Mohave.vmdk,format=vmdk \

#sampled from elsewyr...
#OSK can be derived from hardware, some have (illegally) posted it...look around if youre lazy.


#  ( fd=floppy disk)
#       -cdrom /dev/cdrom \

#	  -device ide-drive,bus=ide.0,drive=MacDVD \
#	  -drive id=MacDVD,if=none,snapshot=on,media=cdrom,file=./'HighSierra-10.13.6.iso' \
#	  -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -device e1000-82545em,netdev=net0,id=net0,mac=52:54:00:c9:18:27 \
#	  -monitor stdio

#-device vfio-pci,host=03:00.0,bus=pcie.0,multifunction=on \
#-device vfio-pci,host=03:00.1,bus=pcie.0 \
