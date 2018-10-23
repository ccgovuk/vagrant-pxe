#!/bin/bash

### DHCPD configuration
apt-get install -y isc-dhcp-server
cp /config/resources/dhcpd.conf /etc/dhcp/dhcpd.conf
cp /config/resources/isc-dhcp-server /etc/default/isc-dhcp-server
systemctl restart isc-dhcp-server

### TFTPD configuration
apt-get install -y tftpd-hpa
cp /config/resources/tftpd-hpa /etc/default/tftpd-hpa
mkdir /tftpboot
cp -R /config/resources/pxelinux.cfg /tftpboot
cp -R /config/resources/syslinux /tftpboot
cp /config/resources/pxelinux.0 /tftpboot
systemctl restart tftpd-hpa

### PXE configuration
apt-get install -y pxe
