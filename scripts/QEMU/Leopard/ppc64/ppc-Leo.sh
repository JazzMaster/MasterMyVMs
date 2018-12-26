qemu-system-ppc \
-M mac99,via-pmu \
-m 1024 \
-hda Leo.qcow2 \
-cdrom Leo.iso \
-prom-env boot-args="-v" \
-cpu G5 \
-sdl \
-vga std \
-display gtk \
-boot d \
-g 1024x768x32

#g4 can support Leopard with the XPostFacto app.
