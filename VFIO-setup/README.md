ONCE modified to your config (assumes amdgpu/rx550 ven/pci ids for VFIO) copy these into place via:

		sudo cp -R * /

sudo update-grub
sudo update-initramfs -u

-reboot-

Details on the main README.

These are the files you change for Unbuntu/Debian (and possibly Fedora).

there one thing I forgot to mention here:

	some OSes still seems to be xchi/IOMMU bugged(AMD). copy grub boot vars verbatim.
	
	rc.local calls vfio binding function(once per boot). If you want to muck w unbinding and rebinding- YOU -DO- IT.
	I find that it mucks up the KVM/QEMU VFIO experience.
	If you only bind once per boot- you can reboot the VFIOd VM no problem. NOT THE CASE otherwise.
	however- you will not regain control of the stubbed or vfio video card.

	Its not that your card is OLD- its that you "bound it all up". If I can do this with a Rx500 and 7850 under ubu16 and 18-
	you can do it too.
