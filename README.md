# MasterMyVMs
instructions on "VM-ing everything" and howto

Yet another not-quite-technically code repo, but since others do similar.....

What is here is detailed instructions (for demo purposes) on how to 

        clone-rescue
        clone-restore
        use VM trick and techniques to snapshot real OSes with REAL HARDWARE
        and how to simulate as many OSes as possible, albeit not at the same time.

I also have instructions on VFIO thru EFI- the new Linux gaming technique that doesnt waste a hard drive
(if youve got a tower and a spare graphics card-its worth a try).

No VALVE- we arent cheating, "most of us..", this is HELP us in everyday life.


Some got it working on ARCH-Linux....
**I got it working on Ubuntu.**

VM (PC apps):

        VMWare (HOME/eval edition)
        VirtualBox
        Basilisk /Sheepshaver 
        QEMU(3.0)
        libVirt(KVM to QEMU hooks)

You WILL NOT most likely have KVM(KQEMU) or libVirt on WINDOWS. 
Real MacOSX machines may be able to build this- I DONT KNOW.


I could not get PearPC to avoid "triple-fualt" crashing.
Basilisk and Sheepshaver code changes too much to be posted here.

Virtualbox, QEMU, and libVirt(kernel) are in the repoes for your UNICE OS somewhere.  
If not, build them.  

You **may or may not** be able to find binaries for other OSes.


### CDs? Disks?

UH YEAH---PCs need these.... lol

You will have to download at least an ISO. 
Burning (to disc) it is your option.

So what if you dont have one?

        Try the Internet Archive
        Some other "non-torrent sites" have the ISO. Use google.
        Google for some Linux you might want to try. THEY GIVE YOU THE ISO.
        If you want to watse your money- go find a store selling computers. The software is called an "OS".
    
"Boot Floppies" may be needed.
CDROM and HDD is a requirement.


Formatting is "VIRTUAL" (if you do it correctly). 
You arent partitioning "physically" anything.

This said:

	YOU are responsible for your data and if you hook up an ACTUAL DISK, PLEASE BE CAREFUL.
	You are given the option to do so- and it clearly works.

DATA DAMAGE NOTE:

        never dd a RAW DISK (of any sort) unless you "know what you are doing" and the drive is VERIFIED as the "right one".

### Processors

I use siulated core2duo or Penryn, the upgraded one most of the time.

UBUNTU and SuSe and Fedora dont really care.
Avoid the -host option. QEMU snags a bit due to it (and glitches your real OS).
	
### Memory

YES- BUY MORE! (or allocate more if you can)
DO NOT setup hugepages or increase the value of it. 

IT WILL CRASH YOUR SYSTEM if you do so.
HORRIBLY. 

HUGEPAGES Is not worth the hassle, IMHO.

### VRAM /VFIO

This is only possible with 

        UEFI HOST system(the real hardware) with UEFI BIOS (GPT format reccommended but not required)
        Correct UEFI GUEST BIOS (more on this in a minute)
        UEFI (64 bit) installed guests(inside the VM).

You need more than one:

         video card
         mouse
         keyboard
         screen(how much better to see it working)

(The rest is virtual)

Dont blame me for "lockups" when QEMU "eats your first mouse and keyboard" thru VFIO.
(its supposed to)

These methods should work for you, with some caveats noted in other places of the web.

## UEFI BIOS files:

(These are open source, dont woory)

        There is a working set for 7/10 and ANOTHER working set for Sierra+
        There appears to be yet another set for ARM arch

I have sorted out this mess for you.


DONT CONFUSE THESE- 

        I will break UEFI VFIO and youll be scratching your head as to why the driver wont init the chip.

Even said, you might have "one-shot VFIO older video cards" (cards that wont reset without physical machine reboot)
and might need to use QXL/virtio in QEMU on occasion. 
	
Lockups are not the VFIO chip in most circumstances, oddly its the USB input keyboard and mouse.

### Sound

	Sound is dodgy and may or may not work. SORRY.
	Its more of a QEMU thing. libVirt can fix this on 32bit OSes, Ive yet to get it working on 64.

        UEFI issue w TianoCore?

    This said:

        If you are using a 64bit OS, you should be using VFIO and have available to you (as passthru)- the video cards audio chip.
        (Hookup a TV/projector instead of a PC monitor)

## Hardware Caveat:

You will probably have an AMD ROG or GIGABYTE board if using an AMD-FX CPU.
(Most of the others are for INTEL or RYZEN or older AMD cpus)



AMD GIGABYTE UD3R (verison X,Y,Z): 
(not "officially supported" to run linux- use iommu=soft and "disable iommu in bios" to get it going)

When you want VFIO:

        Turn IOMMU on in the bios

THEN pay close attention to GRUB boot option:

        iommu=fullflush amd_iommu=pt

USB3 / IOMMU will not work correctly if you use the stock 'iommu=on' option on these board(s).
The software option in GRUB doesnt enable VFIO correctly "but will boot".


ROG motherboards: 

        I cant get the thing to reliably boot linux properly.  Manufacturer doesnt care.
		If you find out how- let me know.
		
Apple:

		Pre OSX (High Sierra now) devices are abandonded by Apple.

You are "supposed to" run OSX on OSX compatible hardware like a 'mac mini or Pro tower'. 
(Non-fake) SMC keys are embedded in apple products and youre 'not supposed to distribute them'.
-Thats what APPLE says.

		(There is a FAKESMC kernel extension)

