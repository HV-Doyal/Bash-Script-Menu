#!/bin/bash

# Include the required scripts
source system_info.sh
source sys_cfg_menu.sh

# Define the system_config function
system_config() {
    # Loop until the user selects "Exit"
    while true; do
        # Display the main menu using dialog
        choice=$(display_menu)
        
        # Process the user's choice
        case $choice in
            [1-5])
                case $choice in
                    1)
                        info=$(get_os_type)
                        ;;
                    2)
                        info=$(get_cpu_info)
                        ;;
                    3)
                        info=$(get_memory_info)
                        ;;
                    4)
                        info=$(get_disk_info)
                        ;;
                    5)
                        info=$(get_filesystem_info)
                        ;;
                    *)
                        ;;
                esac
                dialog --backtitle "System Configuration" --msgbox "$info" 20 80
                ;;
            6)
                dialog --backtitle "System Configuration" --msgbox "Exiting..." 8 40
                break
                ;;
            *)
                ;;
        esac
    done
}
