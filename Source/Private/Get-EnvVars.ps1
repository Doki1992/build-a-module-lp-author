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