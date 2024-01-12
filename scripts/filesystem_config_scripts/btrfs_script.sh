#!/bin/bash

# Unmount filesystem
sudo umount /mnt/lv1

sudo mkfs.btrfs /dev/vg1/lv1

# Mount the filesystem
sudo mount /dev/vg1/lv1 /mnt/lv1

echo the new filesystem is btrfs
