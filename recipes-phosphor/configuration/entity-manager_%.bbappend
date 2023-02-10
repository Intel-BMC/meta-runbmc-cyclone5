FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

SRC_URI:append = " \
    file://RunBMC-Cyclone5.json \
    file://blacklist.json \
    "

do_install:append(){
     install -d ${D}/usr/share/entity-manager/configurations
     install -m 0444 ${WORKDIR}/RunBMC-Cyclone5.json ${D}/usr/share/entity-manager/configurations
     install -m 0444 ${WORKDIR}/blacklist.json ${D}/usr/share/entity-manager
}
