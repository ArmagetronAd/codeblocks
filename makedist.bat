@echo off
REM This batch file can be used to build the target directories "dist" and "debug" two layers up from here where the release
REM and debug binaries will be compiled to.

SET AA_DIR=..\armagetronad
SET LIBS_DIR=..\armagetronad_winlibs
SET DIST_DIR=..\dist
SET DEBUG_DIR=..\debug

echo making directory...
REM del %DIST_DIR% /S /Q
REM del %DEBUG_DIR% /S /Q
md %DIST_DIR%
md %DIST_DIR%\var
md %DEBUG_DIR%

echo Your personal configuration will be stored here. Updates will never touch this directory. > %DIST_DIR%\var\README.txt

echo generating version.h...
echo "CVS" > %AA_DIR%/version.h

echo copying files...
xcopy %AA_DIR%\arenas %DIST_DIR%\arenas /I /E /Y
xcopy %AA_DIR%\config %DIST_DIR%\config /I /E /Y
xcopy %AA_DIR%\doc %DIST_DIR%\doc /I /E /Y
xcopy %AA_DIR%\language %DIST_DIR%\language /I /E /Y
xcopy %AA_DIR%\models %DIST_DIR%\models /I /E /Y
xcopy %AA_DIR%\music %DIST_DIR%\music /I /E /Y
xcopy %AA_DIR%\sound %DIST_DIR%\sound /I /E /Y
xcopy %AA_DIR%\resource %DIST_DIR%\resource /I /E /Y
xcopy %AA_DIR%\textures %DIST_DIR%\textures /I /E /Y
xcopy %AA_DIR%\*.txt %DIST_DIR% /I /Y
copy %AA_DIR%\README %DIST_DIR%\README.txt /Y
copy %AA_DIR%\README-SDL %DIST_DIR%\README-SDL.txt /Y
rename %DIST_DIR%\config\aiplayers.cfg.in aiplayers.cfg
rename %DIST_DIR%\language\languages.txt.in languages.txt

echo copying binary only dlls ( WATCH FOR ERRORS! )...
xcopy %LIBS_DIR%\SDL_image\VisualC\graphics\lib\*.dll %DIST_DIR% /Y
xcopy %LIBS_DIR%\libxml2\lib\*.dll %DIST_DIR% /Y
xcopy %LIBS_DIR%\iconv\lib\*.dll %DIST_DIR% /Y

echo making debug...
xcopy %DIST_DIR% %DEBUG_DIR% /I /E /Y

SET AA_DIR=
SET LIBS_DIR=
SET DIST_DIR=
SET DEBUG_DIR=

echo done!
pause
