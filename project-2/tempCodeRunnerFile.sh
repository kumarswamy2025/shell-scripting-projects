#!/bin/bash

# Store the disk usage information in a variable
disk_info=$(df -h | grep "nvme0n1p6")

# Extract relevant values
total_disk_space=$(echo "$disk_info" | awk '{print $2}')
used_disk_space=$(echo "$disk_info" | awk '{print $3}')
available_disk_space=$(echo "$disk_info" | awk '{print $4}')
available_disk_percentage=$(echo "$disk_info" | awk '{print $5}' | tr -d '%')  # Remove '%' from percentage

To="kumarswamytechnologies@gmail.com"

# Print disk info
echo "Total Disk Space: $total_disk_space"
echo "Used Disk Space: $used_disk_space"
echo "Available Disk Space: $available_disk_space"
echo "Available Disk Percentage: $available_disk_percentage%"

# Check if available disk space is below 10%
if [[ $available_disk_percentage -lt 155 ]]; then
    echo "WARNING: Disk space is low!" | mail -s "Disk Space Alert!" $To
else
    echo "All good 👍"
fi
