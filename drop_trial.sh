#!/bin/bash

taskkill /t /f /im "pdapp.exe"
taskkill /t /f /im "Adobe*"
taskkill /t /f /im "CCLibrary.exe"
taskkill /t /f /im "CCXProcess.exe"
taskkill /t /f /im "CoreSync.exe"
taskkill /t /f /im "Creative Cloud.exe"

cd "/C/Program Files/Adobe/Adobe Photoshop CC 2018/AMT"

TRIAL_RESET_NUMBER=`grep -E "TrialSerialNumber" application.xml | awk '{split($0,parts,"(<Data key=\"TrialSerialNumber\">)"); { print parts[2]}}' | head -c24`
INCREMENT=${TRIAL_RESET_NUMBER:(-3)}
((INCREMENT++))
TRIAL_RESET_NUMBER_NEW=$(printf '%s%s' "${TRIAL_RESET_NUMBER:0:21}" "$INCREMENT")

sed -i -E "s/(.*)(<Data key=\"TrialSerialNumber\">)([0-9]+)(.*)/\1\2$TRIAL_RESET_NUMBER_NEW\4/" application.xml