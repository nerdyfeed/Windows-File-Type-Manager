@ECHO OFF
title Windows File Type Manager
:menu
mode 58,13
color 09
cls
echo ******** Windows File Type Manager ************
echo ** 1) Add type                             **
echo ** 2) Delete type                          **
echo ** 3) Reload Explorer                      **
echo ** 4) Quit                                 **
echo *********** by nerdyfeed v0.2 *****************
echo.
set/p "cho=Enter [1-4]:"
if %cho%==1 goto addType
if %cho%==2 goto removeType
if %cho%==3 goto reloadExplorer
if %cho%==4 exit
cls
mode 1000

:addType
cls
color 0a
echo [ADD] Enter type:
set /p type=
if %type%==:q goto menu
if %type%==:wq exit
:run
REG ADD HKEY_CLASSES_ROOT\.%type%\ShellNew /v NullFile /t REG_SZ
pause
goto addType

:removeType
cls
color 0c
echo [REMOVE] Enter type:
set /p type=
if %type%==:q goto menu
if %type%==:wq exit
:run
REG DELETE HKEY_CLASSES_ROOT\.%type%\ShellNew /f
pause
goto removeType

:reloadExplorer
taskkill /im explorer.exe /f
start explorer.exe
goto menu