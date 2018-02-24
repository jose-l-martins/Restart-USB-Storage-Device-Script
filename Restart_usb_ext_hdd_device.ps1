<#
This script restarts a Toshiba external Canvio Desk 2TB 3.5'' hard drive device with a faulty connection to a Windows 10 OS. 
The problem could be hardware-related (faulty/damaged data or power cables) or software-related. 
The issue does not seem to manifest on Linux OS distros, suggesting it might be software-related.

Steps to find all devices available in the computer:
1. Use the "pnputil.exe /enum-devices" command.
2. Filter the output by copying it to a text editor and looking up the name of the drive formatted in the USB storage device (e.g., "Toshiba").
#>

$deviceInstanceId = "USB\VID_054C&PID_C005\5&276264ac&0&11"  # Replace with the actual Device Instance ID

# Run pnputil to restart the specified device
pnputil.exe /restart-device "$deviceInstanceId"