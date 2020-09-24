#Get-Proccess Uses cpu time in seconds, kill all above x time
$cpuusage = Read-Host("Kill processses above how much CPU Time?")

#List all processes that will be killed
Get-Process | Where-Object -FilterScript {$_.Responding -eq $false} | Get-Unique
Get-Process | Where-Object { $_.CPU -gt $cpuusage } | Get-Unique

#Create Variables for processes to kill
$kill = Get-Process | Where-Object {$_.CPU -gt $cpuusage}
$killun = Get-Process | Where-Object -FilterScript {$_.Responding -eq $false}

#Confim Kill Processes
######$kill = Read-Host("What process would you like to kill?")
Stop-Process -Confirm $killun
Stop-Process -Confirm $kill