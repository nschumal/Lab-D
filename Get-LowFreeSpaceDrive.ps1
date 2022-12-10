Param (
    $Computername = 'localhost',
    $MinimumPercentFree = 10
)
$minpercent = $MinimumPercentFree / 100
Get-CimInstance -class Win32_LogicalDisk -computer $Computername -filter "drivetype=3" |
Where-Object {$_.FreeSpace /$_.Size -lt $minpercent } |
Select-Object -Property DeviceID, FreeSpace, Size