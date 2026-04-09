@echo off
title Penawar Medsos Killer - Kembalikan Hosts
setlocal enabledelayedexpansion

REM Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Permintaan hak admin untuk penawar...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Menyalin hosts normal dari folder penawar...
set "target_hosts=C:\Windows\System32\drivers\etc\hosts"

copy "%~dp0penawar\hosts" "%target_hosts%" >nul
if %errorLevel% neq 0 (
    echo Gagal menyalin file penawar!
    pause
    exit /b 1
)

echo Flush DNS...
ipconfig /flushdns >nul

echo [SUKSES] Hosts dikembalikan normal! Medsos bisa diakses lagi. Restart browser/PC.
pause
exit /b 0
