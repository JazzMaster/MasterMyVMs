#up to sierra (10.12.1)
# qemu-img create -f qcow2 mac_hdd.img 30G
# -cpu core2duo -> penryn
# applesmc hack allows updates

#fakesmc.kext is found on HackInTosh discs...if you use it, dont cry to me...
      
#      -drive id=virtiocd,if=none,format=raw,file="virtio-win.iso" \
#      -device driver=ide-cd,bus=ide.1,drive=virtiocd \


    /usr/bin/qemu-system-x86_64 -machine q35,accel=kvm -L pc-bios \
      -m 4096 \
      -cpu Penryn,vendor=GenuineIntel -smp 1,cores=1 \
      -cdrom /dev/cdrom \
      -device isa-applesmc,osk="" \
      -device ide-drive,bus=ide.1,drive=MacHDD \
      -drive id=MacHDD,if=none,file=./Snow_hdd.qcow2 \
      -smbios type=2 \
      -usb -device usb-kbd -device usb-mouse \
      -boot c
#	  -device e1000-82545em,netdev=hub0port3,id=mac_vnet0 \

#      -device vfio-pci,host=03:00.0 \
