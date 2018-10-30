# The VFIO Howto

copy these to /etc/<something>

These are scatterpied all over the place, so Im trying to duplicate the file structure.
You will have to do a few things.

	1- get your Pci(E) bus Ids(these are mine)
	This is documented elsewhere but worth repeating

		lspci -vnn
		lspci -vkk

	etc...(it shows the Vendor:HWids) on sindows just "mange the coputer" and peek at the nice folder tabs of your hardware.

	2- update these values in thse files here and copy them (as root) into your unice box

		blacklist.conf:

		just to be safe add:
   
			blacklist radeon

		-unless you want to put noveau or nvidia here


	3- update the initial ramdisk
		
		sudo update-initramfs -u on ubuntu /debian

	4- update grub

		sudo update-grub

after rebooting check check check 


CHECK:

	dmesg| grep IOMMU (chip and its sound HDMI must be in same group)
	dmesg| grep DMAR (may be empty)
	dmesg| grep vfio_pci (should see two devies per video card)
 
	if you launch qemu and it appears to hang but doesnt exit with an error and has no output-move your screen into the other chip to see if it comes on.
 
	(mine doesnt, probably incompatibility in D3 wake state, also the OS (win10 in libVirt) should kick over drivers)
 
	**IF YOU SEE a VM CRASH ON "NATIVE DRIVERS" you have done this right.**
	** you may have too old of a video card for this (try swapping ids) **


Finally..Try to libVirt(easiest) with Win10 

		-or laod Sierra, High sierra or mojave
	
		
If the vram is over 16MB, its working -at least partially. 

What you see is being pulled back (mirrored thru QXL) from VRAM of the chip used.

(The rest may be incompatible or aged chips.)

Yes- you can use a REAL HARD DRIVE!

-Have FUN!
