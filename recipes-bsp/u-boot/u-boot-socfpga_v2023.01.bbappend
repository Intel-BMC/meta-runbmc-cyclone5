FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRCREV = "0fa4e757b5b31173f3e063430d72ef2ff30412b2"

SRC_URI += " \
	file://0001-CycloneV-RunBMC-board-support-added.patch \
	file://0002-disable-zlib-and-gzip.patch \
"

DEPENDS:append = " srecord-native"

# Add u-boot.img and u-boot-spl.bin to deploy directory.
# u-boot-spl.mif is used for FPGA On-Chip Memory initialization in Quartus.
# u-boot.img can be uploaded to RAM via serial y-modem in SPL.
do_deploy:append() {
	install -m 644 ${B}/u-boot.img ${DEPLOYDIR}
	install -m 644 ${B}/spl/u-boot-spl.bin ${DEPLOYDIR}
	srec_cat ${B}/spl/u-boot-spl.bin -binary -fill 0x00 0x0 0x10000 -bs 8 \
		-o ${DEPLOYDIR}/u-boot-spl.mif -mif 64 -obs 8
}

PROVIDES += "u-boot"
