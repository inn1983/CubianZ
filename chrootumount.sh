#!/bin/bash

ROOTFS_DIR='./rootfs/argon-armfs'

umount -l $ROOTFS_DIR/dev/pts
umount -l $ROOTFS_DIR/dev
umount -l $ROOTFS_DIR/proc
umount -l $ROOTFS_DIR/sys

