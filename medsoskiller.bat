@echo off
title Medsos Killer - Blokir Medsos
setlocal enabledelayedexpansion

REM Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Permintaan hak admin...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Membuat backup hosts original...
set "target_hosts=C:\Windows\System32\drivers\etc\hosts"
set "backup_hosts=%target_hosts%.backup"


echo Menyalin hosts blocker...
copy "%~dp0hosts" "%target_hosts%" >nul
if %errorLevel% neq 0 (
    echo Gagal menyalin file!
    pause
    exit /b 1
)

echo Flush DNS...
ipconfig /flushdns >nul

echo [SUKSES] Medsos diblokir! Restart browser atau komputer untuk efek penuh.
echo Backup tersimpan di %backup_hosts%.
echo Jalankan penawar.bat untuk mengembalikan.
pause
exit /b 0
