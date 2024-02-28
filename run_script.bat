@echo off
powershell.exe -ExecutionPolicy Bypass -File "%~dp0\generate_certificate.ps1"
pause
