#!/bin/sh

# Run after buildroot has built the image, and path to the built
# output/image dir is passed as first arg.  We copy the built ISO
# out of the container.
cp ${BINARIES_DIR}/rootfs.iso9660 /build/v86-linux.iso
echo "Created v86-linux.iso."

# Prepare license info. Start with Seabios, then buildroot's
wget https://raw.githubusercontent.com/coreboot/seabios/master/COPYING.LESSER \
    -O ${BASE_DIR}/SeaBIOS_COPYING.LESSER
tar czvf /build/licenses.tar.gz \
    ${BASE_DIR}/SeaBIOS_COPYING.LESSER \
    ${BASE_DIR}/legal-info/buildroot.config \
    ${BASE_DIR}/legal-info/host-licenses \
    ${BASE_DIR}/legal-info/licenses
echo "Created licenses.tar.gz"

# Download pulsar
mkdir /pulsar
chmod g+w /pulsar
wget -O apache-pulsar-2.10.2-bin.tar.gz "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=pulsar/pulsar-2.10.2/apache-pulsar-2.10.2-bin.tar.gz"
tar -xzvf apache-pulsar-2.10.2-bin.tar.gz
mv apache-pulsar-2.10.2 /pulsar