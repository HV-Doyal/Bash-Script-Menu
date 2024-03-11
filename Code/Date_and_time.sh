#!/bin/bash

##################### TO SHOW DATE AND TIME ########################
show_date_and_time() {
    dialog --msgbox "Date: $(date +'%d/%m/%y')\nTime: $(date +'%T ')" 10 40
}
