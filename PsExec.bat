@echo off
setlocal

REM Check for administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative permissions...
    powershell -command "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c, %~f0' -Verb RunAs"
    exit /b
)

REM Define the paths for PsExec and the script in %APPDATA%
set "APPDATA_PATH=%APPDATA%"
set "PSEXEC_PATH=%APPDATA%\PsExec.exe"
set "SCRIPT_PATH=%APPDATA%\OpenSystemCmd.bat"

REM Check if PsExec exists
if not exist "%PSEXEC_PATH%" (
    echo Downloading PsExec...
    powershell -command "Invoke-WebRequest -Uri 'https://github.com/Maksymilian-cloud/PsExec/raw/main/PsExec.exe' -OutFile '%PSEXEC_PATH%'" || (echo Failed to download PsExec & exit /b 1)
)

REM Create the script to open the command prompt with SYSTEM privileges
(
    echo @echo off
    echo start "" "%PSEXEC_PATH%" -i -s cmd.exe
) > "%SCRIPT_PATH%" || (echo Failed to create script: %SCRIPT_PATH% & exit /b 1)

REM Create the registry entry
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Open System's Command Prompt" /ve /d "Open System's Command Prompt" /f || (echo Failed to create registry entry & exit /b 1)
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Open System's Command Prompt\command" /ve /d "%SCRIPT_PATH%" /f || (echo Failed to create command registry entry & exit /b 1)

echo Setup complete! You can now right-click on the desktop to use the new option.

endlocal
