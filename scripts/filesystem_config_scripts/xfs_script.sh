#!/bin/bash

# Unmount filesystem
sudo umount /mnt/lv1

# Create XFS filesystem
sudo mkfs.xfs -f /dev/vg1/lv1

# Mount the filesystem
sudo mount /dev/vg1/lv1 /mnt/lv1

