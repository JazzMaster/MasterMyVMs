# The VFIO Howto

copy these to /etc/

These are scatterpied all over the place, so Im trying to duplicate the file structure.
You will have to do a few things.

locate and edit kvm/qemu config files to allow sound
(I forget if these files are HERE or not)

	1- get your Pci(E) bus Ids(these are mine)
	This is documented elsewhere but worth repeating

		lspci -vnn
		lspci -vkk

	etc...(it shows the Vendor:HWids) on windows just "manage the computer" and peek at the nice folder tabs of your hardware.

    grep is your friend here: lspci -vnn | grep ATI
    

	2- update these file to match your unice box hardware

	blacklist the module you ARENT using. I have one using radeon(7850) and one using amdgpu(rx550)
    Note:
    
		you need at minimal RX550 or "UEFI capable card" (look on the chip)

	3- update the initial ramdisk
		
		sudo update-initramfs -u (on ubuntu /debian)

	4- update grub

		sudo update-grub

after rebooting check check check 


CHECK:

	dmesg| grep IOMMU (video chip and its sound HDMI must be in same group)
	dmesg| grep DMAR (may be empty)
	dmesg| grep vfio_pci (should see two devies per video card)
 
 
	if you launch qemu and it appears to hang -but doesnt exit with an error and has no output-
	move your screen into the other chip to see if it comes on. Most likely IT DID.

    YOU WILL LOSE your initial keyboard and mouse- and be forced to add another- while the VM is in VFIO mode.
    (This is why it appears to hang)
  
    also the OS (win10 in libVirt) should kick over REAL HARDWARE drivers, even with QXL active- this is key indicator that its working.
 
	**IF YOU SEE a VM CRASH ON VIDEO DRIVERS INSTALL you have done this right**,however, you are using the wrong OVMF files.
	** also: you may have too old of a video card for this (try swapping ids) **

I have twin Radeons-nVidia does NOT like VFIO. Some have gotten this to work.

Finally..Try to libVirt(easiest) with Win10 ("system" or "root-session", not "user-session")
If the vram is over 16MB, its working -at least partially. 
(What you see is being pulled back (mirrored thru QXL) from VRAM of the chip used.)

Sierra, HighSierra and MoJave(all support METAL) will have to tweaked and kexts added for this to work properly.
(QXL has no problem.)

You can remove QXL later(unless using libVirt/virt-manager) and flop the comments around marked(install only) to (post install)
(You will wind up with a very minimal window on the primary OS and output on the second card at this point.)


## NO! (doesnt work)

Radeon HD 7850 and earlier cards are **NOT UEFI** and they-must-be for this to work!!

		(There is a label on the chip itself to indicate this)
		This said: It doesnt guarantee your card is compatible, but in theory it should be.

Yes- you can use a REAL HARD DRIVE(even eMMC)! (I chose not to waste the space and use a SaMBa share instead)

Note that some games see a VM somehow- and freak out(they think youre cheating).


This IS A PAIN to setup- put its SOOOOO WORTH IT!

-Have FUN!
