<#
Bootstrap script for Windows (review before running).
It does NOT auto-install system packages without consent.
#>
param()

Write-Host "Bootstrap: creating folder structure and placeholders"

$paths = @(
  "datasets",
  "notebooks",
  "assignments",
  "outputs/figures",
  "outputs/reports",
  "scripts",
  "prompts",
  "memory",
  "references",
  "renv"
)

foreach ($p in $paths) {
  $full = Join-Path -Path (Get-Location) -ChildPath $p
  if (-not (Test-Path $full)) { New-Item -ItemType Directory -Path $full | Out-Null }
}
Write-Host "Created folders. Next: initialize git and renv in R as needed."
Write-Host "Bootstrap complete. Review README for next steps. To install system tools run scripts\bootstrap_full.ps1 -InstallTools (admin)."
