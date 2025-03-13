@echo off
setlocal enabledelayedexpansion

set "mod_json=mod_info\mod.json"
set "jq_path=include\jq-1.7.1.exe"

for /f "delims=" %%i in ('%jq_path% -r ".id" %mod_json%') do set "mod_name=%%i"
set "mod_dir=%USERPROFILE%\AppData\Roaming\beatblock\Mods\!mod_name!"

rmdir /s /q "!mod_dir!"

endlocal