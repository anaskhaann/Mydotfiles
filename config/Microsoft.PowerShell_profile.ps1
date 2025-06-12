# Get git branch name

function prompt {
    $gitBranch = & git branch --show-current 2>$null
    $cwd = Get-Location

    # Print current directory
    Write-Host "$cwd" -NoNewline -ForegroundColor DarkMagenta

    # Print Git branch in yellow (if exists)
    if ($gitBranch) {
        Write-Host " ($gitBranch)" -NoNewline -ForegroundColor Cyan
    }

    # Prompt symbol
    return "> "
}
