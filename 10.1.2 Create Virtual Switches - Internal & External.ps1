#Module 10: Configuring advanced networking features
#Exercise 1: Creating and using Hyper-V virtual switches
#Task 1: Verify the current Hyper-V network configuration on Host
Get-NetAdapter

#Task 2: Create virtual switches (Internal & External) on Host
# Get NetAdapterName from Get-NetAdapter
New-VMSwitch -name "External Switch"  -NetAdapterName "Ethernet 2" -AllowManagementOS $true
New-VMSwitch -name "Internal Switch" -SwitchType Internal

#Task 3: Create virtual network adapters
#Task 4: Use the Hyper-V virtual switches
#Task 5: Add NIC Teaming