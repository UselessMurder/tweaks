if([System.IO.File]::Exists("C:\Python27\python2.exe")){
    Remove-Item C:\Python27\python2.exe
}
if([System.IO.File]::Exists("C:\Python37\python3.exe")){
    Remove-Item C:\Python27\python3.exe
}
Copy-Item "C:\Python27\python.exe" -Destination "C:\Python27\python2.exe"
Copy-Item "C:\Python37\python.exe" -Destination "C:\Python37\python3.exe"

if([System.IO.File]::Exists("C:\Python27\Scripts\virtualenv2.exe")){
    Remove-Item C:\Python27\Scripts\virtualenv2.exe
}
if([System.IO.File]::Exists("C:\Python37\Scripts\virtualenv3.exe")){
    Remove-Item C:\Python37\Scripts\virtualenv3.exe
}
Copy-Item "C:\Python27\Scripts\virtualenv.exe" -Destination "C:\Python27\Scripts\virtualenv2.exe"
Copy-Item "C:\Python37\Scripts\virtualenv.exe" -Destination "C:\Python37\Scripts\virtualenv3.exe"