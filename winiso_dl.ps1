function Get-Win10ISOLink {
    <#
    .SYNOPSIS
        This script generates a fresh download link for a windows iso
    .INPUTS
        Prefered Architecture 
    .OUTPUTS
        Windows 10 ISO download link    
    .NOTES
        Version:        1.0
        Author:         Andy Escolastico
        Creation Date:  10/11/2019
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)] 
        [ValidateSet("64bit", "32bit")]
        [String] $Architecture 
    )
    
    # variables you might want to change
    $lang = "English"
    $locID = "en-US"
    $verID = "Windows10ISO"
    $skuID = "9029"
    $prodID = "1429"

    # prefered architecture
    if ($Architecture -eq "64bit"){ $archID = "x64" } else { $archID = "x32" }
    
    # variables you might not want to change (unless msft changes their schema)
    $pgeIDs = @("a8f8f489-4c7f-463a-9ca6-5cff94d8d041", "cfa9e580-a81e-4a4b-a846-7b21bf4e2e5b")
    $actIDs = @("getskuinformationbyproductedition", "getproductdownloadlinksbysku")
    $hstParam = "www.microsoft.com"
    $segParam = "software-download"
    $sdvParam = "2"

    # used to spoof a non-windows web request
    $userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Edge/18.18362"

    # used to maintain session in subsequent requests
    $sessionID = [GUID]::NewGuid()

    # builds session request url 
    $uri = "https://www.microsoft.com/" + $locID + "/api/controls/contentinclude/html"
    $uri += "?pageId=" + $pgeIDs[0]
    $uri += "&host=" + $hstParam
    $uri += "&segments=" + $segParam + "," + $verID
    $uri += "&query="
    $uri += "&action=" + $actIDs[0]
    $uri += "&sessionId=" + $sessionID
    $uri += "&productEditionId=" + $prodID
    $uri += "&sdvParam=" + $sdvParam

    # requests user session
    $null = Invoke-WebRequest -UserAgent $userAgent -WebSession $session $uri

    # builds link request url
    $uri = "https://www.microsoft.com/" + $locID + "/api/controls/contentinclude/html"
    $uri += "?pageId=" + $pgeIDs[1]
    $uri += "&host=" + $hstParam
    $uri += "&segments=" + $segParam + "," + $verID
    $uri += "&query="
    $uri += "&action=" + $actIDs[1]
    $uri += "&sessionId=" + $sessionID
    $uri += "&skuId=" + $skuID
    $uri += "&lang=" + $lang
    $uri += "&sdvParam=" + $sdvParam

    # requests link data
    $response = Invoke-WebRequest -UserAgent $userAgent -WebSession $session $uri

    # parses response data 
    $raw = ($response.Links| Where-Object {$_.outerText -like "*Download"}).href
    $clean = $raw.Replace('amp;','')

    # stores download link
    $dlLink = $clean | Where-Object {$_ -like "*$archID*"}

    # outputs download link
    Write-Output $dlLink
}
