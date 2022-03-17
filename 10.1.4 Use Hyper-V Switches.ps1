#Module 10: Configuring advanced networking features
#Exercise 1: Creating and using Hyper-V virtual switches
#Task 1: Verify the current Hyper-V network configuration on Host
#Task 2: Create virtual switches (Internal & External) on Host
#Task 3: Create virtual network adapters

#Task 4: Use the Hyper-V virtual switches
Start-VM -VMName 20741B-LON-SVR1-B
Enter-PSSession -VMName 20741B-LON-SVR1-B -Credential (Get-Credential)

#Task 5: Add NIC Teaming