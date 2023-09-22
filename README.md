This repository contains reference implementation of Yocto BSP layer used to build OpenBMC\* distribution for Intel® Cyclone® V RunBMC\* card.<br />
The layer is provided as an example build of OpenBMC* for the card and is not tied to any specific platform. 

Security note: This repository does not provide any implementation of secure boot to verify integrity of BMC image loaded into Intel® Cyclone® V RunBMC* card. 

# Setting up build enviroment 

Clone Intel-BMC/openbmc
```
git clone https://github.com/Intel-BMC/openbmc.git
```

Clone meta-intel-fpga into the 'openbmc' folder
```
cd openbmc
git clone https://git.yoctoproject.org/meta-intel-fpga
```

Clone meta-runbmc-cyclone5 into the 'meta-openbmc-mods' folder
```
cd meta-openbmc-mods
git clone https://github.com/Intel-BMC/meta-runbmc-cyclone5
```

# Building OpenBMC distrubtion
Run these commands from the root of Intel-BMC/openbmc:
```
export TEMPLATECONF=meta-openbmc-mods/meta-runbmc-cyclone5/conf/templates/default
source ./oe-init-build-env
bitbake intel-platforms
```

# Build artifacts
OnChip Memory initialization file for CycloneV Quartus project:
```
u-boot-spl.mif
```

---
eMMC provisioning files over TFTP using `mmc-factory-init` u-boot macro:
```
u-boot.img
image-kernel.ext4
image-rofs.ext4
```
`u-boot.img` is additionally awaited by SPL over YMODEM serial protocol when eMMC boot partition is not programmed.

---
Tarball for firmware update over Redfish or WebUI:
```
intel-platforms-runbmc-cyclone5.ext4.mmc.tar
```
