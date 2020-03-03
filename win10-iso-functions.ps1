function Get-Win10ISOLink {
    <#
    .SYNOPSIS
        This function generates a fresh download link for a windows 10 iso
    .INPUTS
        Prefered Architecture 
    .OUTPUTS
        Windows 10 ISO download link    
    .NOTES
        Version:        1.6
        Author:         Andy Escolastico
        Creation Date:  10/11/2019
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)] 
        [ValidateSet("64-bit", "32-bit")]
        [String] $Architecture = (Get-WmiObject Win32_OperatingSystem).OSArchitecture,
        [Parameter(Mandatory=$false)] 
        [ValidateSet("en-US")] # TODO: complete validation set
        [String] $Locale = (Get-WinSystemLocale).Name,
        [Parameter(Mandatory=$false)]
        [ValidateSet("Arabic", "Brazilian Portuguese", "Bulgarian", "Chinese (Simplified)", "Chinese (Traditional)", "Croatian", "Czech", "Danish", "Dutch", "English", "English International", "Estonian", "Finnish", "French", "French Canadian", "German", "Greek", "Hebrew", "Hungarian", "Italian", "Japanese", "Korean", "Latvian", "Lithuanian", "Norwegian", "Polish", "Portuguese", "Romanian", "Russian", "Serbian Latin", "Slovak", "Slovenian", "Spanish", "Spanish (Mexico)", "Swedish", "Thai", "Turkish", "Ukrainian")]
        [String] $Language = "English",
        [Parameter(Mandatory=$false)] 
        [ValidateSet("1909", "Latest")]
        [String] $Version = "Latest"
    )
    
    # prefered architecture
    if ($Architecture -eq "64-bit"){ $archID = "x64" } else { $archID = "x32" }
    
    # prefered prodID
    if ($Version = "Latest") {
        # grabs latest id
        $response = Invoke-WebRequest -UserAgent $userAgent -WebSession $session -Uri "https://www.microsoft.com/en-us/software-download/windows10ISO" -UseBasicParsing
        $prodID = ([regex]::Match((($response).RawContent), 'product-info-content.*option value="(.*)">Windows 10')).captures.groups[1].value
    } else{
        # uses hard-coded id
        $prodID = "1429"
    } 

    # variables you might not want to change (unless msft changes their schema)
    $pgeIDs = @("a8f8f489-4c7f-463a-9ca6-5cff94d8d041", "cfa9e580-a81e-4a4b-a846-7b21bf4e2e5b")
    $actIDs = @("getskuinformationbyproductedition", "getproductdownloadlinksbysku")
    $hstParam = "www.microsoft.com"
    $segParam = "software-download"
    $sdvParam = "2"
    $verID = "Windows10ISO"

    # used to spoof a non-windows web request
    $userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Edge/18.18362"

    # used to maintain session in subsequent requests
    $sessionID = [GUID]::NewGuid()

    # builds session request url 
    $uri = "https://www.microsoft.com/" + $Locale + "/api/controls/contentinclude/html"
    $uri += "?pageId=" + $pgeIDs[0]
    $uri += "&host=" + $hstParam
    $uri += "&segments=" + $segParam + "," + $verID
    $uri += "&query="
    $uri += "&action=" + $actIDs[0]
    $uri += "&sessionId=" + $sessionID
    $uri += "&productEditionId=" + $prodID
    $uri += "&sdvParam=" + $sdvParam

    # requests user session
    $response = Invoke-WebRequest -UserAgent $userAgent -WebSession $session -Uri $uri -UseBasicParsing

    # prefered skuid
    if ($Version = "Latest") {
        # grabs latest id
        $skuIDs = (($response.RawContent) -replace "&quot;" -replace '</div><script language=.*' -replace  '</select></div>.*' -split '<option value="' -replace '">.*' -replace '{' -replace '}'| Select-String -pattern 'id:') -replace 'id:' -replace 'language:' -replace '\s' | ConvertFrom-String -PropertyNames SkuID, Language -Delimiter ','
        $skuID = $skuIDs | Where-Object {$_.Language -eq "$Language"} | Select-Object -ExpandProperty SkuID
    }
    else{
        # uses hard-coded id
        $skuID = "9029"
    } 

    # builds link request url
    $uri = "https://www.microsoft.com/" + $Locale + "/api/controls/contentinclude/html"
    $uri += "?pageId=" + $pgeIDs[1]
    $uri += "&host=" + $hstParam
    $uri += "&segments=" + $segParam + "," + $verID
    $uri += "&query="
    $uri += "&action=" + $actIDs[1]
    $uri += "&sessionId=" + $sessionID
    $uri += "&skuId=" + $skuID
    $uri += "&lang=" + $Language
    $uri += "&sdvParam=" + $sdvParam

    # requests link data
    $response = Invoke-WebRequest -UserAgent $userAgent -WebSession $session -Uri $uri -UseBasicParsing

    # parses response data 
    $raw = ($response.Links).href
    $clean = $raw.Replace('amp;','')

    # stores download link
    $dlLink = $clean | Where-Object {$_ -like "*$archID*"}

    # outputs download link
    Write-Output $dlLink
}

function Download-Win10ISO {
    <#
    .SYNOPSIS
        This function leverages Get-Win10ISOLink to generate and download a windows 10 ISO using the default params.
    .INPUTS
        Prefered Architecture 
    .OUTPUTS
        Windows 10 ISO download link    
    .NOTES
        Version:        1.0
        Author:         Andy Escolastico
        Creation Date:  02/11/2020
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)] 
        [String] $DLPath = (Get-Location).Path + "\" +"Win10_" + $Architecture + ".iso"
    )
    $DLLink = Get-Win10ISOLink -Architecture $Architecture
    Write-Host "The Windows 10 ISO will be downloaded to $DLPath"
    (New-Object System.Net.WebClient).DownloadFile($DLLink, $DLPath)
}

function Install-Win10FeatureUpdate {
    <#
    .SYNOPSIS
        PLACEHOLDER
    .INPUTS
        Prefered Architecture 
    .OUTPUTS
        Windows 10 ISO download link    
    .NOTES
        Version:        1.0
        Author:         Andy Escolastico
        Creation Date:  02/11/2020
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)] 
        [String] $ISOPath,
        [Parameter(Mandatory=$true)] 
        [String] $LogPath
    )
    Write-Host "The Upgrade will commence shortly. Your PC will be rebooted soon. Please save any work you do not want to lose."
    Invoke-Expression "$((Mount-DiskImage -ImagePath $ISOPath | Get-Volume).DriveLetter):\setup.exe /auto Upgrade /quiet /Compat IgnoreWarning /DynamicUpdate disable /copylogs $LogPath"
}
