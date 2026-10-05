@echo off
setlocal EnableExtensions
rem Build the release package: clean -> package (.vsix) -> artifact\.
rem This script does not run any Git or GitHub operation.

pushd "%~dp0" || exit /b 1

set "OUT_DIR=%CD%\artifact"

where node >nul 2>&1
if errorlevel 1 (
  echo ERROR: node was not found in PATH.
  popd
  exit /b 1
)
where npx >nul 2>&1
if errorlevel 1 (
  echo ERROR: npx was not found in PATH.
  popd
  exit /b 1
)

for /f "usebackq delims=" %%V in (`node -p "require('./package.json').version"`) do set "VERSION=%%V"
for /f "usebackq delims=" %%N in (`node -p "require('./package.json').name"`) do set "NAME=%%N"
if not defined VERSION (
  echo ERROR: could not read version from package.json.
  popd
  exit /b 1
)
if not defined NAME (
  echo ERROR: could not read name from package.json.
  popd
  exit /b 1
)

rem clean: only the generated artifact directory directly under this repository
if exist "%OUT_DIR%" rmdir /s /q "%OUT_DIR%"
if exist "%OUT_DIR%" (
  echo ERROR: failed to clean "%OUT_DIR%".
  popd
  exit /b 1
)
mkdir "%OUT_DIR%" || (
  popd
  exit /b 1
)

set "VSIX=%OUT_DIR%\%NAME%-v%VERSION%.vsix"
call npx --yes @vscode/vsce package --out "%VSIX%"
if errorlevel 1 (
  echo ERROR: vsce package failed.
  popd
  exit /b 1
)
if not exist "%VSIX%" (
  echo ERROR: "%VSIX%" was not created.
  popd
  exit /b 1
)

echo Created: %VSIX%
popd
exit /b 0
