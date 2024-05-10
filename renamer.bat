@echo off

set "file=CODEX.ini"

if not exist "%file%" (
    echo CODEX.ini file not found.
	echo NOTE: DON'T run this as admin!
	timeout /T 5 >nul
    exit /b
)
echo NOTE: You CAN'T have the same GameName across multiple downloads, or your siege WILL crash!

set /p newGameName=Enter new Gamename: 
set /p newUsername=Enter new Username: 

(for /f "tokens=1,* delims==" %%a in ('type "%file%"') do (
    if "%%a"=="GameName" (
        echo GameName=%newGameName%
    ) else if "%%a"=="UserName" (
        echo UserName=%newUsername%
    ) else (
        echo %%a=%%b
    )
)) > "%file%.tmp"

move /y "%file%.tmp" "%file%" > nul

echo Gamename and Username updated successfully!
timeout /T 3 >nul
