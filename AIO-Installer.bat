@echo off
:: Check if the script is running as administrator
openfiles >nul 2>&1
if '%errorlevel%' NEQ '0' (
    echo This script must be run as an administrator.
    pause
    exit /b
)

:: Check if Chocolatey is installed
where choco >nul 2>&1
if '%errorlevel%' NEQ '0' (
    echo Chocolatey is not installed. Installing Chocolatey...
    :: Install Chocolatey
    @powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "& {iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))}" || exit /b
    :: Add Chocolatey to PATH
    set "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)

:: Install Visual Studio Code, Python, and Git
echo Installing Visual Studio Code, Python, and Git using Chocolatey...
choco install vscode python git -y

:: Confirm installation
echo Installation complete. Verifying installations...

:: Check if Visual Studio Code is installed
where code >nul 2>&1
if '%errorlevel%' EQU '0' (
    echo Visual Studio Code is installed.
) else (
    echo Visual Studio Code installation failed.
)

:: Check if Python is installed
where python >nul 2>&1
if '%errorlevel%' EQU '0' (
    echo Python is installed.
) else (
    echo Python installation failed.
)

:: Check if Git is installed
where git >nul 2>&1
if '%errorlevel%' EQU '0' (
    echo Git is installed.
) else (
    echo Git installation failed.
)

pause
