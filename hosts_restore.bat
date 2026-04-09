@echo off
title Restore Hosts - Medsos Killer
setlocal enabledelayedexpansion

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Permintaan hak admin untuk restore...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

set "target_hosts=C:\Windows\System32\drivers\etc\hosts"
set "backup_hosts=%target_hosts%.backup"

if exist "%backup_hosts%" (
    echo Mengembalikan dari backup...
    copy "%backup_hosts%" "%target_hosts%" >nul
    echo Flush DNS...
    ipconfig /flushdns >nul
    echo [SUKSES] Hosts dikembalikan. Restart browser.
) else (
    echo Backup tidak ditemukan! %backup_hosts%
)

pause
exit /b 0
