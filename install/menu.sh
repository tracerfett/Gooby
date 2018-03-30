#!/bin/bash

# ----------------
# Define variables
# ----------------

function="GooPlex Main Menu"

STD='\033[0m'
RED='\033[00;31m'
GRN='\033[00;32m'
YLW='\033[00;33m'

# --------------------
# Main script function
# --------------------

clear

# Installing

# Option 1
apps(){
  bash /opt/GooPlex/install/apps/menu.sh
}

# Option 2
server(){
  bash /opt/GooPlex/install/server/menu.sh
}

# Option 3
misc(){
  bash /opt/GooPlex/install/misc/menu.sh
}

# Option 4
quit(){
  clear
  echo ""
  echo "---------------------------------------------"
  echo " Visit the menu any time by typing 'gooplex' "
  echo "---------------------------------------------"
  echo ""
  exit
}

# Function to display menus
show_menus() {
  clear
  echo ""
  echo "---------------------------------------------"
  echo " $function "
  echo "---------------------------------------------"
  echo ""
  echo -e "${GRN}1.${STD} Install and maintain Apps"
  echo -e "${GRN}2.${STD} Server maintenance"
  echo -e "${GRN}3.${STD} Additional options"
  echo -e "${YLW}4.${STD} Exit $function"
  echo ""
}

# Read input from the keyboard and take a action
read_options(){
  local choice
    read -p "Choose option: " choice
    case $choice in
      1) apps ;;
      2) server ;;
      3) misc ;;
      4) quit ;;
      *) echo -e "${RED}Please select a valid option${STD}" && sleep 2
    esac
}
 
# ----------
# Finalizing
# ----------

trap '' SIGINT SIGQUIT SIGTSTP

while true
do 
  show_menus
  read_options
done
