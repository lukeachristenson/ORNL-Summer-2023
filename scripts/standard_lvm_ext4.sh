#!/bin/bash

# Define mount point
MOUNT_POINT="/mnt/lv1"

# Check if filesystem is mounted
if mountpoint -q $MOUNT_POINT; then
    # Unmount filesystem
    sudo umount $MOUNT_POINT
fi

# Check if logical volume exists
if lvdisplay /dev/vg1/lv1 &>/dev/null; then
    # Remove logical volume
    sudo lvremove -y /dev/vg1/lv1
fi

# Check if volume group exists
if vgdisplay vg1 &>/dev/null; then
    # Remove volume group
    sudo vgremove vg1
fi

# Check if physical volumes exist and remove them
for pv in / /dev/nvme10n1 /dev/nvme11n1; do
    if pvdisplay $pv &>/dev/null; then
        sudo pvremove $pv
    fi
done

# Create physical volumes
sudo pvcreate / /dev/nvme10n1 /dev/nvme11n1

# Create volume group
sudo vgcreate vg1 /dev/nvme10n1 /dev/nvme11n1

# Create logical volume
sudo lvcreate -l 100%FREE -n lv1 vg1

# Create filesystem
sudo mkfs.ext4 /dev/vg1/lv1

# Check if mount point directory exists
if [ ! -d $MOUNT_POINT ]; then
    sudo mkdir -p $MOUNT_POINT
fi

# Mount the filesystem
sudo mount /dev/vg1/lv1 $MOUNT_POINT

