FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LINUX_VERSION = "5.15.80"
SRCREV = "897703f72ab30d27aeb5e5c60479e349b2dee307"

SRC_URI += " \
	file://runbmc-cyclone5.cfg \
	file://cyclone5_runbmc.dts;subdir=git/arch/arm/boot/dts \
	file://0001-altera-i2c-fixes.patch \
	file://0002-hwmon-max31790-add-fanN_enable.patch \
"
