#!/bin/bash

# Function to get the operating system type
get_os_type() {
    grep -w "PRETTY_NAME" /etc/os-release | cut -d "=" -f 2 | tr -d '"'
}

# Function to get the CPU information
get_cpu_info() {
    lscpu | grep -E "Model name|Architecture|CPU(s):|Thread(s) per core|Core(s) per socket|Socket(s)"
}

# Function to get the memory information
get_memory_info() {
    free -h | awk 'NR==1{print "Total: "$2} NR==2{print "Used: "$3} NR==3{print "Free: "$4}'
}

# Function to get the hard disk information
get_disk_info() {
    df -h --output=source,size,used,avail | awk 'NR>1{print $1" ("$2")\nUsed: "$3"\nAvailable: "$4}'
}

# Function to get the file system information
get_filesystem_info() {
    mount | awk '{print $1" ("$5")"}'
}

# Function to display system information
show_system_info() {
    echo "Operating System:"
    get_os_type
    echo
    echo "CPU Information:"
    get_cpu_info
    echo
    echo "Memory Information:"
    get_memory_info
    echo
    echo "Hard Disk Information:"
    get_disk_info
    echo
    echo "File System Information:"
    get_filesystem_info
}
