
Get-Command –Module PSScheduledJob

#Create a new option object and store it in a variable
$opt = New-ScheduledJobOption –RequireNetwork –RunElevated -WakeToRun

#Creates a trigger that runs on Mondays and Thursdays every week, at 3:00 PM local time
$trigger = New-JobTrigger -Weekly -DaysOfWeek Monday,Thursday -At '3:00PM'

#Register a new job by using an option object in $opt and a trigger object in $trigger
$opt = New-ScheduledJobOption -WakeToRun
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(5)

#Displays the scheduled job's results
Get-Job
Receive-Job -id 6 -Keep

#Remove a job and delete its results 
Get-Job -id 6 | Remove-Job
Register-ScheduledJob -Trigger $trigger -ScheduledJobOption $opt -ScriptBlock { Dir C:\ } -MaxResultCount 5 -Name "LocalDir"