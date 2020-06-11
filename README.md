# Windows 10 ISO Powershell Functions

Get-Win10ISOLink:
This function spoofs a request from a non windows device in order generate a windows 10 ISO link. It leverages MSFTs internal APIs and hardcoded IDs to generate the link.

Receive-Win10ISO:
This function generates a new ISO link and downloads it to your PC

Start-Win10FeatureUpdate:
This function generates a new ISO link, downloads it, and then attempts to upgrade the OS to the version of said ISO. 

Example uses of the functions in this repo:


# One step upgrade using ISO file:
CMD:
```
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Start-Win10FeatureUpdate -DLPath 'C:\Windows\Temp\Windows10.iso' -LogPath 'C:\Windows\Temp\WindowsUpgradeLogs'}"
```
Powershell:
```
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Start-Win10FeatureUpdate -DLPath 'C:\Windows\Temp\Windows10.iso' -LogPath 'C:\Windows\Temp\WindowsUpgradeLogs'
```
# One step upgrade using WUA tool (untested):
CMD:
```
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Start-Win10UpgradeWUA -DLPath 'C:\Windows\Temp' -LogPath 'C:\Windows\Temp\WindowsUpgradeLogs'}"
```
Powershell:
```
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Start-Win10UpgradeWUA -DLPath 'C:\Windows\Temp' -LogPath 'C:\Windows\Temp\WindowsUpgradeLogs'
```
# One step upgrade using CAB file (untested):
CMD:
```
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Start-Win10UpgradeCAB -Reboot $false -DLPath 'C:\Windows\Temp' -LogPath 'C:\Windows\Temp\WindowsUpgradeLogs'}"
```
Powershell:
```
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Start-Win10UpgradeCAB -Reboot $false -DLPath 'C:\Windows\Temp' -LogPath 'C:\Windows\Temp\WindowsUpgradeLogs'
```
# Generate an ISO DL Link:
CMD:
```
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Get-Win10ISOLink}"
```
PowerShell:
```
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Get-Win10ISOLink
```
