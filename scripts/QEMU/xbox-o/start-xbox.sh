# 128mb ram hack is available

#mcpx.bin is the uuencoded file on pastebin, hacked.
#bios.bin is the eeprom file
#xbox hdd must match the file generated in the other script.(syntax)
#	MUST BE LOCKED. (we fake it when creating drive) This is MSFT limitation(in hardware), softmodding will not change this.

#cdrom device is cdrom unless you need another hdd for cloning.
#original xbox only supports two IDE drives(sata is a hardware drive hack)

#cdrom must be present on boot or boot will fail.
#again, pesky MSFT.

#all input is modified USB devices

padsp i386-softmmu/qemu-system-i386 \
    -cpu pentium3 \
    -machine xbox,bootrom=mcpx.bin \
    -m 64 \
    -bios bios.bin \
    -drive index=0,media=disk,file=xbox_harddisk.qcow2,locked=on \
    -drive index=1,media=cdrom,file=/dev/sr0 \
    -usb \
    -device usb-xbox-gamepad-sdl,index=0 \
    -display gtk \
    -vga virtio \

# ac97 isnt emulated very well
#  -soundhw ac97
    
# input does work- no reply from xbox

#official syntax- still doesnt work(logitech k520+mouse combo reciever I believe)
#    -device usb-hub,bus=usb-bus.0,port=3 \
#    -device usb-host,vendorid=0x45e,productid=0x28e,bus=usb-bus.0,port=3.2 \
