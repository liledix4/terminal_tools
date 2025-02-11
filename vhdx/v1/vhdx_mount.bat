@ECHO OFF
nircmd elevate PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0vhdx.ps1" %* -operation ""