function Install-WindowsCAB{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [String] $Link,
        [Parameter(Mandatory=$false)]
        [String] $Path = (Get-Location).Path
    )
    $kb = ($Link | Select-String -Pattern 'kb(\d+)').Matches.Value
    $FileName = "$kb-patch.cab"
    $CabFilePath = "$Path\$FileName"
    (New-Object System.Net.WebClient).DownloadFile($Link, $CabFilePath)
    Invoke-Expression "DISM.exe /Online /Add-Package /PackagePath:$CabFilePath"
}
Install-WindowsCAB -Link 'http://b1.download.windowsupdate.com/d/upgr/2019/11/windows10.0-kb4517245-x64_4250e1db7bc9468236c967c2c15f04b755b3d3a9.cab'
