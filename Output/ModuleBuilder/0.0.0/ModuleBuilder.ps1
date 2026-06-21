#Region '.\Private\Get-EnvVars.ps1' -1

$global:GIT_HUB_PAT = ''
function Get-EnvVars {
    $parentPath = Split-Path -Path $PSScriptRoot -Parent
    $parentPath2 = Split-Path -Path $parentPath -Parent
    $parentPath3 = Split-Path -Path $parentPath2 -Parent
    $envPath = Join-Path -Path $parentPath3 '.env'
    $data = Get-Content $envPath
    If(Test-Path -Path $envPath) {
        $data = Get-Content $envPath
        foreach($line in $data) {
            $key, $value = $line.Split("=")
            If($key -eq "GITHUB_PATH") {
                $global:GIT_HUB_PAT = $value
            }
        }
    }
    $global:GIT_HUB_PAT
}
#EndRegion '.\Private\Get-EnvVars.ps1' 19
#Region '.\Public\Get-GitConnection.ps1' -1

function Set-GitConnection {
    Param(
        [string]$GitHubPat,
        [string]$Url = "https://api.github.com",
        [ValidateSet("2022-11-28")]
        [string]$ApiVersion
    )
    $encodedPAT = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($GitHubPat))
    $GitHubPat, $encodedPAT, $Url, $ApiVersion
}
$env = Get-EnvVars
echo $global:GIT_HUB_PAT
$data = Set-GitConnection -GitHubPat mike
echo $data
#EndRegion '.\Public\Get-GitConnection.ps1' 15

