@echo off

REM taskkill /t /f /im "pdapp.exe"
REM taskkill /t /f /im "Adobe*"
REM taskkill /t /f /im "CCLibrary.exe"
REM taskkill /t /f /im "CCXProcess.exe"
REM taskkill /t /f /im "CoreSync.exe"
REM taskkill /t /f /im "Creative Cloud.exe"

set DATA_DIR="C:\Program Files\Adobe\Adobe Photoshop CC*\AMT"
cd %DATA_DIR%
sed -i -E "s/(.*)(<Data.*key=\"TrialSerialNumber\">)([0-9]+)(.*)/\1\2$((\3+1))\4/e" application.xml

yolo=`awk "/TrialSerialNumber/{print $1;}" application.xml | awk '{split($0,parts,"(<Data key=\"TrialSerialNumber\">)|(</Data></Other>)"); { print parts[2]}}'`