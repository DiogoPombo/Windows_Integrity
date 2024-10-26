@echo off
@title Windows Integrity
set APP=Windows Integrity
set AUTHOR=POMBO
set AVATAR=\Õ/
set MADE_BY=MADE BY:
set SPACE= 
set KEY=@2024
echo %APP%%SPACE%%MADE_BY%%SPACE%%SPACE%%AUTHOR%%SPACE%%SPACE%%AVATAR%%SPACE%%KEY%

:: Batch
echo.
echo SCRIPT TO RESTORE WINDOWS!
pause

cls
echo.
color 0C
echo Warning! - This program can make changes to Windows files and registry and will not work properly if run without Administrator permissions!
echo.
echo Warning! - This program takes a while to complete its operations, do not use or turn off the computer until everything is complete!

:: VBS
setlocal

echo Set objShell = CreateObject("WScript.Shell") > "%~dp0\prompt.vbs"
echo answer = objShell.Popup("This program can make some changes in Windows! Proceed?", 0, "Windows Integrity - Alert!", 4 + 32) >> "%~dp0\prompt.vbs"
echo If answer = 6 Then >> "%~dp0\prompt.vbs"
echo     WScript.Quit(0) >> "%~dp0\prompt.vbs"
echo Else >> "%~dp0\prompt.vbs"
echo     WScript.Quit(1) >> "%~dp0\prompt.vbs"
echo End If >> "%~dp0\prompt.vbs"

cscript //nologo "%~dp0\prompt.vbs"
if %errorlevel% neq 0 (
    del "%~dp0\prompt.vbs"
    endlocal
    exit /b
)
del "%~dp0\prompt.vbs"

cls
echo.
color 07
echo Authorized!

echo.
echo ******************** REPAIRING WINDOWS ********************
echo.
echo.
systeminfo
echo.

echo.
echo Checking the integrity of Windows files. . .
echo.
sfc /scannow
echo.

echo Checking Windows Image Integrity. . .
echo.
DISM /Online /Cleanup-image /Restorehealth
echo.

echo.
:: PowerShell
setlocal

echo Set objShell = CreateObject("WScript.Shell") > "%~dp0\prompt.vbs"
echo answer = objShell.Popup("Windows scan complete! The next step checks the HD / SSD and the RAM Memory. This process can take hours and system need to reboot... Continue?", 0, "Windows Integrity", 4 + 32) >> "%~dp0\prompt.vbs"
echo If answer = 6 Then >> "%~dp0\prompt.vbs"
echo     WScript.Quit(0) >> "%~dp0\prompt.vbs"
echo Else >> "%~dp0\prompt.vbs"
echo     WScript.Quit(1) >> "%~dp0\prompt.vbs"
echo End If >> "%~dp0\prompt.vbs"

cscript //nologo "%~dp0\prompt.vbs"
if %errorlevel% neq 0 (
    del "%~dp0\prompt.vbs"
    endlocal
    exit /b
)
del "%~dp0\prompt.vbs"

echo.
echo Checking HD / SSD integrity. . .
echo.

chkdsk /f /r
echo.

echo Starting Memory Check Tool. . .
MdSched
exit