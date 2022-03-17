#Module 10: Configuring advanced networking features
#Exercise 1: Creating and using Hyper-V virtual switches
#Task 1: Verify the current Hyper-V network configuration on Host & remember NetAdapterName
Get-NetAdapter
New-VMSwitch -name PrivateSwitch -SwitchType Private

#Task 2: Create virtual switches (Internal & External) on Host
New-VMSwitch -name "External Switch"  -NetAdapterName "Ethernet 2" -AllowManagementOS $true
New-VMSwitch -name "Internal Switch" -SwitchType Internal

#Task 3: Create virtual network adapters (Make sure VM is off)
Add-VMNetworkAdapter -VMName 20741B-LON-SVR1-B -Name "New Network Adapter" 
Connect-VMNetworkAdapter -VMName 20741B-LON-SVR1-B -Name “New Network Adapter” -SwitchName “External Switch” 

#Task 4: Use the Hyper-V virtual switches
Start-VM -VMName 20741B-LON-SVR1-B
Enter-PSSession -VMName 20741B-LON-SVR1-B -Credential (Get-Credential)

#Task 5: Add NIC Teaming in LON-SVR1
$TeamName = "LON-SVR1 NIC Team"
New-NetLBFOTeam $TeamName “Ethernet 2”