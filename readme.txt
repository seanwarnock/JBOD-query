This PowerShell script drives the sg3_utils(1) package on Windows.  Currently it will identify all 4U60G2 arrays and query status.  If any "status: " is not reported as "OK" the script will output the line for the failure otherwise it will only return the enclosure's SCSI IDs.

This script requires PowerShell v5(2) and the sg3_utils(1) package.

(1) http://sg.danny.cz/sg/sg3_utils.html
(2) https://www.microsoft.com/en-us/download/details.aspx?id=54616