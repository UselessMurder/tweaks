Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$apps=@("Firefox", "Far", "7zip", "winrar", "notepadplusplus", "putty", "foxitreader", "lightshot", "rufus", "winmerge", "virtualclonedrive", "deluge", "filezilla", "vlc", "gimp", "hxd", "windjview", "jre8", "hwmonitor")
Foreach ($app in $apps) {
choco install $app -y
}