qemu-nbd -c /dev/nbd0 test.qcow2
VBoxManage convertfromraw -format VDI /dev/nbd0 test.vdi

