# windows_10_iso_dl

This powershell function spoofs a request from a non windows device in order generate a windows 10 ISO link. It leverages MSFTs internal APIs and hardcoded IDs to generate the link.
Example uses of the functions in this repo:


GENERATE DL LINK:
CMD:
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aescolastico/windows_10_iso_dl/master/winiso_dl.ps1')| Invoke-Expression; Get-Win10ISOLink -Architecture 64bit}"
PowerShell:
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aescolastico/windows_10_iso_dl/master/winiso_dl.ps1')| Invoke-Expression; Get-Win10ISOLink -Architecture 64bit
DOWNLOAD ISO:
CMD:
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aescolastico/windows_10_iso_dl/master/winiso_dl.ps1')| Invoke-Expression; Download-Win10ISO -Architecture 64bit -DLPath 'C:\Temp\Windows10_x64.iso'}"
PowerShell:
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aescolastico/windows_10_iso_dl/master/winiso_dl.ps1')| Invoke-Expression; Download-Win10ISO -Architecture 64bit -DLPath 'C:\Temp\Windows10_x64.iso'
INSTALL ISO
CMD:
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aescolastico/windows_10_iso_dl/master/winiso_dl.ps1')| Invoke-Expression; Install-Win10FeatureUpdate -ISOPath 'C:\Temp\Windows10_x64.iso' -LogPath 'C:\Temp\WindowsUpgradeLogs'}"
Powershell:
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aescolastico/windows_10_iso_dl/master/winiso_dl.ps1') | Invoke-Expression; Install-Win10FeatureUpdate -ISOPath 'C:\Temp\Windows10_x64.iso' -LogPath 'C:\Temp\WindowsUpgradeLogs'
One step upgrade:
CMD:
"%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "& {(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aescolastico/windows_10_iso_dl/master/winiso_dl.ps1') | Invoke-Expression; Download-Win10ISO -Architecture 64bit -DLPath 'C:\Windows\Temp\Windows10_x64.iso'; Install-Win10FeatureUpdate -ISOPath 'C:\Temp\Windows10_x64.iso' -LogPath 'C:\Temp\WindowsUpgradeLogs'}"
Powershell:
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aescolastico/windows_10_iso_dl/master/winiso_dl.ps1') | Invoke-Expression; Download-Win10ISO -Architecture 64bit -DLPath 'C:\Windows\Temp\Windows10_x64.iso'; Install-Win10FeatureUpdate -ISOPath 'C:\Temp\Windows10_x64.iso' -LogPath 'C:\Temp\WindowsUpgradeLogs'
(edited)

