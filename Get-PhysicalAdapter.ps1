Param (
[Parameter (Mandatory=$True, HelpMessage="Enter a computername to query")]
[alias ('host')]
[string] $Computername
)
Write-Verbose "Running script for $Computername"
get-ciminstance win32_networkadapter -computername $Computername |
where {$_.PhysicalAdapter -eq $true} |
select MACAddress, AdapterType, DeviceID, Name, Speed
Write-Verbose "Script finished"