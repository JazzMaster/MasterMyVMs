copy these to you appropriate /etc folders and modify them to match your "rig" config.
Details on the main README. The link is for ARCH- but follow along.

These are the files you change for Unbuntu/Debian (and possibly Fedora).

there one thing I forgot to mention here:

	some OSes still seems to be xchi/IOMMU bugged(AMD). copy grub boot vars verbatim.
	
	rc.local calls vfio binding function(once per boot). If you want to muck w unbinding and rebinding- YOU DO IT.
	I find that it mucks up the KVM/QEMU VFIO experience.
	If you only bind once per boot- you can reboot the VM no problem. NOT THE CASE otherwise.

	Its not that your card is OLD- its that you "bound it all up". If I cna do this with a Rx500 and 7850 under ubu16 and 18-
	you can do it too.
