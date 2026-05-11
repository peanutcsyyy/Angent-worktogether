$ErrorActionPreference = "Stop"

param(
    [Parameter(Mandatory = $true)]
    [string]$SessionName,

    [string]$Distro = "Ubuntu",

    [string]$AttachWrapperPath
)

if (-not $AttachWrapperPath) {
    $AttachWrapperPath = Join-Path $PSScriptRoot "claude_tmux_attach.cmd"
}

if (-not (Test-Path -LiteralPath $AttachWrapperPath)) {
    throw "attach wrapper not found: $AttachWrapperPath"
}

$arguments = @(
    "/k"
    "`"$AttachWrapperPath`""
    "`"$SessionName`""
    "`"$Distro`""
)

Start-Process -FilePath "cmd.exe" -ArgumentList $arguments | Out-Null
