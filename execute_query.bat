@echo off
color 0a

if "%1"=="" goto nopasswd

set "PGPASSWORD=%1"

echo Dropping database...
dropdb -U postgres -w --if-exists battles

echo.
echo.
echo Creating database...
createdb -E UTF8 -U postgres battles

echo.
echo.
echo Executing query...
psql -U postgres -d battles -f battles.sql > "errors_%USERNAME%.log" 2>&1

echo.
echo.
echo Finished!
goto exit_

:nopasswd
echo Please input a passwd
echo Usage: "execute_query <psql password>"

:exit_
pause
color 07
exit /B
