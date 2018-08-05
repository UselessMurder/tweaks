$apps=@("wireshark", "nmap", "tor-browser", "zap", "teamviewer", "openvpn", "burp-suite-free-edition")
Foreach ($app in $apps) {
choco install $app -y
}