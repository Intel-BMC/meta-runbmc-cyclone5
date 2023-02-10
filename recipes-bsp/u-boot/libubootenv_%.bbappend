FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://fw_env.config"

do_install:append() {
        install -d ${D}${sysconfdir}
        install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/

        # some OpenBMC apps expects binaries in /sbin which is not default
        # for this package - create symlinks
        install -d ${D}${base_sbindir}
        ln -sr  ${D}${bindir}/fw_printenv ${D}${base_sbindir}/fw_printenv
        ln -sr  ${D}${bindir}/fw_setenv ${D}${base_sbindir}/fw_setenv
}
