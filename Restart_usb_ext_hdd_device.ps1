# I wrote this script was developed to restart my Toshiba external Canvio Desk 2TB 3.5'' hard drive device with faulty connection to a Windows 10 OS. It's unknown whether the problem is hardware-related (faulty/damaged data or power cables) or software-related, although, perhaps it's the later, since the problem doesn't seem to manifest, when trying it out on Linux OS distros.
# Use the "pnputil.exe /enum-devices" to find all devices available in the computer. Filter the output (e.g. copying it to a text editor and looking up the name of the drive formated in the USB storage device via CTRL+F, e.g. "Toshiba").

$deviceInstanceId = "USB\VID_054C&PID_C005\5&276264ac&0&11"  # Replace with the actual Device Instance ID

# Run pnputil to restart the specified device
pnputil.exe /restart-device "$deviceInstanceId"