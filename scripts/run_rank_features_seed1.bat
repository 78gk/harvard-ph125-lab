@echo off
"C:\Program Files\R\R-4.6.0\bin\Rscript.exe" "%~dp0rank_features_seed1.R"
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%