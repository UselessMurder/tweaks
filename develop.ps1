$apps=@("msys2", "microsoft-build-tools", "android-sdk", "golang", "protoc", "nasm", "jdk8", "nodejs", "elixir", "cmake")
Foreach ($app in $apps) {
choco install $app -y
}
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\CMake\bin", [EnvironmentVariableTarget]::Machine)

Write-Host -NoNewLine 'Update Build Tools with Visual Studio Installer and press any key...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

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

choco install llvm -y