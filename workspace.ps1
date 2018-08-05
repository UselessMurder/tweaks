$apps=@("ConEmu", "git", "svn", "Sudo", "vim", "hashdeep", "python3", "python2", "sysinternals", "nirlauncher", "explorersuite", "radare", "upx", "virtualbox", "gnuwin32-make.portable", "gnuwin32-sed.install", "gnuwin32-grep.install", "strawberryperl")
Foreach ($app in $apps) {
choco install $app -y
}

if([intptr]::Size -eq 4) {
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\GnuWin32\bin", [EnvironmentVariableTarget]::Machine)
} else {
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files (x86)\GnuWin32\bin", [EnvironmentVariableTarget]::Machine)
}

Copy-Item "C:\Python27\python.exe" -Destination "C:\Python27\python2.exe"
Copy-Item "C:\Python37\python.exe" -Destination "C:\Python37\python3.exe"

pip2 install virtualenv
pip3 install virtualenv

Copy-Item "C:\Python27\Scripts\virtualenv.exe" -Destination "C:\Python27\Scripts\virtualenv2.exe"
Copy-Item "C:\Python37\Scripts\virtualenv.exe" -Destination "C:\Python37\Scripts\virtualenv3.exe"

pip2 install ipython[all]
pip3 install ipython[all]