@echo off
setlocal enabledelayedexpansion

set "APP_PATH=%~dp0index.html"
set "APP_PATH=!APP_PATH:\=/!"
set "APP_URL=file:///!APP_PATH!"

:: Try Microsoft Edge (built into Windows 10 and 11)
for %%P in (
    "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
    "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
    "%LocalAppData%\Microsoft\Edge\Application\msedge.exe"
) do (
    if exist %%P (
        start "" %%P --app="!APP_URL!" --window-size=1200,820
        exit /b 0
    )
)

:: Try Google Chrome
for %%P in (
    "%ProgramFiles%\Google\Chrome\Application\chrome.exe"
    "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
    "%LocalAppData%\Google\Chrome\Application\chrome.exe"
) do (
    if exist %%P (
        start "" %%P --app="!APP_URL!" --window-size=1200,820
        exit /b 0
    )
)

:: Fallback: open in default browser (will have browser UI)
echo Note: Edge/Chrome not found. Opening in default browser instead.
start "" "!APP_URL!"
endlocal
