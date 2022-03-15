#Option 1
Restart-Computer -ComputerName LON-CL1 -Force

#Option 2
Invoke-CimMethod -ComputerName LON-CL1 -ClassName 'Win32_OperatingSystem' -MethodName Reboot