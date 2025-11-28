#!/bin/zsh

# Ask user what they want
choice=$(osascript -e 'button returned of (display dialog "Choose an action:" buttons {"Enable Clamshell", "Disable Clamshell", "Cancel"} default button 1)')

if [ "$choice" = "Cancel" ]; then
  osascript -e 'display dialog "Cancelled." buttons {"OK"}'
  exit 0
fi

##########################################################
### ENABLE CLAMSHELL MODE ON BATTERY
##########################################################
if [ "$choice" = "Enable Clamshell" ]; then
  osascript -e 'display dialog "Warning:\n\nThis will enable clamshell mode on battery.\nYour Mac will NOT sleep when the lid is closed.\n\nBattery will drain faster and thermals may increase.\n\nUse at your own risk." buttons {"Continue", "Cancel"} default button 1'

  if [ "$?" != "0" ]; then
    exit 0
  fi

  sudo pmset -a sleep 0
  sudo pmset -a hibernatemode 0
  sudo pmset -a disablesleep 1

  osascript -e 'display dialog "Clamshell mode on battery is now ENABLED.\n\nA reboot is recommended." buttons {"OK"}'
  exit 0
fi

##########################################################
### DISABLE + RESTORE DEFAULTS
##########################################################
if [ "$choice" = "Disable Clamshell" ]; then
  osascript -e 'display dialog "Warning:\n\nThis will restore Apple default sleep mode.\nYour Mac WILL reboot automatically in 10 seconds.\n\nSave your work before continuing." buttons {"Continue", "Cancel"} default button 1'

  if [ "$?" != "0" ]; then
    exit 0
  fi

  sudo pmset -a sleep 1
  sudo pmset -a hibernatemode 3
  sudo pmset -a disablesleep 0
  sudo pmset -a standby 1
  sudo pmset -a autopoweroff 1

  # Countdown + automatic reboot
  osascript -e 'display dialog "Your Mac will reboot in 10 seconds..." buttons {"OK"} giving up after 10'

  sudo reboot
fi
