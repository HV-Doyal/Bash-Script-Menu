#!/bin/bash

delete() {
    # Use dialog to prompt the user for a path (file or folder)
    path=$(dialog --stdout --inputbox "Input path to delete:" 10 50)
    
    # Verify that the path exists
    if [ ! -e "$path" ]; then
        dialog --msgbox "Path not found: $path" 10 50
        exit 1
    fi
    
    # Use dialog to confirm the deletion
    dialog --yesno "Are you sure you want to delete: $path?" 10 50
    
    # Check the exit code of the previous dialog command
    # 0 means "yes" was selected, 1 means "no" was selected
    if [ "$?" -eq 0 ]; then
        # Delete the file or folder
        rm -r "$path"
        dialog --msgbox "Deleted: $path" 10 50
    else
        dialog --msgbox "Not deleted." 10 50
    fi
}
