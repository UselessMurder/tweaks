$Preferences = Get-MpPreference
if($Preferences.DisableRealtimeMonitoring -eq $false) {
    Set-MpPreference -DisableRealtimeMonitoring $true
    $disabled = $false
} else {
    $disabled = $true
}

$Password = Read-Host 'Enter password' -AsSecureString
$pass = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password))

set-alias sz "$env:ProgramFiles\7-Zip\7z.exe"
$7zf = ".\cookies\clear_cookie.zip"
$7zo = "-aoa"

sz x $7zf "-p$pass" $7zo

.\leave_me.ps1

Remove-Item .\kms_cookie -Force -Recurse
Remove-Item .\leave_me.ps1
Remove-Item .\kms_cookie.zip

if($disabled -eq $false) {
    $Preferences = Get-MpPreference
    if($Preferences.DisableRealtimeMonitoring -eq $true) {
        Set-MpPreference -DisableRealtimeMonitoring $false
    }
}