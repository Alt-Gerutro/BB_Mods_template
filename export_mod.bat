@echo off
setlocal enabledelayedexpansion
setlocal enableextensions

set "mod_json=mod_info\mod.json"
set "jq_path=include\jq.exe"
set "7z_path=include\7zr.exe"
set "tmp_dir=tmp"

echo Checking if mod.json exists at: "%mod_json%"
if not exist "%mod_json%" (
    echo File "%mod_json%" does not exist.
    exit /b 1
)

if not exist "%jq_path%" (
    echo jq executable "%jq_path%" not found.
    exit /b 1
)

echo Getting mod id from JSON...
for /f "delims=" %%i in ('%jq_path% -r ".id" %mod_json%') do set "mod_name=%%i"

echo mod_name="%mod_name%"

if "!mod_name!"=="" (
    echo Cannot get id from "%mod_json%".
    exit /b 1
)

if exist "%tmp_dir%\!mod_name!" (
    echo Folder with mod id "!mod_name!" already exists.
    echo Removing...
    rd /s /q !tmp_dir!
)

echo Creating directory "%tmp_dir%\!mod_name!"...
mkdir "%tmp_dir%\!mod_name!"
if errorlevel 1 (
    echo Failed to create directory "%tmp_dir%\!mod_name!".
    exit /b 1
)

echo Copying files to "%tmp_dir%\!mod_name!"...
xcopy "mod_info\*" "%tmp_dir%\!mod_name!\" /e /h /k /q /r /c /y 
xcopy "src" "%tmp_dir%\!mod_name!\" /e /h /k /q /r /c /y
if errorlevel 1 (
    echo Failed to copy files to "%tmp_dir%\!mod_name!".
    exit /b 1
)

echo Getting mod version from JSON...
for /f "delims=" %%i in ('%jq_path% -r ".version" %mod_json%') do set "mod_version=%%i"

if "!mod_version!"=="" (
    echo Cannot get version from "%mod_json%".
    exit /b 1
)

set "archive_name=!mod_name!_!mod_version!.zip"
echo Archive name: "!archive_name!"

echo Checking for existing !archive_name!
if exist !archive_name! (
    echo Archive already exist. Removing...
    del /s /q !archive_name!
)

echo Zipping files...
"!7z_path!" a -r !archive_name! ./!tmp_dir!/*

echo Deleting tmp folder... 
rd /s /q !tmp_dir!

endlocal
endlocal
echo Mod extraction complete.
pause