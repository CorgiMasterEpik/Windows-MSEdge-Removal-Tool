@echo off
set "BASE=C:\Program Files (x86)\Microsoft"

echo ============================================================
echo Windows MSEdge Removal Tool (WMRT) v0.1
echo ============================================================
echo.
echo WARNING:
echo This tool removes Microsoft Edge browser files and restricts
echo normal user write access to the Edge directories.
echo EdgeWebView2 is intentionally left untouched.
echo.
pause

echo.
echo --- Killing Edge ---
echo.

taskkill /f /im msedge.exe 2>nul
taskkill /f /im MicrosoftEdgeUpdate.exe 2>nul
taskkill /f /im MicrosoftEdgeUpdateBroker.exe 2>nul
taskkill /f /im MicrosoftEdgeUpdateCore.exe 2>nul
taskkill /f /im microsoftedgebrowser.exe 2>nul
taskkill /f /im msedge_proxy.exe 2>nul

echo.
echo --- Deleting Edge ---
echo.

del /f /s /q "%BASE%\Edge\*" 2>nul
for /d %%D in ("%BASE%\Edge\*") do rd /s /q "%%D" 2>nul

del /f /s /q "%BASE%\EdgeCore\*" 2>nul
for /d %%D in ("%BASE%\EdgeCore\*") do rd /s /q "%%D" 2>nul

del /f /s /q "%BASE%\EdgeUpdate\*" 2>nul
for /d %%D in ("%BASE%\EdgeUpdate\*") do rd /s /q "%%D" 2>nul

echo.
echo --- Restricting User Write Access ---
echo.

takeown /f "%BASE%\Edge" /r /d y
icacls "%BASE%\Edge" /grant Administrators:F /t
icacls "%BASE%\Edge" /remove:g Users /t
icacls "%BASE%\Edge" /grant Users:RX /t

echo.
echo --- Restricting User Write Access ---
echo.

takeown /f "%BASE%\EdgeCore" /r /d y
icacls "%BASE%\EdgeCore" /grant Administrators:F /t
icacls "%BASE%\EdgeCore" /remove:g Users /t
icacls "%BASE%\EdgeCore" /grant Users:RX /t

echo.
echo --- Restricting User Write Access ---
echo.

takeown /f "%BASE%\EdgeUpdate" /r /d y
icacls "%BASE%\EdgeUpdate" /grant Administrators:F /t
icacls "%BASE%\EdgeUpdate" /remove:g Users /t
icacls "%BASE%\EdgeUpdate" /grant Users:RX /t

echo.
echo ============================================================
echo Edge removal completed.
echo EdgeWebView2 was intentionally left untouched.
echo ============================================================
echo.
echo --- Operation Failed Successfully ---
echo (That's a joke. It's removed.)
pause