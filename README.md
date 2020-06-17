# Windows 10 ISO Powershell Functions

Example uses of the functions in this repo:


# One step upgrade using ISO file:
CMD:
```
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Ssl3, [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12; (new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Start-Win10FeatureUpdate -DLPath 'C:\Windows\Temp\Windows10.iso' -LogPath 'C:\Windows\Temp\WindowsUpgradeLogs'}"
```
Powershell:
```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Ssl3, [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12; (new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Start-Win10FeatureUpdate -DLPath 'C:\Windows\Temp\Windows10.iso' -LogPath 'C:\Windows\Temp\WindowsUpgradeLogs'
```
# One step upgrade using WUA tool:
CMD:
```
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Ssl3, [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12; (new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Start-Win10UpgradeWUA -DLPath 'C:\Windows\Temp' -LogPath 'C:\Windows\Temp'}"
```
Powershell:
```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Ssl3, [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12; (new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Start-Win10UpgradeWUA -DLPath 'C:\Windows\Temp' -LogPath 'C:\Windows\Temp'
```
# One step upgrade using CAB file:
CMD:
```
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Ssl3, [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12; (new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Start-Win10UpgradeCAB -Reboot $false -DLPath 'C:\Windows\Temp' -LogPath 'C:\Windows\Temp'}"
```
Powershell:
```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Ssl3, [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12; (new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Start-Win10UpgradeCAB -Reboot $false -DLPath 'C:\Windows\Temp' -LogPath 'C:\Windows\Temp'
```
# Generate an ISO DL Link:
CMD:
```
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Ssl3, [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12; (new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Get-Win10ISOLink}"
```
PowerShell:
```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Ssl3, [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12; (new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/RFAInc/windows10-iso/master/win10-iso-functions.ps1') | Invoke-Expression; Get-Win10ISOLink
```
