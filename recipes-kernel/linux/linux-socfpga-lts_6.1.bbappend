FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRCREV = "e36e7a90783f05a2f877c75d9f8e2725e87cb9f4"

SRC_URI += " \
	file://runbmc-cyclone5.cfg \
	file://cyclone5_runbmc.dts;subdir=git/arch/arm/boot/dts \
	file://0001-altera-i2c-fixes.patch \
"
