@echo off
"C:\Program Files\R\R-4.6.0\bin\Rscript.exe" "%~dp0q9_test_accuracy_seed1.R"
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%