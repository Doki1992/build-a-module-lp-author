function Set-GitConnection {
    Param(
        [string]$GitHubPat,
        [string]$Url = "https://api.github.com",
        [ValidateSet("2022-11-28")]
        [string]$ApiVersion
    )
    # $encodedPAT = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($GitHubPat))
    $env = Get-EnvVars
    $PAT = $global:GIT_HUB_PAT    
    $Headers = @{
        "Authorization" = "Bearer $PAT"
    }
   $Response = Invoke-RestMethod -Uri $Url -Method Get -Headers $Headers
   $Response 
}