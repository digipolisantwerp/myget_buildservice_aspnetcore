REM @echo Off
set config=%1
if "%config%" == "" (
   set config=Release
)

set version=
if not "%PackageVersion%" == "" (
   set version=-Version %PackageVersion%
)

REM Start Build
dnu build "src\SampleLib"
REM Build done
if not "%errorlevel%"=="0" goto failure

REM Unit tests
dnx  -p tests\SampleLib.Tests test
if not "%errorlevel%"=="0" goto failure

REM Package
REM mkdir Build
REM call %nuget% pack "myget_buildservicetest_aspnetcore\SampleLib.csproj" -symbols -o Build -p Configuration=%config% %version%
REM if not "%errorlevel%"=="0" goto failure

:success
REM exit 0

:failure
REM exit -1