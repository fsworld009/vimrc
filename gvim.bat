@echo off
set HOME=%~dp0
rem get parent folder
rem http://stackoverflow.com/questions/16623780/how-to-get-windows-batchs-parent-folder
for %%i in ("%~dp0..") do set "ROOT=%%~fi"

set PATH=%ROOT%\msys64\usr\bin\;%PATH%
set PATH=%ROOT%\bin\node.js\;%PATH%
set PATH=%ROOT%\bin\tidy\;%PATH%
set PATH=%ROOT%\bin\ctags\;%PATH%
set PATH=%ROOT%\bin\python2\;%PATH%

..\vim\gvim.exe
exit