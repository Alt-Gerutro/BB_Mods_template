@echo off
setlocal enabledelayedexpansion

set "mod_json=mod_info\mod.json"
set "jq_path=include\jq.exe"
set "mods_dir=%USERPROFILE%\AppData\Roaming\beatblock\Mods"

echo Checking paths:
echo mod_json="%mod_json%"
echo jq_path="%jq_path%"
echo mods_dir="%mods_dir%"

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

if exist "%mods_dir%\!mod_name!" (
    echo Folder with mod id "!mod_name!" already exists.
    echo Abort.
    exit /b 1
)

echo Creating directory "%mods_dir%\!mod_name!"...
mkdir "%mods_dir%\!mod_name!"
if errorlevel 1 (
    echo Failed to create directory "%mods_dir%\!mod_name!".
    exit /b 1
)

echo Copying files to "%mods_dir%\!mod_name!"...
xcopy "mod_info\*" "%mods_dir%\!mod_name!\" /e /h /k /q /r /c /y 
xcopy "src" "%mods_dir%\!mod_name!\" /e /h /k /q /r /c /y
if errorlevel 1 (
    echo Failed to copy files to "%mods_dir%\!mod_name!".
    exit /b 1
)

endlocal
echo Mod installation complete.
pause