@echo off
SET ADBPATH=%CD%\ADB
SET BATCHAPKDIR=BATCH_APK_INSTALL
PATH=%ADBPATH%
color 0a
echo Welcome To Padre's EZ Firestick Tools Batch APK Installer
echo Disclaimer:  Use these tools at your own risk. 
echo Press Ctr+C to cancel at any time
echo.  
echo Enter The Firesticks IP then press ENTER  
echo ----------------------------------------
set /p IP=IP: 
echo.  
echo Connecting to Firestick. Please wait..
echo.  
echo ----------------------- 
echo.  
adb.exe connect %IP%
echo.  
echo ----------------------- 
echo.  
echo If the list below says Unauthorized do not go forward until authorized. 
echo Check your Firestick for the ADB Authorization prompt. 
echo. 
echo Press the spacebar once authorized or if no prompt recieved.
echo. 
echo ----------------------- 
echo.  
adb.exe devices
echo. 
echo ----------------------- 
echo.  
pause
goto :INSTALLAPKS

:INSTALLAPKS
if not exist %BATCHAPKDIR% goto :NODIR
echo. 
echo ----------------------- 
echo. 
echo Installing APK'S from the %BATCHAPKDIR% directory automatically.. 
echo Please wait....  
echo. 
echo ----------------------- 
for %%f in (%BATCHAPKDIR%\*.apk) do (
	echo.
	echo Installing %%f
    adb install -r "%%f"
	echo.
	echo ----------------------- 
)
goto :DONE


:NODIR
if not exist %BATCHAPKDIR% mkdir %BATCHAPKDIR%
echo. 
echo ----------------------- 
echo. 
echo The directory %BATCHAPKDIR% didn't exist and has now been created.
echo You can now add APK files to the %BATCHAPKDIR% directory and proceed. 
echo. 
echo Press the spacebar after adding all the APK files that you'd like to install. 
echo. 
echo ----------------------- 
echo. 
pause
goto :INSTALLAPKS

:DONE
color 0e
echo.  
echo " ____   ___  _   _ _____ _ "
echo "|  _ \ / _ \| \ | | ____| |"
echo "| | | | | | |  \| |  _| | |"
echo "| |_| | |_| | |\  | |___|_|"
echo "|____/ \___/|_| \_|_____(_)"
echo.  
echo ----------------------- 
echo.  
echo Disconnecting from %IP%....
echo.  
echo ----------------------- 
echo.  
adb.exe disconnect %IP%
echo.  
echo ----------------------- 
echo.  
echo Check for other errors above then press spacebar to Exit..
echo.  
echo ----------------------- 
echo.  
pause
exit
