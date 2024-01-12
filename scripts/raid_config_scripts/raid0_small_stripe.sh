#!/bin/bash

# Unmount filesystem
sudo umount /mnt/lv1

# Remove logical volume
sudo lvremove -ff /dev/vg1/lv1

# Remove volume group
sudo vgremove -ff /dev/vg1

# Remove physical volumes
sudo pvremove -ff /dev/nvme10n1 /dev/ nvme11n1

# Create physical volumes
sudo pvcreate -ff /dev/nvme10n1 /dev/ nvme11n1

# Create volume group
sudo vgcreate -ff vg1 /dev/ nvme10n1 /dev/ nvme11n1

# Create logical volume with RAID 0 and smaller stripe size
sudo lvcreate --type raid0 -I 4 -i 2 -l 100%FREE -ff -n lv1 vg1

