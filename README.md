# MasterMyVMs

Instructions on "VM-ing everything" and howto


-Yet another not-quite-technically code repo, but since others do similar.....


What is here is detailed instructions (for demo purposes) on how to 

        clone-rescue
        clone-restore
        use VM trick and techniques to snapshot real OSes with REAL HARDWARE
        and how to simulate as many OSes as possible, albeit not at the same time.

I also have instructions on "VFIO thru UEFI"- the new Linux gaming technique that doesnt waste a hard drive
(if youve got a tower and a spare graphics card-its worth a try).

No VALVE- we arent cheating, "most of us..", this HELP us in everyday life.
(I guess you guys like to waste another $1300 on another PC....)

Some got it working on ARCH-Linux....
**I got it working on Ubuntu(18).**

VM (PC apps):

        VMWare (HOME or eval edition player)
        VirtualBox
        Basilisk /Sheepshaver 
        QEMU(3.0)
        libVirt(KVM to QEMU hooks)

You WILL NOT most likely have KVM(KQEMU) or libVirt on WINDOWS. 
Real MacOSX machines may be able to build this- I DONT KNOW.

I could not get PearPC to avoid "triple-fualt" crashing.
Basilisk and Sheepshaver code changes too much to be posted here.

Macs need BLuetooth(emu or real) on modern macs and "serial ports" on older ones.
(This is part of the problem with emulating OSX 10.2,3 and 4)


Virtualbox, QEMU, and libVirt(kernel) are in the repoes for your UNICE OS somewhere.  
However, they are very old- so build them.  

QEMU is on the main website, libvirt is HERE. I did this because files are hard to find.

You are on your own to look for ROM files for sheepshaver and basilisk-

        but theres enough copies floating around that work.

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

**DATA DAMAGE NOTE:**

        never "dd a RAW DISK" (of any sort) unless you "know what you are doing" and the drive is VERIFIED as the "right one".

### Processors

I use siulated core2duo or Penryn, (the upgraded one) most of the time.

UBUNTU and SuSe and Fedora dont really care.
Avoid the -host option. QEMU snags a bit due to it (and glitches your real OS).
	
VBox will use host by default, so if youre having problems you will most likely have to hack the vm file.
(this is also why some VM downloads are AMD only- the CPU is passed thru and not emulated)

### Memory

YES- BUY MORE! (or allocate more if you can)
DO NOT setup hugepages or increase the value of it. 

IT WILL CRASH YOUR SYSTEM if you do so.
HORRIBLY. 

HUGEPAGES Is not worth the hassle, IMHO.

### VRAM /VFIO

This is only possible with 

        UEFI HOST system(the real hardware) with UEFI BIOS (GPT format reccommended but not required)
        Correct UEFI GUEST BIOS (more on this in a minute) -TianoCORE
        UEFI (64 bit) installed guests(inside the VM).

You need more than one:

         video card
         mouse
         keyboard
         screen(how much better to see it working)

-The rest is virtual

Dont blame me for "lockups" when QEMU "eats your first mouse and keyboard" thru VFIO.
(its supposed to)

These methods should work for you, with some caveats noted in other places of the web.

## UEFI BIOS files:

(These are open source, dont worry)

        There is a working set for 7/10 and ANOTHER working set for Sierra+
        There appears to be yet another set for ARM arch. (I have only gotten RasPi to work)

I have sorted out this mess for you. DO NOT MIX THESE UP- you will get similar response as my 7850 image....
When you use the correct file- this goes away and the device "just works" in VFIO mode.
Your VFIO card driver will catch the first- and then every time thereafter- if VFIO hangs- reboot the physical machine.


Even said, you might have "one-shot VFIO older video cards" (cards that wont reset without physical machine reboot)
and might need to use QXL/virtio in QEMU on occasion. QXL is primarilty used as a loopback video device- especially when in VFIO mode.
	
If your VRAM in the OS is greater than 64MB- most likely above 256MB(in my case 4G), you DID THIS RIGHT.
You just might want to remove the QXL and switch to the "normal driver".

Lockups and crashes are not the VFIOd video chip in most circumstances, oddly its the USB input keyboard and mouse.
Again, this is documented in the scripts- switch them post install.

### Sound

	Sound is dodgy and may or may not work. SORRY.
	Its more of a QEMU thing. libVirt can fix this on 32bit OSes, Ive yet to get it working on 64.

        UEFI issue w TianoCore?

    This said:

        If you are using a 64bit OS, you should be using VFIO and have available to you (as passthru)- the video cards audio chip.
        (Hookup a TV or projector instead of a PC monitor to bypass this issue)

## Hardware Caveat:

You will probably have an AMD ROG or GIGABYTE board if using an AMD-FX CPU.
(Most of the other mainboards are for INTEL or RYZEN or older AMD cpus)

You will find VM-u-lation "extremely difficult" if you use an outdated mobo and CPU combo.
Your host HAS TO SUPPORT the instruction set common to core2duo/penryn (and AMD ssev4) for this to work.
While some registers wont be supported due to compatibility(core2duo are not there on amd), most of them MUST BE SUPPORTED.
SIERRA and MOJAVE WILL NOT WORK OTHERWISE!!! (This is due to APPLE trying -and failing- to lock your CPU out)


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

		(There is a FAKESMC kernel extension. You can use the keyDUmper source code if you like)

QEMU:  
        
        Intel-VT and MSR warnings can be  ignored.
        High Sierra and Mojave are supported (if your AMD CPU is new enough or you are using relatively new INTEL-core i7? ).

I have no issues as of yet emulating Mojave with my AMD FX CPU, it has on-die instruction support "above Mojave".
Cuss me out all you want INTEL folk- Im still effectually out-processing you and AMD OCTO core DO EXIST.
(Thats why I had the ROG board at first)


