#make it(stock-supports up to 500)
qemu-img create -f qcow2 xbox_1.qcow2 8G

#you need xboxHDM iso/data from the ISO PLUS your drive contents (IN THE ISO).
#(mkisofs genisoimage does a great job of helping you.)

#setup drive w xfat + data via xboxHDM iso (from data you ftpd over from an actual box)
#If you dont do this- the virtual xbox will never boot(no dashboard).

#DO NOT LOCK THE DRIVE with an EEPROM/BIOS file. let xqemu assume its locked.
qemu-system-i386 -hda xbox_1.qcow2 -cdrom /dev/sr0

#this is not to use the xbox- this only sets up the virtual drive.
