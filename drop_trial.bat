@echo off

taskkill /t /f /im "pdapp.exe"
taskkill /t /f /im "Adobe*"
taskkill /t /f /im "CCLibrary.exe"
taskkill /t /f /im "CCXProcess.exe"
taskkill /t /f /im "CoreSync.exe"
taskkill /t /f /im "Creative Cloud.exe"

set DATA_DIR="C:\Program Files\Adobe\Adobe Photoshop CC*\AMT"

dir %DATA_DIR%\AMT