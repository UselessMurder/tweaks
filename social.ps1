$apps=@("thunderbird", "slack", "7zpidginip", "wps-office-free", "gpg4win", "telegram.install", "rocketchat", "dropbox")
Foreach ($app in $apps) {
choco install $app -y
}