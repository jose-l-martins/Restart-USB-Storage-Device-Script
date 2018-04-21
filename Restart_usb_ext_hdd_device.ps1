<#
This script is designed to automatically identify and restart a USB device with connection issues on a Windows 10 OS. 
While it was initially created for a Toshiba external Canvio Desk 2TB 3.5'' hard drive, it can be used for any USB device experiencing similar problems. 
The connection issue could be either hardware-related (such as faulty or damaged data or power cables) or software-related. 
Interestingly, the issue does not seem to manifest on Linux OS distros, suggesting it might be software-related.

It looks for an USB device with problems and restarts it.
#>
Write-Output "Running command to find Instance ID of USB devices with problems..."

# Search for USB devices with problems and extract the device instance ID
$deviceInstanceId = Invoke-Expression 'pnputil.exe /enum-devices /class USB /problem | Select-String -Pattern "Instance ID:\s+(.*)$" | ForEach-Object { $_.Matches.Groups[1].Value }'

# Or instead, manually attribute the deviceInstanceId value you desire below and uncomment the line.
# $deviceInstanceId = "USB\VID_0480&PID_A200\0000000000000000"

# If no device instance ID is found, exit the script
if (-not $deviceInstanceId) {
    Write-Output "No USB devices with problems found."
    exit
}

# Print the device instance ID
Write-Output "Device Instance ID found: $deviceInstanceId"

# Run pnputil to restart the specified device
pnputil.exe /restart-device "$deviceInstanceId"