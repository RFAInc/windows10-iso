# Windows 10 ISO Powershell Functions

Get-Win10ISOLink:
This function spoofs a request from a non windows device in order generate a windows 10 ISO link. It leverages MSFTs internal APIs and hardcoded IDs to generate the link.

Receive-Win10ISO:
This function generates a new ISO link and downloads it to your PC

Install-Win10FeatureUpdate:
This function mounts a windows 10 ISO and attempts to upgrade the OS to the version of said ISO. 

Example uses of the functions in this repo:


# One step upgrade:
CMD:
```
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Receive-Win10ISO -DLPath 'C:\Windows\Temp\Windows10.iso'; Install-Win10FeatureUpdate -ISOPath 'C:\Windows\Temp\Windows10.iso' -LogPath 'C:\Windows\Temp\WindowsUpgradeLogs'}"
```
Powershell:
```
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Receive-Win10ISO -DLPath 'C:\Windows\Temp\Windows10.iso'; Install-Win10FeatureUpdate -ISOPath 'C:\Windows\Temp\Windows10.iso' -LogPath 'C:\Windows\Temp\WindowsUpgradeLogs'
```

# GENERATE DL LINK:
CMD:
```
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Get-Win10ISOLink}"
```
PowerShell:
```
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Get-Win10ISOLink
```
# DOWNLOAD ISO:
CMD:
```
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Receive-Win10ISO -DLPath 'C:\Windows\Temp\Windows10.iso'}"
```
PowerShell:
```
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Receive-Win10ISO -DLPath 'C:\Windows\Temp\Windows10.iso'
```
# INSTALL ISO
CMD:
```
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Install-Win10FeatureUpdate -ISOPath 'C:\Windows\Temp\Windows10.iso' -LogPath 'C:\Windows\Temp\WindowsUpgradeLogs'}"
```
Powershell:
```
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Install-Win10FeatureUpdate -ISOPath 'C:\Windows\Temp\Windows10.iso' -LogPath 'C:\Windows\Temp\WindowsUpgradeLogs'
```
