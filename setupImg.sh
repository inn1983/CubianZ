#!/bin/bash -x

dd if=/dev/zero of=${1} bs=1M count=2048
sync

#Attaching ${1} to loop device
ARMSTRAP_DEVICE=($(losetup -f --show "${1}"))

#Creating new MSDOS label
parted ${ARMSTRAP_DEVICE} --script -- mklabel msdos

#Creating a partition using remaining free space 
parted ${ARMSTRAP_DEVICE} --script -- mkpart primary ext4 1 -1

#Probing for partitions changes
partprobe ${ARMSTRAP_DEVICE}

sync
losetup -d ${ARMSTRAP_DEVICE}

  while [ $? -ne 0 ]; do
    sleep 10
    syncFS
    losetup -d ${ARMSTRAP_DEVICE}
  done

