VBoxManage clonehd debbie-jessie.vdi disk.raw --format raw
qemu-img convert -f raw disk.raw -O qcow2 jessie.qcow2
