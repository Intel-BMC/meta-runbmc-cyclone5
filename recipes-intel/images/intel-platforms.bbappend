IMAGE_FEATURES:remove = " obmc-host-ipmi"

IMAGE_INSTALL:remove = " \
        at-scale-debug \
        i3c-tools \
        lpc-cmds \
        multi-node-nl \
        smbios-mdrv2 \
        mtd-util \
        mtd-utils \
        mtd-utils-ubifs \
        host-error-monitor \
        peci-pcie \
        phosphor-ipmi-ipmb \
        phosphor-node-manager-proxy \
        preinit-mounts \
        nv-sync \
        phosphor-host-postd \
        obmc-ikvm \
"

# The shadow recipe provides the binaries needed by the phosphor-user-manager.
ROOTFS_RO_UNNEEDED:remove = "shadow"

# deploy files used by mmc-factory-init u-boot macro to provision eMMC
do_generate_ext4_tar:append() {
    install -m 0644 ${S}/ext4/boot-image.ext4 ${IMGDEPLOYDIR}/image-kernel.ext4
    install -m 0644 ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.ext4 ${IMGDEPLOYDIR}/image-rofs.ext4
}

# fix circular dependency after adding do_generate_ext4_tar to image
deltask generate_phosphor_manifest
addtask do_generate_phosphor_manifest after do_rootfs before do_generate_ext4_tar
