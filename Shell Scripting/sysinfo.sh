#!/bin/bash
# sysinfo.sh - System summary generator and process list logger.
# Displays host statistics and outputs active process records to a custom directory.

current_date=$(date)
hostname_val=$(hostname)
active_user=$(whoami)
disk_info=$(df -h / | awk 'NR==2 {print $5 " used of " $2}')
proc_count=$(ps aux | wc -l | tr -d ' ')

echo "=== System summary ==="
echo "Date        : $current_date"
echo "Host        : $hostname_val"
echo "User        : $active_user"
echo "Root disk   : $disk_info"
echo "Processes   : $proc_count running"
echo

echo "--- Disk usage (df -h) ---"
df -h
echo

echo "--- Top 10 processes by CPU ---"
ps aux | sort -rk 3 | head -n 10 | cut -c1-110
echo

read -p "Directory to save the report in: " report_dir
read -p "Report file name: " report_file

mkdir -p "$report_dir"
touch "$report_dir/$report_file"

# Write detailed process list to target file using stdout redirection
ps aux > "$report_dir/$report_file"

echo
echo "Saved $(wc -l < "$report_dir/$report_file" | tr -d ' ') lines of process data to $report_dir/$report_file"
