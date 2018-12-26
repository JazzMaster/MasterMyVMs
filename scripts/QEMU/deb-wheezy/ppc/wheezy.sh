 qemu-system-ppc \
-L pc-bios \
-boot c \
-M mac99,via=pmu \
-m 1024 \
-net nic,model=sungem \
-net user \
-hda wheezy.qcow2 \
-g 1024x768x32
