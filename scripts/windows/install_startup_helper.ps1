$ErrorActionPreference = "Stop"

$startupDir = [Environment]::GetFolderPath("Startup")
$launcherPath = Join-Path $startupDir "claude_bridge_helper.cmd"
$helperPath = Join-Path $PSScriptRoot "claude_bridge_helper.ps1"

if (-not (Test-Path -LiteralPath $helperPath)) {
    throw "helper not found: $helperPath"
}

$content = "@echo off`r`npowershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$helperPath`"`r`n"
Set-Content -LiteralPath $launcherPath -Value $content -Encoding ASCII

Write-Host "Installed startup launcher to $launcherPath"
