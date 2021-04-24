#!/usr/bin/env bash
set -euo pipefail

sgdisk -n3:1M:+512M -t3:EF00 $DISK
sgdisk -n1:0:0 -t1:BF01 $DISK

echo "Creating a ZFS setup on ${DISK}"
zpool create \
    -o ashift=12 \
    -o altroot="/mnt" \
    -O mountpoint=none \
    -O encryption=aes-256-gcm \
    -O keyformat=passphrase \
    -O atime=off \
    -O compression=lz4 \
    -O xattr=sa \
    zroot $DISK

zfs create -o mountpoint=legacy zroot/root
zfs create -o mountpoint=legacy zroot/root/nixos
zfs create -o mountpoint=legacy zroot/home

mount -t zfs zroot/root/nixos /mnt
mkdir /mnt/home
mount -t zfs zroot/home /mnt/home

mkfs.vfat $DISK-part3
mkdir /mnt/boot
mount $DISK-part3 /mnt/boot
