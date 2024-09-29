@echo off
setlocal

REM Define paths for PsExec and the script
set "DESKTOP_PATH=%USERPROFILE%\Desktop"
set "PSEXEC_PATH=%DESKTOP_PATH%\PsExec.exe"
set "SCRIPT_PATH=%DESKTOP_PATH%\PsExec.bat"

REM Check if PsExec exists and remove it
if exist "%PSEXEC_PATH%" (
    echo Removing PsExec from Desktop...
    del "%PSEXEC_PATH%"
)

REM Check if the uninstall script exists and remove it
if exist "%SCRIPT_PATH%" (
    echo Removing uninstall script from Desktop...
    del "%SCRIPT_PATH%"
)

REM Remove registry entry for the right-click context menu
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\Open System's Command Prompt" /f >nul 2>&1

echo PsExec has been uninstalled successfully!

endlocal
