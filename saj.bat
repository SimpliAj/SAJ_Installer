@echo off
title Program Installation Menu

:: Array of programs to display
set programs[1]=Google Chrome
set packages[1]=googlechrome
set programs[2]=Brave Browser
set packages[2]=brave
set programs[3]=Mozilla Firefox
set packages[3]=firefox
set programs[4]=Opera Browser
set packages[4]=opera
set programs[5]=Discord
set packages[5]=discord
set programs[6]=Malwarebytes
set packages[6]=malwarebytes
set programs[7]=Python 3
set packages[7]=python
set programs[8]=Node.js
set packages[8]=nodejs
set programs[9]=Visual Studio Code
set packages[9]=vscode
set programs[10]=Steam
set packages[10]=steam
set programs[11]=Epic Games
set packages[11]=epicgameslauncher
set programs[12]=7-Zip
set packages[12]=7zip
set programs[13]=WinRAR
set packages[13]=winrar
set programs[14]=qBittorrent
set packages[14]=qbittorrent
set programs[15]=Spotify
set packages[15]=spotify

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
    set package=!packages[%%i]!
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
        set package=!packages[%%i]!
        echo Installing !package!...
        choco install !package! -y
    )
    endlocal
)

echo.
echo Installation complete!
pause

:end
echo Exiting program...
exit
