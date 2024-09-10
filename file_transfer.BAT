@echo off
echo Starting file transfer...

:: Source network share details
set SOURCE_PATH=\\172.40.20.11\Scale\Scale.xlsx

:: Destination network share details
set DEST_PATH=\\172.40.20.12\C$\Scale Files\Scale.xlsx

:: Ensure the destination directory exists
if not exist "\\172.40.20.12\C$\Scale Files" mkdir "\\172.40.20.12\C$\Scale Files"

:: Copy file from source to destination
echo Copying file from source to destination...
copy "%SOURCE_PATH%" "%DEST_PATH%"

if %errorlevel% neq 0 (
    echo Failed to copy file.
    exit /b %errorlevel%
)

echo File transfer completed successfully.