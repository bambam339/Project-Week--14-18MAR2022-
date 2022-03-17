#Module 10: Configuring advanced networking features
#Exercise 1: Creating and using Hyper-V virtual switches
#Task 1: Verify the current Hyper-V network configuration on Host & remember NetAdapterName
Get-NetAdapter
New-VMSwitch -name PrivateSwitch -SwitchType Private

#Task 2: Create virtual switches (Internal & External) on Host
#Task 3: Create virtual network adapters
#Task 4: Use the Hyper-V virtual switches
#Task 5: Add NIC Teaming