#!/bin/bash

##################### TO SHOW CALENDAR FUNCTION ########################
calendar() {
    dialog --calendar "Select a date" 0 0 2>respond
    calendar_choice=$(<"respond")
    if [ -z "$calendar_choice" ]; then
        calendar
    else
        dialog --menu "OPTIONS" 20 40 3 1 "Show reminder" 2 "Add reminder" 2>respond
        options=$(<"respond")
        if [ "$options" -eq 1 ]; then
            show_reminder
        fi
        if [ "$options" -eq 2 ]; then
            add_reminder
        fi
    fi
}

########################## To add a reminder #############################
add_reminder() {
    dialog --title "Notes" --inputbox "Enter text to be reminded" 40 40 2>temp_reminder
    reminder_text=$(<"temp_reminder")
    
    # Remove newlines and leading/trailing whitespaces
    reminder_text=$(echo "$reminder_text" | tr -d '\n' | awk '{$1=$1};1')
    
    # Append reminder to file
    echo "$calendar_choice $reminder_text" >> reminder
    rm temp_reminder
}

########################## To show reminder #######################
show_reminder() {
    dialog --textbox reminder 40 40
}
