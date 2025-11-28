# macOS Clamshell Toggler  
A simple macOS utility that enables or disables clamshell mode (external monitors while lid is closed) **even on battery**, using a safe graphical dialog.  

This script gives you a clean popup interface with buttons:
- **Enable Clamshell Mode**
- **Disable Clamshell Mode**
- **Cancel**

It applies the correct `pmset` configurations automatically and can also trigger an automatic reboot when restoring the default macOS sleep behavior.

---

## ⚠️ Important  
Apple does not officially support clamshell mode on battery.  
Enabling it may cause:
- increased battery drain  
- higher thermal output  
- different sleep/wake behavior  

Use at your own discretion.

---

## Features  
- One single `.command` file  
- GUI prompts using macOS native dialogs  
- No dependencies  
- Automatically applies correct `pmset` values  
- Can automatically reboot when disabling  
- Fully reversible  
- Designed for Apple Silicon and Intel macOS devices  

---

## Installation

1. Download the file:  
   **Clamshell-Toggler.command**

2. Move it anywhere (Desktop recommended).

3. Make it executable:
 
   chmod +x ~/Desktop/Clamshell-Toggler.command
   (or wherever you saved it)
   
4. Run it    
Double-click the file.
If macOS blocks it:

Right-click → Open → Open 

OR 

System Settings → Privacy & Security → “Allow Anyway”

## How It Works
Enable clamshell-on-battery applies:
pmset -a sleep 0
pmset -a hibernatemode 0
pmset -a disablesleep 1

Restore defaults applies:
pmset -a sleep 1
pmset -a hibernatemode 3
pmset -a disablesleep 0
pmset -a standby 1
pmset -a autopoweroff 1

Reboot is triggered automatically.

## Compatibility

macOS Ventura+

macOS Sonoma

macOS Sequoia

Apple Silicon (M1–M3)

Intel Macs
