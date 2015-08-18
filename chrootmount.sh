#!/bin/bash

ROOTFS_DIR='./rootfs/argon-armfs'

mount --bind /dev $ROOTFS_DIR/dev
mount --bind /dev/pts $ROOTFS_DIR/dev/pts
mount --bind /proc $ROOTFS_DIR/proc
mount --bind /sys $ROOTFS_DIR/sys

#LC_ALL=C LANGUAGE=C LANG=C chroot --userspec=zuiki:zuiki $ROOTFS_DIR
#LC_ALL=C LANGUAGE=C LANG=C chroot $ROOTFS_DIR
