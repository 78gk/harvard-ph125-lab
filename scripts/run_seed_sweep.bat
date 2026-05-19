@echo off
"C:\Program Files\R\R-4.6.0\bin\Rscript.exe" "%~dp0seed_sweep_best_feature.R"
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%