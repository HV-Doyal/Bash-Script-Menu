#!/bin/bash

# Function to display the main menu
display_menu() {
    dialog --backtitle "System Configuration" --title "Menu" --menu "Select an option:" 25 60 6 "${options[@]}" 2>&1 >/dev/tty
}

# Main menu options
options=(
    1 "Operating System Type"
    2 "CPU Information"
    3 "Memory Information"
    4 "Hard Disk Information"
    5 "File System"
    6 "Exit"
)
