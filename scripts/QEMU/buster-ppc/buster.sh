qemu-system-ppc \
-L pc-bios \
-boot c \
-M g3beige \
-cpu 750 \
-m 1024 \
-net nic,model=sungem \
-net user \
-hda debian10.qcow2 \
-cdrom netinst.iso \
-sdl \
-vga std \
-display gtk \
-g 800x600x32 \

#buster doesn use yaboot-quik is used.
#-prom-env "boot-device=hd:,\yaboot" \
#-prom-env "boot-args=conf=hd:,\yaboot.conf"\

#g3beige= g3 tower(obviously, beige) or BLUE/White G3 tower
#max RAM 768mb
#cpu 750

#mac99 =g4 graphite tower (1-2 cores)
#2GB ram,1.5 for os9
#cpu 7400

#sneak in a disk w apt-keys to install anything.
#must force install of adding the pkg

#needs sudo, curl,wget,wput-the basics
#An ATi tweak or driver tweak may also be needed.
