# Verify everything works and start your first assignment

# Step 1: Check R works
"C:\Program Files\R\R-4.6.0\bin\Rscript.exe" -e "cat('R is working!\n'); print(R.version$version.string)"

# Step 2: Check Quarto works
quarto --version

# Step 3: Check renv works
"C:\Program Files\R\R-4.6.0\bin\Rscript.exe" -e "library(renv); cat('renv version:', packageVersion('renv'), '\n')"

Write-Host "✓ All systems operational! Ready to solve assignments." -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Open VS Code: code ." -ForegroundColor White
Write-Host "2. Install Roo Code or Cline extension" -ForegroundColor White
Write-Host "3. Read WORKFLOW.md for assignment process" -ForegroundColor White
Write-Host "4. Copy a prompt from prompts/roo-starter.md" -ForegroundColor White
Write-Host "5. Paste into Roo/Cline and let it generate your solution" -ForegroundColor White
