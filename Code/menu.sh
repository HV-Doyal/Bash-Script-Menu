#!/bin/bash

# Sourcing necessary scripts
source system_config.sh
source calender.sh
source Date_and_time.sh
source stop.sh
source delete.sh

###################### MENU CALLING DIFFERENT FUNCTIONS ####################
menu() {
    while true; do
        reply=""
        dialog --backtitle "Bash Dialog Menu" --title "Menu" --menu "Choose an option: " 25 60 5 \
            A "Display Date and Time" \
            B "Calendar" \
            C "Delete" \
            D "System Information" \
            E "Exit" 2>respond
        read -r reply < "respond"
        case $reply in
            A)
                show_date_and_time
                ;;
            B)
                calendar
                ;;
            C)
                delete
                ;;
            D)
                system_config
                ;;
            E)
                stop
                ;;
        esac
    done
}
