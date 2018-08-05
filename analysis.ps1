$apps=@("dependencywalker", "dex2jar", "dotPeek", "javadecompiler-gui", "resedit", "reshack", "winspy", "x64dbg.portable", "volatility", "windbg", "imagemagick", "graphviz", "miktex", "sox.portable")
Foreach ($app in $apps) {
choco install $app -y
}

Import-Module BitsTransfer
Start-BitsTransfer -Source "https://mirror.yandex.ru/mirrors/sage.math.washington.edu/win/SageMath-8.2.exe" -Destination .\SageMath-8.2.exe
./SageMath-8.2.exe | Out-Null
Remove-Item ./SageMath-8.2.exe

function Invoke-CmdScript {
  param(
    [String] $scriptName
  )
  $cmdLine = """$scriptName"" $args & set"
  & $Env:SystemRoot\system32\cmd.exe /c $cmdLine |
  select-string '^([^=]*)=(.*)$' | foreach-object {
    $varName = $_.Matches[0].Groups[1].Value
    $varValue = $_.Matches[0].Groups[2].Value
    set-item Env:$varName $varValue
  }
}

if([intptr]::Size -eq 4) {
    Invoke-CmdScript "C:\Program Files\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x86
} else {
    Invoke-CmdScript "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64
}

pip2 install angr
pip2 install pwntools
pip2 install sagemath
pip2 install matplotlib
pip2 install pyx==0.12.1
pip2 install cryptography
pip2 install scapy