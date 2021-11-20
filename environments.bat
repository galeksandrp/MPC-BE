@ECHO OFF
SET "MPCBE_MSYS=%SYSTEMDRIVE%\msys64"
IF NOT DEFINED MPCBE_MINGW SET "MPCBE_MINGW=%MPCBE_MSYS%\mingw64"

SET "PARAMS=-property installationPath -products Microsoft.VisualStudio.Product.BuildTools"

IF /I "%COMPILER%" == "VS2017" (
  SET "PARAMS=%PARAMS% -version [15.0,16.0^)"
) ELSE IF /I "%COMPILER%" == "VS2022" (
  SET "PARAMS=%PARAMS% -latest -prerelease -version [,17.0)"
) ELSE (
  SET "PARAMS=%PARAMS% -latest"
)

SET "VSWHERE="%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" %PARAMS%"

FOR /f "delims=" %%A IN ('!VSWHERE!') DO SET "VCVARS=%%A\Common7\Tools\vsdevcmd.bat"
