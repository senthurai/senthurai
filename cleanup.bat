@echo off
Title Cache Cleaner + Crave

@echo Shutting down browsers...

@echo off
taskkill /f /IM "Chrome.exe"

@echo off
taskkill /f /IM iexplore.exe

@REM (Deletes Temporary Internet Files Only - Process 8, Deletes Cookies Only - Process 2)
echo Cleaning IE and Chrome Cache...
echo Deleting Temporary Internet Files...
echo Deleting Cookies...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
erase "%LOCALAPPDATA%\Microsoft\Windows\INetCache\*.*" /f /s /q
for /D %%i in ("%LOCALAPPDATA%\Microsoft\Windows\INetCache\*") do RD /S /Q "%%i"

echo Cleaning Local User Temps...

erase "%LOCALAPPDATA%\Temp\*.*" /f /s /q
for /D %%i in ("%LOCALAPPDATA%\Temp\*") do RD /S /Q "%%i"

echo Cleaning Google Chrome Cache...

@echo off
erase "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" /f /s /q
for /D %%i in ("%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*") do RD /S /Q "%%i"

@rem Clear Google Chrome Cache

@echo off
erase "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache\*.*" /f /s /q
for /D %%i in ("%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache\*") do RD /S /Q "%%i"

@echo off
erase "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Media Cache\*.*" /f /s /q
for /D %%i in ("%LOCALAPPDATA%\Google\Chrome\User Data\Default\Media Cache\*") do RD /S /Q "%%i"

echo Cleaning CRAVE Cache...
@echo off
erase "%LOCALAPPDATA%\Google\Chrome\CRAVE Data\*.*" /f /s /q
for /D %%i in ("%LOCALAPPDATA%\Google\Chrome\CRAVE Data\*") do RD /S /Q "%%i"

echo Cleaning AWD Lite Profile...
@echo off
erase "C:\Users\%USERNAME%\AppData\Roaming\DST\*.*" /f/s/q
for /D %%i in ("%C:\Users\%USERNAME%\AppData\Roaming\DST\*") do RD /S /Q "%%i"


echo Clean up finished!

gpupdate /force

@echo off
echo Please reboot machine...

@echo off
timeout 10
