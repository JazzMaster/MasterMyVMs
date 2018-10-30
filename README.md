# MasterMyVMs
instructions on VMming everything and howto

Yet another not-quite-technically code repo, but since others do similar.....

What is here is detailed instructions (for demo purposes) on how to clone-rescue, clone-restore, use VM trick and techniques to snapshot real OSes with REAL HARDWARE, and how to simulate as many OSes as possible, albeit not at the same time.

I also have instructions on VFIO thru EFI- the new Linux gaming technique that doesnt waste a hard drive(if youve got a tower and a spare graphics card-its worth a try).

Some got it working on ARCH.

I got it working on Ubuntu.

VMWare (HOME/eval edition), VirtualBox, Basilisk and Sheepshaver will have to be download seperatly from the projects distinctive websites. 
Basilisk and Sheepshaver code changes too much and isnt posted here on GH (that I know).

Virtualbox, QEMU, and libVirt(kernel) are in the repoes for your UNICE OS somewhere.  If not, build them.  You may be able to find binaries for other OSes.


### CDs? Disks?

UH YEAH---PCs need these.... lol

You will have to download at least an ISO, if not burn it to disc.

		If you are quesy about the process, start with a UBUNTU or debian (sparky??) LIVE cd


CDROM and HDD is a requirement, how you store the DATA is irrelevant.
Follow these methods. Formatting is "VIRTUAL" if you do it correctly. You arent partitioning "physically" anything.

This said:

	YOU are responsible for your data and if you hook up an ACTUAL DISK, PLEASE BE CAREFUL.
	You are given the option to do so- and it clearly works.

BUT BUT BUT... my journey started awhile ago..YMMV. Whether yours is short or very long is up to you.
The OSes you keep in you NAS are your business,not mine.

### Processors

	I use core2duo or Penryn, the upgraded one most of the time.
	UBUNTU and SuSe and Fedora dont really care.
	
### Memory

	YES- BUY MORE! (or allocate more if you can)
	DO NOT setup hugepages or increase the value of it. IT WILL CRASH YOUR SYSTEM if you do so.

### VRAM   	

	This is only possible with VFIO on UEFI HOST systems(the real hardware) , UEFI compaqtible BIOSes, and UEFI guests(inside).
	You need more than one video card.
	These methods should work for you, with some caveats noted in other places of the web.
	
### Sound

	Sound is dodgy and may or may not work. SORRY.
	

Hardware Caveat:

		Gigabyte UDER(UDDER) boards will have a IOMMU vs USB3 conflict. Turn one or the other on, not both in BIOS.
		Intel VT warnings can be bypassed or ignored if your (AMD) cpu is new enough.
	
		ROG: I cant get the thing to reliably boot linux properly.  Manufacturer doesnt care.
		
				
Apple:

		Pre OSX devices are abandonded by Apple. Caveat Emptor- but a hackers paradise.
		You are "supposed to" run OSX on OSX compatible hardware like a mac mini or Pro tower. 
		(Non-fake) "SMC keys are embedded in apple products and your not supposed to distribute them".
		-Thats what APPLE says.
		(There is a FAKESMC kernel extension)


** DO NOT ASK ME ABOUT KEYS **
Decrypting BLU-RAY is another topic for another area- but the method does work(VLC /MPlayer uses it).
You are legally allowed in the US to hack your firmware to remove DRM.
(That includes "VUK dumping" BDROM drive FIRMWARE).


If I ship or Torrent a VM it is with keys stripped out.
There are legal reasons for this. Find your own or hack in your own- I dont care -but leave my keys out of it.



DO not try to emulate or VM any of this while running your OS under a VM.
(A VM thru a VM doesnt work) Howver, do feel fre to try them at home under your OS of choice.

Do not be stupid with your chromebook and ask me(because it was freely given to you) where you can 
run live versions of this, or your primary OS. THIS IS HOW you try-before-buying. Its called a VM.
The other method is to buy a cdrom drive and grab a LIVE CD. 

:-)

- I have had some Indian (debian idiot) ask me this.



## Basilisk

		This is for some really old MCHacking... but I cant seem to get it to run "less than OS7 media"
		I think the Ubuntu fork is crippled (and the sources dont like me).

## SheepShaver
   
		Runs OS8 and 9.0.4- if you can find the right image and Quadra ROM file.
		Use QEMU (powerpc) for 9.2.2.


## VirtualBox
	
		Try to use the most newest, even the BETA where possible- it supports more.
		I havent noticed much of a stability problem, however, you need to download the toolkit and guest ISO seperately.


### Setting up a hard disk

Note this is not RAW format, which is needed for bare-boned hard drives.
You should not write anything but a raw file via dd to a physical drive, or try to read same from one.
This is an intermediary process and takes up loads of space--however, it works.

(My win7 VM was pulled from an actual HDD in an eMachine.)

QCOW2

		qemu-img create -f qcow2 test.qcow 2G
		
VMDK(flat file with zeros in it,wasteful)

		qemu-img create -f vmdk -o subformat=monolithicFlat test.vmdk 2G
		
PEARPC

		This uses a weird format and size but can be downloaded from the PearPc website.
		I have not noticed much of a use, as nothing wants to install.
		
		
Scripts(BASH) are included to convert to/fro actual disks.
Those familier with dos should be able to use them, syntax is a little different on Unices.

"fatcow" is a reference to QCOW. It should read "SkinnyCow"- qcow is compressed. MOO.



VMDK conversion is only necessary for VBox. 

QEMU doesnt care and snapshots are a PITA console command with QEMU- so be aware of this.

libVirt will allow snapshots, provided these conditions are NOT met.

(no snapshots if this is TRUE)

		VFIO in UEFI- Unknown hardware state of real hardware video device
		VM is running(must be off)

Qemu does have a GUI, but its intermittent if the menu shows up. I use verison 3.
(You need a few libraries under Ubuntu to get it all up and running correctly.)

Attaching the source for this, its hard to find.

VirtualBox is not the enemy but it can be a PITA at times. libVirt is more of one.
I have not tested these with VMWare and my OS scripts have not used VMWare or "VBox hacks" which are floating around.

Im running the following:


		AMD 4300 QUAD CORE
		QUAD RADEON HD 7850s (not always running all four)
		RX 550
		16GB RAM
		GIGABYTE UDER board(v3?)
		
Ive gotten the following OSes into a VM (and sortof) smoothly running:

			Dos/FreeDos (VBox)
			Win2 (VBox)
			Win3 (VBox)
			Win98 (VBox)
			WinXP (VBox)
			Win7 (VBox) 
			Win8 (VBox)
			SuSe (Vbox and QEMU KVM)
			Ubuntu(MATE) (VBox and QEmu/KVM)
			Fedora (VBox)
			OS2 Warp (VBox) ^ Rare ^
			
			Win10(QEMU/KVM VFIO or VBox without it,slower)
			
			Mac OS8 (Sheepshaver/Basillisk)
			Mac OS9.0.4(Sheepshaver)
			Mac OS9.2.2(QEMU ppc)
			
			OSX SnowLeopard(QEMU/KVM x86 mode)
			OSX Sierra(QEMU/KVM x86 mode, tweaked)

