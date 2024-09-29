@echo off
setlocal

REM Check for administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative permissions...
    powershell -command "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c, %~f0' -Verb RunAs"
    exit /b
)

REM Define the path where PsExec will be downloaded
set "PSEXEC_PATH=C:\Tools\PsExec\PsExec.exe"
set "SCRIPT_PATH=C:\Scripts\OpenSystemCmd.bat"

REM Create the directory for PsExec if it doesn't exist
if not exist "C:\Tools\PsExec" (
    mkdir "C:\Tools\PsExec"
)

REM Check if PsExec exists
if not exist "%PSEXEC_PATH%" (
    echo Downloading PsExec...
    powershell -command "Invoke-WebRequest -Uri 'https://github.com/Maksymilian-cloud/PsExec/raw/main/PsExec.exe' -OutFile '%PSEXEC_PATH%'"
)

REM Create the script to open the command prompt with SYSTEM privileges
(
    echo @echo off
    echo start "" "%PSEXEC_PATH%" -i -s cmd.exe
) > "%SCRIPT_PATH%"

REM Create the registry entry
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Open System's Command Prompt" /ve /d "Open System's Command Prompt" /f
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Open System's Command Prompt\command" /ve /d "%SCRIPT_PATH%" /f

echo Setup complete! You can now right-click on the desktop to use the new option.

endlocal
