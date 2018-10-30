
    # unbind the driver from the PCI device and bind it to the vfio
    #  you can find similar functions all over the internet
    vfiobind() {
        dev="$1"
        vendor=$(cat /sys/bus/pci/devices/$dev/vendor)
        device=$(cat /sys/bus/pci/devices/$dev/device)
        if [ -e /sys/bus/pci/devices/$dev/driver ]; then
            echo $dev > /sys/bus/pci/devices/$dev/driver/unbind
        fi
        echo $vendor $device | tee /sys/bus/pci/drivers/vfio-pci/new_id
    }

    # to see exactly what the script is doing and
    #  terminate itself if command does not exit with 0
    set -xe

    vfiobind 0000:02:00.0  # graphic card
    vfiobind 0000:02:00.1  # graphic card audio
    # the same goes for any other PCI device like: 
#audio (even if you use built in - motherboard audio) or USB controller

#audio complains and fails

# use pulseaudio
export QEMU_AUDIO_DRV=pa
export QEMU_PA_SAMPLES=8192
export QEMU_AUDIO_TIMER_PERIOD=99
#export QEMU_PA_SERVER=/run/user/1000/pulse/native
export PULSE_SERVER=unix:/tmp/pulse

#win hosts
#virtio disks
#-object iothread,id=io1
#-drive
#if=none,id=drive0,file=$(pwd)/qemu_vm.qcow2,format=raw,aio=native,cache=none,cache.direct=on,discard=unmap
#-device virtio-scsi-pci,id=scsi0,ioeventfd=on,iothread=io1,num_queues=4
#-device scsi-hd,drive=drive0,id=scsihd0

# optimized net:
#-device virtio-net,netdev=net0,mac=de:ad:be:ef:33:4a"
#-netdev
#tap,id=net0,ifname=vmtap0,script=./qemu-ifup,downscript=./qemu-ifdown"

#turn off swap in guests

#hardware requires(limited) root access, doesnt seem to work- (just run this as sudo)
#no hdmi out with AMD HD 7850 and drivers under Win10 reset the machine as if the device cant be woke up.
#otherwise, libvirt sees the chip. You will have to set Win10 up that way(win64 on EFI BIOS) yourself, its like VirtualBox.

#sudo -Hu qemu_vga 

 qemu-system-x86_64 \
  -m 4G \
  -mem-prealloc \
  -smp 2 \
  -vga none \
  -machine pc-i440fx-2.1,accel=kvm \
  -boot c \
  -nographic \
  -nodefaults \
  -device vfio-pci,host=02:00.0,multifunction=on,x-vga=on \
  -device vfio-pci,host=02:00.1 \
  -usb \
  -hda ubuntu-18.qcow2 \

#  -soundhw ac97 \

# I think this is for mice etc..need a busid too...
#  -usbdevice host:1002:6819 \
#  -usbdevice host:1002:aab0 \
#  -cdrom /dev/cdrom \ 

#real HDD, virtio iso and sin10installer cdrom
#-drive file=/dev/sdd,format=raw,cache=none,aio=native,if=virtio,index=1 \
#-drive file=/dev/cdrom,media=cdrom,index=2 \
#-drive file=./virt-io.iso,media=cdrom,index=3
