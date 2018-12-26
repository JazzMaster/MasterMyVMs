This is what I have so far-
    In a more acceptable format for the shitload of OSes I emulate-
        there may be more I emulate that arent here.
    I would be glad to demo your OS and report back to you the result or a screenshot(qxl driver).
    (under VFIO this looks like an actual PC screen,unless shot w a phone camera)

    All of these here- have been tested, or install (and work) to some extent.
    Do NOT ask me for ROMS or HDD images. You need to make,dump, or find them.

QEMU:
    These are bash scripts to invoke qemu

    Ive included a howto on xqemu(xbox original emu)- although most hints are from "thier" pages.
        (This is what Ive cobbled together so far)

    Ive only included it because of the complexity involved. 
    It requires a Ton of stuff from a working (or previously working) xbox.

In case youre interested:
    PS1 is psx project
    PS2 on linux (pcsx2) lacks raw cdrom drive support.

THESE ARE VERY COMPLEX SYSTEMS:

    PS3 is rpcss project(partially backed by dumpHD progress).
    Wii is dolphinEMU(need a PC usb wii bar-and usb controller addon for gamecube)
        This is a "unlocked/hacked Wii" being emulated.

    Wii-U is cemu(windows only)
    x360 emu is claimed but I cant seem to find a working emu- even in beta(and I HAVE LOOKED).
        This is complicated by boot keys needed(RGH mod). 
        Some sort of this is bypassed w xbox-o- to some extent.

    (Nothing more current can be ported)

LibVirt(virt-manager app):
    configure these as normal given these paramenters. bash scripts are easier to read than XML.
    stores files in weird places- so backing them up is a bitch.

Virtualbox:
    No appliances here, sorry(GH limit).
    No VDI images or VMDK images either.
    VMDK is only needed for OSX Leopard- and support is dodgy in QEMU.

PCem:
    Picks up where QEMU lacks in <Pentium support. Not without issues.
    Right click a running instance to get the options "shown online in windows" with the now missing menubar.

VBox, libVirt(virt-manager) and VMWare PCs in some instances need to be hacked.
QEMU PCs do not- params are in the scripts. Learn how to hack these yourself, or work w QEMU.

Basilisk and sheepShaver are for older Macs. (8-9.0.4)
(Use QEMU for 9.2.2)

---
As a nice side bonus one can raw WRITE and READ from an actual drive....clone zilla without the monster.
You can import your current PC into a VBox this way and is in fact what I have done with 7. 

OUTPUT FILE IS GY-NORM-US! 
DO convert the imported drive to qcow if possible and stop wasting unneeded bytes(or drives).
dont forget to run "zerofree" when you do this.

---

Theres a few games that wont work under vfio, but not all.

(avoid valve games if possible, steam where necessary- 
    most titles are on the console platforms if they are worth a damn. 
ARC titles are porting to PlayOnLinux.)


QEMU has a nice bonus:
    IOMMU + KVM + VirtIO (take real hardware and give it to a BOX) but its a bitch to setup 
    KVM/ VIRTIO+IOMMU help tre-men-dously!!!

(these are post winxp OSes usually.)

xp can be a bitch- (keys are a timer expire-you cannot activate at this time thru online.)
    xp doesnt like virtIO, nor kvm
    [need xp for the NetMD]


Tweaks:
    7+ want HyperV, not KVM "hints"
    OSX past 10.4 wants INTEL HW, not PowerPC. 
    10.5 was designed for G5 and above, not below.
 
unices could be kerneled over themselves- (Its a neat hack and I havent figured it out yet)

Solid state performance is better- 
    faking a SSD doesnt negatively affect performance. I have all of mine on a usb3 drive.


