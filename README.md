# Shell Scripting Projects 🚀

This repository contains three shell scripting projects designed for system monitoring and automation. These scripts help in monitoring RAM and disk space, sending alerts, and archiving old logs.

---

## 📌 Project 1: Monitoring Free RAM Space 🖥️

### 📝 Description
This script monitors the available RAM space and gives a warning if it falls below a specified threshold.

### 📜 Script
```bash
free_space=$(free -mt | grep "Total" | awk '{print $4}')  # Fetch free RAM memory
min_ram=500   # Minimum RAM threshold

if [[ $free_space -lt $min_ram ]]  # Compare free RAM with the threshold
then 
    echo "WARNING: RAM is running low!"
else
    echo "RAM Space is sufficient - $free_space MB"
    echo "RAM Space is sufficient - $((free_space/1024)) GB"
fi  
```

### 🛠️ How It Works
- Retrieves available RAM using the `free -mt` command.
- Compares the available RAM with a predefined minimum value.
- Displays a warning if RAM is below the threshold.

---

## 📌 Project 2: Monitoring Free Disk Space & Sending Alert Email 💾📩

### 📝 Description
This script monitors disk space usage and sends an email alert if the available disk space drops below a specified threshold.

### 📜 Script
```bash
#!/bin/bash

# Store the disk usage information
disk_info=$(df -h | grep "nvme0n1p6")

# Extract values
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
if [[ $available_disk_percentage -lt 10 ]]; then
    echo -e "Subject: Disk Space Alert!\n\nWARNING: Disk space is low!" | sendmail $To
    echo "Alert email sent!"
else
    echo "All good 👍"
fi
```

### 🛠️ How It Works
- Fetches disk usage details using `df -h` and filters the required partition.
- Extracts total, used, and available disk space.
- Sends an email alert if the available disk space falls below 10%.

---

## 📌 Project 3: Archiving Older Logs 📂📦

### 📝 Description
This script finds and compresses log files larger than 20MB and moves them to an archive folder.

### 📜 Script
```bash
#!/bin/bash

# Variables
Base=directory_location
Days=10
Depth=1
Run=0

# Checking if directory exists
if [ ! -d $Base ]; then
    echo "Directory does not exist: $Base"
    exit 1
fi

# Create 'archive' folder if not present
if [ ! -d $Base/archive ]; then
    mkdir $Base/archive
fi

# Find and archive files larger than 20MB
for i in $(find $Base -maxdepth $Depth -type f -size +20M)
do
    if [ $Run -eq 0 ]; then
        echo "[$(date "+%Y-%m-%d %H:%M:%S")] Archiving $i ==> $Base/archive"
        gzip $i || exit 1
        mv $i.gz $Base/archive || exit 1
    fi
done
```

### 🛠️ How It Works
- Checks if the target directory exists.
- Creates an archive folder if not already present.
- Finds files larger than 20MB, compresses them using `gzip`, and moves them to the archive.

---

## 📌 How to Run the Scripts
1. Copy and paste the respective script into a `.sh` file (e.g., `monitor_ram.sh`).
2. Give execution permission using:
   ```bash
   chmod +x script_name.sh
   ```
3. Run the script using:
   ```bash
   ./script_name.sh
   ```

---

## 📢 Contributing
Feel free to modify, improve, or expand these scripts! If you have suggestions, open an issue or submit a pull request. 🚀

---

## 📝 Author
Kumar Swamy Technologies  
📧 Email: yarramneedikumarswamy@gmail.com
💼 GitHub: github.com/kumarswamy2025/

---

## 📌 Happy Coding! 🚀
