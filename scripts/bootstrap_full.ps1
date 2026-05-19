<#
Interactive bootstrap that can optionally install recommended tools via Chocolatey.
Run only with admin privileges. Review before running.
#>
param(
  [switch]$InstallTools
)

Write-Host "Full bootstrap: creating folders (same as lightweight bootstrap)"
# Invoke the lightweight bootstrap located in the same scripts folder
if (Test-Path "$PSScriptRoot\bootstrap.ps1") {
  & "$PSScriptRoot\bootstrap.ps1"
} else {
  Write-Host "Lightweight bootstrap not found at $PSScriptRoot\bootstrap.ps1"
}

if ($InstallTools) {
  Write-Host "Installing recommended tools via Chocolatey (requires admin)."
  if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey not found. Visit https://chocolatey.org/install to install. Exiting."; exit 1
  }
  $tools = @("git","r.project","quarto","7zip")
  foreach ($t in $tools) { choco install $t -y }
  Write-Host "Tool install complete. Please verify R and Quarto paths in VS Code settings."
} else {
  Write-Host "Run with -InstallTools to install optional system tools."
}
