Get-WmiObject -Class Win32_LogicalDisk -ComputerName LON-CL1,LON-DC1,LON-SVR1 -Filter "DeviceID='C:'" |
Select-Object SystemName,
              @{n='FreeSpace(GB)';e={$PSItem.FreeSpace/1GB}},
              @{n='Disk Size(GB)';e={$PSItem.Size/1GB}}


Get-WmiObject  -Class Win32_LogicalDisk | GM