### KEYS? Its asking me for keys!!

**DO NOT ASK ME ABOUT OS KEYS- YOU WERE "SUPPOSED TO BUY THE SOFTWARE"**


If I ship or Torrent a VM it is with keys stripped out.
There are legal reasons for this. 
Find your own (or hack in your own at your own risk)- I dont care -but leave my keys out of it.


DO not try to emulate (or VM) any of this while running your OS under a VM.
(A VM thru a VM doesnt work) 

Howver, do feel fre to try them at home under your OS of choice.

Do not be stupid with your chromebook and ask me(because it was freely given to you) where you can 
run live versions of this thru the internet. 
(That is a 'qemu option'--oddly enough. I wont go into the details.)

THIS IS HOW you 'try-before-buying'. Its called a VM.


The other method is to buy a cdrom drive and grab a LIVE CD. 

:-)


- I have had people ask me sone weird questions...


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

        The drive modding scrypts provided use VBox internals, so make sure the drives you are playing with this way are NOT in the
            list of "managed drives" inside VBox.

This just so happens to be what I chose to use, qemu tools can do mostly the same thing.

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

This is how you import a real disk:

        you read the RAW disk
        convert the RAW file
        compact it (VBox or 'qemu-img -c' option)
        then run "zerofree" inside the VM to "shrink the drive". max size will be the "original drive capacity".

QCOW2

		qemu-img create -f qcow2 test.qcow 2G
		
VMDK(flat file with zeros in it,wasteful)

		qemu-img create -f vmdk -o subformat=monolithicFlat test.vmdk 2G
		
PEARPC

		This uses a weird format and size but can be downloaded from the PearPc website.
		I have not noticed much of a use, as nothing wants to install.
		
		
Scripts(BASH) are included to convert to/fro actual disks.
Those familier with DOS/MSDOS should be able to use them, syntax is a little different on Unices.

"fatcow" is a reference to QCOW. It should read "SkinnyCow"- qcow is compressed. MOO.


VMDK conversion is only necessary for VBox. 
QEMU doesnt care and snapshots are a "PITA console command" with QEMU- so be aware of this.



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
QEMU is easier to "hack" as it were.

Win XP was the exception for my MD drive but with usb passthru(doesnt work w VBox) this shouldnt be a problem anymore.
(lsusb -v to get the MiniDisc vendor ids for qemu, WILL NOT work for VBox, works with VMWare)

Im running the following:

		AMD 4300 4GHZ QUAD CORE
		QUAD RADEON HD 7850s (not always running all four)
		RX 550
		16GB RAM
		GIGABYTE UDER board(v3?)
		
Ive gotten the following OSes into a VM (and sortof) smoothly running:

Microsoft actually allows "testing" in a VM "for eval purposes". 
OS Keys are less of a problem with a VM until you "push to real hardware" via dd (and a RAW formatted HDD file).

			Dos/FreeDos (VBox)
			Win2 (VBox)
			Win3 (VBox)
            
These have zero driver support. Especially video. 486 Hardware is getting hard to find.

            Win95 -being tested- (QEMU)
			Win98 -needs help- (VBox only)
            WinME
            Win2K

Watch the CDROM issue with QEMU

			WinXP  (VBox/QEMU)

These two are provided as TESTING from Microsoft to "test IE" with:

            Win7(VBox)
            Win8(VBox)

            https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/
            (has a 90 day expiring demo key)

            These are "Tarballed" .ova files containing a PC and Disk Drive. 
            ("Import appliance" inside VBox)

My installs are either "pulls from real computers" or "fresh installs".


			SuSe (Vbox and QEMU/ KVM)
			Ubuntu(MATE) (VBox , v18 w VFIO )
			Fedora (Twenties) (VBox, testing VFIO)
			OS2 Warp (VBox) ^ Rare ^

            BeOS /Haiku (VBox)
            CentOS 7  (VBox)
            (RHEL w "community support" instead of "RH support" -its like Debian "server edition")
			
			Win10(QEMU/KVM VFIO or VBox without it)
			
			Mac OS8 (Sheepshaver/Basillisk)
			Mac OS9.0.4(Sheepshaver)
			Mac OS9.2.2(QEMU ppc)
			
            Mac OSX 10.4 Tiger(PPC on QEMU, intel being tested)
            (in between numbers are being tested or have "known issues preventing VM-u-lation")

			OSX 10.6 Snow Leopard(VBox and QEMU/KVM x86 mode)
			OSX 10.12 Sierra(QEMU/KVM, tweaked -noVFIO yet, need modded KEXTs to support the "video output ports")
            OSX Mojave is possible- I dont have the updater image at the moment.

Older systems such as 8088/386/486 with Win95/Win98 seems to be working as of the code found here.
(Maybe in some form this can be merged into the QEMU tree?)

https://pcem-emulator.co.uk/


There are loads of other unices QEMU or VBOX drives posted online. DO LOOK AROUND.
(These are Gentoo, BSD(open/free/etc), Debian....etc.)

Win95/98 may need to be floppy booted or made into a bootable CD.
Making a bootable CD is not hard to do on Unices with the "right scripts".
You need mkisofs to do "its magic".

        This said booting from or working with "raw" floppy disk images seems to be a PITA
        This presents problems that dont exist with real hardware.

I suggest in this case- using a "floppy usb drive" and a "real floppy disk".


NT hasnt been tested because its server/workstaion archetecture. Some report success.

---

The focus is on "PCs at HOME"

my journey started awhile ago..YMMV. 

Whether yours is short or very long is up to you.
The OSes you keep in you NAS are your business,not mine.



