VBoxManage clonehd disk.vdi disk.raw --format raw
qemu-img convert -f raw disk.raw -O qcow2 disk.qcow2
