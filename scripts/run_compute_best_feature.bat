@echo off
"C:\Program Files\R\R-4.6.0\bin\Rscript.exe" "%~dp0compute_best_feature.R"
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%