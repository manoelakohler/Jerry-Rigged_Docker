@echo off
SET URL="http://localhost:5000"

:loop
SET HTTP=
for /f %%a in ( 'curl -k -s -o NUL -w "%%{http_code}" "%URL%"' ) do set HTTP=%%a
if "%HTTP%" == "200" (start "" http://localhost:5000) else (goto loop)

exit /b