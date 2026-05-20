param(
  [string]$Rscript = 'Rscript'
)

Write-Host "Running project scripts using Rscript: $Rscript"

## Use full path to Rscript.exe if it's not on PATH.
& $Rscript -e "source('renv/activate.R'); source('scripts/section6_answers.R')"
& $Rscript -e "source('renv/activate.R'); source('scripts/movielens_section_answers.R')"
& $Rscript -e "source('renv/activate.R'); source('scripts/schools_regularization_answers.R')"
& $Rscript -e "source('renv/activate.R'); source('scripts/svd_q3_compute.R')"

Write-Host "Run completed. Check outputs/figures for generated plots and scripts/*.R for logs." 
