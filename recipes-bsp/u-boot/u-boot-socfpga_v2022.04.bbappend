FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRCREV = "639a1ac83230d569ce5c6ed9960e40fc52b4d7fe"

SRC_URI += " \
	file://0001-CycloneV-RunBMC-board-support-added.patch \
	file://0002-disable-zlib-and-gzip.patch \
"


# Add u-boot.img and u-boot-spl.bin to deploy directory.
# u-boot-spl.bin is used for FPGA OnChipMemory initialization.
# u-boot.img can be uploaded to RAM via serial y-modem in SPL.
do_deploy:append() {
	install -m 644 ${B}/u-boot.img ${DEPLOYDIR}
	install -m 644 ${B}/spl/u-boot-spl.bin ${DEPLOYDIR}
}

PROVIDES += "u-boot"
