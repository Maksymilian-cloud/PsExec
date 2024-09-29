# PsExec

## Overview
The PsExec project provides a batch script to run commands with SYSTEM privileges using PsExec, a utility that allows you to execute processes on remote systems and access administrative features.

## Features
- Run Command Prompt with SYSTEM privileges.
- Easy installation and setup via a batch script.
- Right-click context menu integration for quick access.

## Prerequisites
- Windows operating system.
- Administrative privileges to install and use the script.

## Installation Instructions

1. **Download PsExec Project Files**:
   - Clone the repository or download the ZIP file containing the project files from GitHub.

2. **Run the Setup Script**:
   - Locate the `SetupSystemCmd.bat` file.
   - Right-click on the file and select **Run as administrator**. This will:
     - Download the `PsExec.exe` utility from the provided link.
     - Create a batch script `PsExec.bat` on your desktop.
     - Add a right-click context menu option to open the Command Prompt with SYSTEM privileges.

3. **Complete Setup**:
   - Once the setup completes, you will see a message confirming that the setup was successful.

## Usage Instructions

- **Open System's Command Prompt**:
   - Right-click on the desktop.
   - Select **Open System's Command Prompt** from the context menu.
   - A message box will appear stating **"System's Command Prompt Started."** The Command Prompt will then open with SYSTEM privileges.

### Example Commands
Once in the SYSTEM Command Prompt, you can run any command with elevated privileges, such as:
```batch
whoami
net user
