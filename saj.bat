@echo off
title Program Installation Menu

:: Array of programs to display
set programs[1]=Google Chrome
set urls[1]=https://dl.google.com/chrome/install/latest/chrome_installer.exe
set programs[2]=Brave Browser
set urls[2]=https://laptop-updates.brave.com/latest/win/BraveSetup.exe
set programs[3]=Mozilla Firefox
set urls[3]=https://download-installer.cdn.mozilla.net/pub/firefox/releases/latest/win64/en-US/Firefox%20Installer.exe
set programs[4]=Opera Browser
set urls[4]=https://download.opera.com/download/get/?partner=web&opsys=win&next=install&inst=full
set programs[5]=Discord
set urls[5]=https://dl.discordapp.net/win/latest/DiscordSetup.exe
set programs[6]=Malwarebytes
set urls[6]=https://data.malwarebytes.com/file/mb3-setup-consumer
set programs[7]=Python 3
set urls[7]=https://www.python.org/ftp/python/3.9.1/python-3.9.1-amd64.exe
set programs[8]=Node.js
set urls[8]=https://nodejs.org/dist/v16.14.0/node-v16.14.0-x64.msi
set programs[9]=Visual Studio Code
set urls[9]=https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user
set programs[10]=Steam
set urls[10]=https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe
set programs[11]=Epic Games
set urls[11]=https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download
set programs[12]=7-Zip
set urls[12]=https://www.7-zip.org/a/7z1900-x64.exe
set programs[13]=WinRAR
set urls[13]=https://www.rarlab.com/rar/winrar-x64-601.exe
set programs[14]=qBittorrent
set urls[14]=https://qbittorrent.org/download.php
set programs[15]=Spotify
set urls[15]=https://download.scdn.co/SpotifySetup.exe

:: Total number of programs
set total=15

:: Initialize selection state for each program (0 = not selected, 1 = selected)
for /L %%i in (1,1,%total%) do set selected[%%i]=0

:menu
cls
echo Select programs to install:
echo.
for /L %%i in (1,1,%total%) do (
    setlocal enabledelayedexpansion
    set program=!programs[%%i]!
    if !selected[%%i]!==1 (
        echo [X] %%i - !program!
    ) else (
        echo [ ] %%i - !program!
    )
    endlocal
)
echo.
echo Press number to toggle, A to select all, S to start installation, or Q to quit.

set "choice="
set /p "choice=> "
if /i "%choice%"=="Q" goto :end
if /i "%choice%"=="S" goto :install
if /i "%choice%"=="A" goto :select_all

:: Toggle selection for individual items
set /a num=choice
if %num% LEQ %total% (
    set /a "selected[%num%]=1-selected[%num%]"
)

goto :menu

:select_all
:: Mark all programs as selected
for /L %%i in (1,1,%total%) do set selected[%%i]=1
goto :menu

:install
cls
echo Installing selected programs...

:: Install selected programs
for /L %%i in (1,1,%total%) do (
    setlocal enabledelayedexpansion
    if !selected[%%i]!==1 (
        set program=!programs[%%i]!
        set url=!urls[%%i]!
        echo Installing !program!...
        powershell -Command "Start-Process -FilePath '!url!' -ArgumentList '/S' -Wait"
    )
    endlocal
)

echo.
echo Installation complete!
pause

:end
echo Exiting program...
exit
