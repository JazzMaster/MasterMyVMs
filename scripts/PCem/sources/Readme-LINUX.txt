PCem v14 Linux supplement


You will need the following libraries :

SDL2
wxWidgets 3.x
OpenAL

and their dependencies.

Open a terminal window, navigate to the PCem directory then enter

./configure --enable-release
make

then ./pcem to run.

The Linux version stores BIOS ROM images, configuration files, and other data in ~/.pcem

  --enable-release-build --enable-networking --enable-alsa

The menu is a pop-up menu in the Linux port. Right-click on the main window when mouse is not
captured.

CD-ROM support currently only accesses /dev/cdrom. It has not been heavily tested.
