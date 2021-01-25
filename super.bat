::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDpQRRCbPVeeCaIS5Of66/m78x9NBPInR47V3qaBKeQs+ErmeoISxWxdp8IcCSRRfR2lIAY3pg4=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCqDJGur2X4FJgtVTw+LMmz3EroT5NTo+vqCsHEOQfI6asLO1KSPI+td713hFQ==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
cls
echo.  
set name=Unpacking super v1.0   
set authors=[by Aditya Singh]  
set cecho=bin\cecho.exe
title %name% %authors%   
:main_menu 
cls          
echo ------------------------------------------------
%cecho%   {0E}Unpacking super v1.0 by Aditya Singh{#} 
echo.        
echo ------------------------------------------------
echo.
%cecho%  {02}1. Unpack Super{#}
echo.
%cecho%  {02}2. Clean all{#}
echo.
%cecho%  {02}3. Exit{#}
echo.
echo.
set /p number=* Select an option: 
if "%number%"=="1" goto unpacksuper
if "%number%"=="2" goto clean-all
if "%number%"=="3" goto Exit
if not "%number%"=="1" if not "%number%"=="2" if not "%number%"=="3"  goto main_menu 
:unpacksuper
cls
echo.
%cecho%   {0E}Unpacking Super started...{#} 
echo.
echo.
echo -------------------------------------------->> log.txt
echo      Unpacking and repacking v1.0         >> log.txt
echo           By %authors%            >> log.txt
echo -------------------------------------------->> log.txt
if exist bin\system.ext4 del bin\system.ext4
if exist bin\product.ext4 del bin\product.ext4
if exist bin\vendor.ext4 del bin\vendor.ext4
if exist %cd%\super.img (
rem copy super.img bin\tmp\super
%cecho%  -  {0B}Converting super.img to raw image{#}
echo.
bin\simg2img  super.img  bin\super-raw.img>nul 2>nul >> log.txt
cd bin
set cd=%cd%
cecho  -  {0B}unpacking super raw to ext4{#}
echo.
superunpack super-raw.img 
echo.
cecho  -  {0B}Extracting system{#}
7z x -y system.ext4 -o%cd%\tmp\system >nul 2>nul >> log.txt
echo.
cecho  -  {0B}Extracting product{#}
7z x -y product.ext4 -o%cd%\tmp\product >nul 2>nul >> log.txt
echo.
cecho  -  {0B}Extracting vendor{#}
7z x -y vendor.ext4 -o%cd%\tmp\vendor >nul 2>nul >> log.txt
echo.
cecho  -  {02}Unpack super finish{#}
echo.
cd ..
)else (
echo  -  Not found super.img
)
echo.
%cecho%  {02}1) open unpack super.img{#} (press 1)
echo.
%cecho%  {02}2) go to main menu{#}  (press 2) 
echo.
echo.
set /p number=* Select an option: 
if "%number%"=="1" explorer.exe "%cd%\tmp"
if "%number%"=="2" goto main_menu
if not "%number%"=="1" if not "%number%"=="2"
pause

:clean-all
cls
echo.   
if exist bin\system.ext4 del bin\system.ext4
if exist bin\product.ext4 del bin\product.ext4
if exist bin\vendor.ext4 del bin\vendor.ext4
if exist tmp rd /s /q tmp
if exist log.txt del log.txt
%cecho%  -  {02}Cleaned successfully{#}
echo.
%cecho%  {02}1) go to main menu{#} (press 1) 
echo.
echo.
set /p number=* Select an option: 
if "%number%"=="1" goto main_menu
if not "%number%"=="1" goto main_menu
pause

:Exit
exist


