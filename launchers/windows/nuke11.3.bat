@echo off

set __app__="Nuke11.3v2"
set __exe__="C:\Program Files\Nuke11.3v2\Nuke11.3.exe"
if not exist %__exe__% goto :missing_app

start %__app__% %__exe__% %*

goto :eof

:missing_app
    echo ERROR: %__app__% not found in %__exe__%
    exit /B 1