QEMU:  
        
        Intel-VT and MSR warnings can be  ignored.
        High Sierra and Mojave are supported (if your AMD CPU is new enough or you are using relatively new INTEL-core i7? ).

I have no issues as of yet emulating Mojave with my AMD FX CPU, it has on-die instruction support "above Mojave".
Cuss me out all you want INTEL folk- Im still effectually out-processing you and AMD OCTO core DO EXIST.
(Thats why I had the ROG board at first)


### KEYS? Its asking me for keys!!

** DO NOT ASK ME ABOUT OS KEYS- YOU WERE "SUPPOSED TO BUY THE SOFTWARE" **

Decrypting BLU-RAY is another topic for another area- but the method does work(VLC /MPlayer uses it).
You are legally allowed in the US to hack your firmware to remove DRM.
(That includes using "VUK dumping" BDROM drive FIRMWARE).


If I ship or Torrent a VM it is with keys stripped out.
There are legal reasons for this. 
Find your own (or hack in your own at your own risk)- I dont care -but leave my keys out of it.


DO not try to emulate (or VM) any of this while running your OS under a VM.
(A VM thru a VM doesnt work) 

Howver, do feel fre to try them at home under your OS of choice.

Do not be stupid with your chromebook and ask me(because it was freely given to you) where you can 
run live versions of this thru the internet. 
(That is a 'qemu installer' option--oddly enough)

THIS IS HOW you 'try-before-buying'. Its called a VM.


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
        The BETA will complain about point variance in the Guest addtions ISO.

        The drive modding scrypts use VM internals, so make sure the drives you are playing with this way are NOT in the
            list of "managed drives" inside VBox.

This just so happens to be what I chose to use, qemu tools can do the same thing.

## LibVirt

        The virtual computer data files are hidden and you have to use "certain commands" to edit them.
        I dont like this idea.

        There are undocumented mods to tweak qemu in places, such as sound.
        You have to edit "files in weird places" sometimes in your OS.

### Setting up a hard disk

Note this is not RAW format, which is needed for bare-boned hard drives.

        You should not write anything but a raw file via dd to a physical drive, or try to read same from one.

This is an intermediary process and takes up loads of space--however, it works.

(My win7 VM was pulled from an "actual HDD in an eMachine".)


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



libVirt will allow snapshots, provided the following conditions are NOT met.
(no snapshots if this is TRUE)

		VFIO in UEFI- Unknown hardware state of real hardware video device
		VM is running(must be off)

Qemu does have a GUI.

        --enable-gtk build option(configure)
        -display gtk QEMU option(to run the VM with). 


(You need a few libraries under Ubuntu to get it all up and running correctly.)


VirtualBox is not the enemy but it can be a PITA at times. libVirt is more of one.
I have not tested these with VMWare and my OS scripts have not used VMWare or "VBox hacks" which are floating around.

Win XP was the exception for my MD drive but with usb passthru(doesnt work w VBox) this shouldnt be a problem anymore.
(lsusb -v to get the vendor ids)

Im running the following:

		AMD 4300 4GHZ QUAD CORE
		QUAD RADEON HD 7850s (not always running all four)
		RX 550
		16GB RAM
		GIGABYTE UDER board(v3?)
		
Ive gotten the following OSes into a VM (and sortof) smoothly running:

Microsoft actually allows "testing" in a VM "for eval purposes". 
OS Keys are less of a problem until you "push to real hardware" via dd (and a RAW formatted HDD file).

			Dos/FreeDos (VBox)
			Win2 (VBox)
			Win3 (VBox)
            
            Win95 -being tested- (QEMU)
			Win98 -needs help- (VBox only)
			WinXP -iffy- (VBox)

These two are provided as TESTING from Microsoft to "test IE" with:

            Win7(VBox)
            Win8(VBox)

            https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/
            (has a 90 day expiring demo key)

            These are "Tarballed" .ova files containing a PC and Disk Drive. 
            ("Import appliance" inside VBox)

My installs are either "pulls from real computers" or "fresh installs".


			SuSe (Vbox and QEMU/ KVM)
			Ubuntu(MATE) (VBox and QEmu/KVM w VFIO )
			Fedora (Twenties) (VBox)
			OS2 Warp (VBox) ^ Rare ^
			
			Win10(QEMU/KVM VFIO or VBox without it)
			
			Mac OS8 (Sheepshaver/Basillisk)
			Mac OS9.0.4(Sheepshaver)
			Mac OS9.2.2(QEMU ppc)
			
            BeOS -what did I do with it?- (VBox)
            CentOS 7  (VBox)
            (RHEL w "community support" instead of "RH support" -its like Debian "server edition")

			OSX Snow Leopard(QEMU/KVM x86 mode)
			OSX Sierra(QEMU/KVM x86 mode, tweaked -noVFIO yet, need modded KEXTs)

The win95 ISO is Freedos(installed and slimmed down) combined with a win95 boot floppy, nothing more.
(Ideally this should be a Freedos boot floppy or a "repacked win95 ISO" w said)

NT hasnt been tested because is server/workstaion archetecture. Some report success.
iMac (2000) uses similar SCSI drives(IDE is a trick (and a hack) to install unsupported DVD/burner support)

The focus is on "PCs at HOME"

my journey started awhile ago..YMMV. 

Whether yours is short or very long is up to you.
The OSes you keep in you NAS are your business,not mine.



