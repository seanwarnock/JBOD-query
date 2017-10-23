#Requires -Version 5.0
<#
Must be run as "administrators".

ID of enclosure 4U60G2_STOR_ENCL
SCSI4:1,25,0   claimed=0 pdt=dh          HGST  4U60G2_STOR_ENCL  0101
#>

$SGScan #
$Enclosures= @() #Array of enclosure ID's to scan
$EnclosureID 
$EnclosureStatus




$SGScan = .\sg3_utils-1.42_mw64exe\sg_scan.exe -s

#Write-Host "Time for Matches"
$Enclosures += $SGScan | Where {$_ -match "^(SCSI[0-9]{1,3}:[0-9]{1,3},[0-9]{1,3},[0-9]{1,3}).+4U60G2_STOR_ENCL"} | Foreach {$Matches[1]}

foreach ($EnclosureID in $Enclosures)
  { 

write-host 'This is an enclosure: ' $EnclosureID
    $EnclosureStatus = .\sg3_utils-1.42_mw64exe\sg_ses.exe $EnclosureID -p0x2
    $EnclosureID
    $EnclosureStatus | Where {$_ -match "status: Critical"}
    $EnclosureStatus | Where {$_ -match "status: Warning"}
  }
