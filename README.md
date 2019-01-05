# MasterMyVMs

Instructions on "VM-ing everything" and howto


-Yet another not-quite-technically code repo, but since others do similar.....


What is here is detailed instructions (for demo purposes) on how to 

        clone-rescue
        clone-restore
        use VM trick and techniques to snapshot real OSes with REAL HARDWARE
        and how to simulate as many OSes as possible, albeit not at the same time.

#### What is VFIO? 
VFIO stands for "Virtual Function I/O".
VFIO is a device driver that is used to assign (reaal) devices to virtual machines. 
One of the most common uses of vfio is setting up a virtual machine with full access to a dedicated GPU.
(which is what were doing)


No VALVE- we arent cheating, "most of us..", this HELP us in everyday life.
(I guess you guys like to waste another $1300 on another PC....)

Some got it working on ARCH-Linux....
**I got it working on Ubuntu**

[ARCH HOW-TO](https://bbs.archlinux.org/viewtopic.php?id=162768)


[Ubuntu 16 virtmanager XML](https://ycnrg.org/vga-passthrough-with-ovmf-vfio/)

My scripts use QEMU straight- I find KVM/virt-manager can be a R-PITA.
It also stores files(hidden) in XML format.


Skippage CDROM access? 

		It might be your OS(ubu 18). LG BDROMs get buggy with 18.


VM (PC apps):

        VMWare (HOME or eval edition player)
        VirtualBox(5.2+)
        Basilisk /Sheepshaver 
        QEMU(3.0)
        libVirt(KVM to QEMU hooks)
        virt-manager(UI to libVirt)

You WILL NOT most likely have KVM(KQEMU) or libVirt on WINDOWS. 
Real MacOSX machines may be able to build this- I DONT KNOW.

I could not get PearPC to avoid "triple-fualt" crashing.
Basilisk and Sheepshaver code changes too much to be posted here.

Macs need BLuetooth(emu or real) on modern macs and "serial ports" on older ones.
(This is part of the problem with emulating OSX 10.2,3 and 4)


Virtualbox, QEMU, and libVirt(kernel) are in the repoes for your UNICE OS somewhere.  
However, they are very old- so build them.  

QEMU is on the main website, libvirt is HERE. 
I did this because files are hard to find.

You are on your own to look for ROM files for sheepshaver and basilisk-

        but theres enough copies floating around that work.

### CDs? Disks?

UH YEAH---PCs need these.... lol

You will have to download at least an ISO. 
Burning (to disc) is your option.

So what if you dont have one?

        Try the Internet Archive
        Some other "non-torrent sites" have the ISO. Use google.
        Google for some Linux you might want to try. HINT: debian,fedora....THEY GIVE YOU THE ISO.
        If you want to waste your money- go find a store selling computers. The software is called an "OS".
    
"Boot Floppies" may be needed.
CDROM and HDD is a requirement.

If you learned anything in "COMPTIA A+ plus" class- it is applied HERE.
Most def - with PCem.

Formatting is "VIRTUAL" (if you do it correctly). 
You arent partitioning "physically" anything.

This said:

        YOU are responsible for your data and if you hook up an ACTUAL DISK, PLEASE BE CAREFUL.
        You are given the option to do so- and it clearly works.

**DATA DAMAGE NOTE:**

        never "dd a RAW DISK" (of any sort) unless you "know what you are doing" and the drive is VERIFIED as the "right one".

PCem note:

		This was a nice little GEM- shame QEMU is so much a PITA to submit things to---would fill a huge gap.
		1- ROMs are findable(google them) but dont come with the sources
			Even QEMU comes with ROMs- I dont see the issue on "abandoned hardware".
		
		2- you can use "the fork for windows"(x86Emu) ROMs and they work with PCem (yay-VGA!)
			(I would still advise backporting the changes in the sourcecode and rebuilding)
		
		3- crack out the old textbooks(or dig thru your memory banks) because this is as "real" as it gets. LOL
			Pentium award bios seems to break or be lacking. CDROM booting is OUT. Large HDDs are OUT.
		
		4- although I havent fully tested Win9x,ME,NT- they should work fine.
		5- a USB floppy drive *MAY* help here....sadly they only make 3 1/2 inch..
		6- these systems are ancient!! 8088-486DX (w Pentium overdrive) so dont "expect much"
		(These were mostly PRE-Windows and PRE-INTERNET ERA PCs.)
		
		7- The DOS Hard Disks "may yet mount in Linux", skipping over the partition table data (as FAT disks)
		8- most had CDROM drives, (not CDRW drives) in them-dont expect the ability to burn a CD,let alone DVD.
		9- CDROMs were considered THE NEW TAPE DRIVE- the ERA of TAPE, even CASETTE, had ended. Hard disks were SMALL.
		As a result- most multimedia was left on read-only CDROMs
		CDROMs and AudioCDs were still prone to failure, much like floppy (and hard) disks but "in optical ways"
		(amazing-nobody has emulated THAT...)
		
		10- Data transfers were suboptimal. Again, dont expect much. (Nobody really cared about speed.)
		(We are talking 1980-1999 era PCs here.)

### Processors

I use siulated core2duo or Penryn, (the upgraded one) most of the time.

VBox will use "host" by default, so if youre having problems you will most likely have to hack the vm file.
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
        Correct UEFI GUEST BIOS (more on this in a minute) -TianoCORE OVMF files
        UEFI (64 bit) installed guests(inside the VM). These MUST BE 64BIT UEFI BOOTABLE.
			There are loads of images that boot 32bit but are 64 bit installed. WRONG METHOD.
			If this is the case- you MUST REINSTALL the OS. It MUST BOOT THRU UEFI.

(Maybe its a UEFI passthru hardware glitch in PCI code??)

You need more than one:

         video card
         mouse
         keyboard(different vendor ID/manufacturer)
         screen(how much better to see it working)

-The rest is virtual

Dont blame me for "lockups" when QEMU "eats your first mouse and keyboard" thru VFIO.
(its supposed to-thats not a lockup, its "usb redirection" at work)

These methods should work for you, with some caveats noted in other places of the web.
One-shot deals usually indicate keyboard and mouse not reconfigured post install
	-or-
Too much/not enough VFIO binding at play.
(/etc/rc.local is your friend.)

Fix the problem, reboot the physical machine, and try again.


## UEFI BIOS files:

(These are open source, dont worry)

        There is a working set for 7/10 and ANOTHER working set for Sierra+
        There appears to be yet another set for ARM arch. (I have only gotten RasPi to work)

I have sorted out this mess for you. DO NOT MIX THESE UP- you will get similar response as my 7850 image....
When you use the correct file- this goes away and the device "just works" in VFIO mode.
Your VFIO card driver will catch the first- and then every time thereafter- if VFIO hangs- reboot the physical machine.

Even said, you might need to use QXL/virtio in QEMU on occasion. 
QXL is primarilty used as a loopback video device- especially when in VFIO mode.
	
If your VRAM in the OS is greater than 64MB- most likely above 256MB(in my case 4G), you DID THIS RIGHT.
You just might want to remove the QXL and switch to the "normal driver".

AMD RADEON NOTE:
	some OSes required signature enforcement or refuse to install with supported hardware
	and require manual intervention- but still turnover VFIO no problems.

### Sound

	Sound is dodgy and may or may not work. SORRY.
	Its more of a QEMU thing. libVirt can fix this on 32bit OSes.
	
        UEFI issue w TianoCore?
		audio QEMU build settings? (testing, I have sources)

    This said:

        If you are using a 64bit OS, you should be using VFIO and have available to you (as passthru)- the video cards audio chip.
        (Hookup a TV or projector instead of a PC monitor to bypass this issue)
		THIS WORKS WELL.

## Hardware Caveat:

You will probably have an AMD ROG or GIGABYTE board if using an AMD-FX CPU.
(Most of the other mainboards are for INTEL or RYZEN or older AMD cpus)

You will find VM-u-lation "extremely difficult" if you use an outdated mobo and CPU combo.

Your host HAS TO SUPPORT the instruction set common to core2duo/penryn (and AMD ssev4) for this to work.
While some registers wont be supported due to compatibility(core2duo are not there on amd), most of them MUST BE SUPPORTED.
SIERRA and MOJAVE WILL NOT WORK OTHERWISE!!! (This is due to APPLE trying -and failing- to lock your CPU out)

AMD GIGABYTE UD3R (verison X,Y,Z): 
(not "officially supported" to run linux- use iommu=soft and "disable iommu in bios" to get it going)

#### When you want VFIO:

        Turn IOMMU on in the bios

THEN pay close attention to GRUB boot options as indicated in the VFIO files.

USB3 / IOMMU will not work correctly if you use the stock 'iommu=on' option on these board(s).
The software option in GRUB doesnt enable VFIO correctly "but will boot".


ROG motherboards: 

        **I cant get the thing to reliably boot linux properly. ** Manufacturer doesnt care.
		If you find out how- let me know.
		(Replace the motherboard)
		
Apple:

		Pre OSX (High Sierra now) devices are abandonded by Apple.

You are "supposed to" run OSX on OSX compatible hardware like a 'mac mini or Pro tower'. 
(Non-fake) SMC keys are embedded in apple products and youre 'not supposed to distribute them'.
-Thats what APPLE says.

		(There is a FAKESMC kernel extension. You can use the keyDUmper source code if you like)
		HINT: its an "ENGLISH sentence warning" with copywright notice embedded in an "ISA device"
		(if you see this- you have a osmc key dumped correctly)

QEMU:  
        
        Intel-VT and MSR warnings can be  ignored.
        High Sierra and Mojave are supported (if your AMD CPU is new enough or you are using relatively new INTEL-core i7? ).

I have no issues as of yet emulating Mojave with my AMD FX CPU, it has on-die instruction support "above Mojave".
Cuss me out all you want INTEL folk- Im still effectually out-processing you and AMD OCTO core DO EXIST.
Thats why I had the ROG board at first.


### KEYS? Its asking me for keys!!

**DO NOT ASK ME ABOUT OS KEYS- YOU WERE "SUPPOSED TO BUY THE SOFTWARE"**

You may be able to google some working keys from yesteryear. 
HOWEVER, dont expect "activation of windows" to work using these keys.
(en mass install in corporate environment)

If I ship it is with keys stripped out.
There are legal reasons for this. 
Find your own (or hack in your own at your own risk)- I dont care -but leave my keys out of it.


DO not try to emulate (or VM) any of this while running your OS under a VM.
(A VM thru a VM doesnt work) 

Howver, do feel fre to try them at home under your OS of choice.

Do not be stupid with your chromebook and ask me(because it was freely given to you) where you can 
run live versions of this thru the internet. (Yes, theres ONE way to do this.)

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
		It will also bitch about being "experimental".

        The drive modding scrypts provided use VBox internals, so make sure the drives you are playing with this way are NOT in the
            list of "managed drives" inside VBox.
        You cannot convert a drive that is in your VBox internal list. It wont let you.    

## LibVirt

        The virtual computer data files are hidden and you have to use "certain commands" to edit them.
        I dont like this idea.

        There are undocumented mods to tweak qemu in places, such as sound.
 
		I will try to better document the storage locations. These are defined inside virt-manager "storage".
			$HOME/.local/share/libvirt/images is one location
			
		The xml files (.vbox) containing the PC information have to be pulled from virsh "in funky ways".	

### Setting up a hard disk

Note this is not RAW format, which is needed for bare-boned hard drives.

        You should not write anything but a raw file via dd to a physical drive, or try to read same from one.

This is an intermediary process and takes up loads of space--however, it works.

(My win7 VM was pulled from an "actual HDD in an eMachine".)

This is how you import a real disk:

        you read the RAW disk
        convert the RAW file to (qcow,vmdk,vdi)
        compact it (VBox or 'qemu-img -c' option)
        then run "zerofree" inside the VM to "shrink the drive". max size will be the "original drive capacity".
		you can always add another QEMU drive.
		you can always install/enable samba and add a network share(preferred)

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


I have not tested these with VMWare and my OS scripts have not used VMWare or "VBox hacks" which are floating around.
QEMU is easier to "hack" as it were.


Im running the following:

		AMD 4300 4GHZ QUAD CORE
		QUAD RADEON HD 7850s (not always running all four)
		RX 550
		16GB RAM
		GIGABYTE UDER board(v3?)
		
Ive gotten the following OSes into a VM (and sortof) smoothly running:

Microsoft actually allows "testing" in a VM "for eval purposes". 
OS Keys are less of a problem with a VM until you "push to real hardware" via dd (and a RAW formatted HDD file).

			Dos/FreeDos (VBox/DosEMU/DosBox/PCem)
            
These have zero driver support under QEMU or VMWare or VBox. 
PCem should support them very well(386-486-Pentium ERA).

			Win2 (VBox)
			Win3 (VBox)
            Win95 (VBOX -use speedhack disc above emulated Pentium 300 )
				(This is a known isue with BorlandAPI code in Crt.Delay function causing an overflow due to bad math)
            
			Win98  (VBox)
            WinME (VBox)
            WinNT v4 -Client/server (UNTESTED)
            Novell NetWare 5 "Server" (UNTESTED- Workstation was an add-on installer to NT)            
            
            Win2K "NT5.0" (VBox)            
			WinXP  (VBox/QEMU/VMware/virtManager)

If you are having CDROM issues-check a dd "dump" of it. 
Your drive might not be reading the disc correcty.


These two are provided as TESTING from Microsoft to "test IE" with:

            Win7(VBox/VFIO QEMU)
            Win8(VBox/VFIO QEMU)

            https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/
            (has a 90 day expiring demo key)

            These are "Tarballed" .ova files containing a PC and Disk Drive. 
            ("Import appliance" inside VBox)

			You can ignore the vbox file(setup yourself) and grab the .vdi file and convert it to QEMU
			
My installs are either "pulls from real computers" or "fresh installs".
(So in effect, paid for)

			SuSe (Vbox and QEMU w VFIO)
			Ubuntu(MATE) (VBox / v18 w VFIO )
			Fedora (Twenties) (VBox, testing VFIO)
			OS2 Warp (VBox/PCem?) ^ Rare ^

            BeOS /Haiku (VBox/PCem/QEMU) -There is a dual Intel/PPC image-
            CentOS 7  (VBox)
            RedHat v5 (QEMU/PCem) -Ancient
            (RHEL w "community support" instead of "RH support" -its like Debian "server edition")
			
			Win10(QEMU w VFIO/VBox)
			
			Mac OS8 (Sheepshaver/Basillisk)
			Mac OS9.0.4(Sheepshaver)
			Mac OS9.2.2(QEMU ppc)
			
            Mac OSX 10.4 Tiger(PPC on QEMU, intel being tested)
            (in between numbers are being tested or have "known issues preventing VM-u-lation")

			OSX 10.6 Snow Leopard(VBox and QEMU in x86 mode)
			OSX 10.12 Sierra(QEMU, tweaked -noVFIO yet, need modded KEXTs to support the "video output ports")
            OSX Mojave is possible- I dont have the FULL updater DMG image at the moment.

Older systems such as 8088/386/486 with Win95/Win98 seems to be working as of the code found here.
(Maybe in some form this can be merged into the QEMU tree?)

https://pcem-emulator.co.uk/

There are loads of other unices QEMU or VBOX drives posted online. DO LOOK AROUND.
(These are Gentoo, BSD(open/free/etc), Debian....etc.)

Win95/98 may need to be floppy booted or made into a bootable CD.
Making a bootable CD is not hard to do on Unices with the "right scripts".
You need mkisofs to do "its magic".

        This said booting from or working with "raw" floppy disk images seems to be a PITA under QEMU
        (This presents problems that dont exist with real hardware.)

I suggest in this case- using a "floppy usb drive" and a "real floppy disk".


NT hasnt been tested because its server/workstaion archetecture. Some report success.
Novell could possibly be tested- but it ws always DEMOWARE-now defunct and unsupported. (SuSE took over the project)

---

The focus is on "PCs at HOME"

my journey started awhile ago..YMMV. 

Whether yours is short or very long is up to you.
The OSes you keep in you NAS are your business,not mine.

-Best of Luck

