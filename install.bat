@echo off
REM Humanizer Skills Installer - Batch Wrapper
REM This script launches the PowerShell installer

echo.
echo ============================================
echo   Humanizer Skills Installer
echo   Launching PowerShell installer...
echo ============================================
echo.

REM Check if PowerShell is available
where powershell >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: PowerShell is not available on this system
    echo Please install PowerShell or run install.ps1 directly
    pause
    exit /b 1
)

REM Launch PowerShell installer
powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1" %*

REM Check result
if %ERRORLEVEL% EQU 0 (
    echo.
    echo Installation completed successfully!
) else (
    echo.
    echo Installation failed. Please check the error messages above.
)

echo.
pause
