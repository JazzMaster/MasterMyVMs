# I havent tested this, you need windows to convert the image file from UUD/ESDS to ISO.
# notice the pflash lines for Win10..

qemu-system-aarch64.exe \
-M virt \
-cpu cortex-a57 \
-smp 3 \
-m 4G \
-pflash QEMU_EFI.img \
-pflash QEMU_VARS.img \
-device VGA \
-device nec-usb-xhci \
-device usb-kbd \
-device usb-mouse \
-device usb-storage,drive=install \
-drive if=none,id=install,format=raw,media=cdrom,file=.\win10-arm.iso \

-device usb-storage,drive=drivers \
-drive if=none,id=drivers,readonly=on,file=.\drivers.vhdx \
-device virtio-blk,drive=system \
-drive if=none,id=system,format=raw,file=.\system.vhdx
