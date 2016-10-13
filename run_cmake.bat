@ECHO OFF
set PATH=%PATH%;%VS140COMNTOOLS%
call vsvars32.bat
md VS2015
cd VS2015
cmake -G "Visual Studio 14 2015" ../
cd ../

md VS2015Release
if %ERRORLEVEL% NEQ 0 (
	rmdir /s /q VS2015Release
	md VS2015Release
)
cd VS2015Release
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ../

cd ../
md VS2015Debug
if %ERRORLEVEL% NEQ 0 (
	rmdir /s /q VS2015Debug
	md VS2015Debug
)
cd VS2015Debug
cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug ../
