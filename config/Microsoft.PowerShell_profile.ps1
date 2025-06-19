# --- Define Color Variables ---
# Assign standard PowerShell color names to variables for readability.
$Color_Username = "DarkMagenta"
$Color_AtSign = "White"
$Color_Hostname = "Green"
$Color_InText = "White"
$Color_Directory = "Yellow"
$Color_GitBranch = "Cyan"
$Color_PromptSymbol = "White"

# --- Custom Git Branch Function ---
# Returns the current Git branch name if in a repository.
function Get-GitBranchName {
    # Suppress errors if not in a Git repo.
    if (-not (git rev-parse --is-inside-work-tree 2>$null)) {
        return $null
    }
    # Get and trim the current branch name.
    $branch_name = (git rev-parse --abbrev-ref HEAD 2>$null).Trim()
    # Return the branch name in parentheses if valid.
    if (-not [string]::IsNullOrWhiteSpace($branch_name) -and $branch_name -ne "HEAD") {
        return " ($branch_name)"
    }
    return $null
}

# --- Custom Prompt Function ---
# Defines the appearance of your PowerShell command prompt.
function prompt {
    # Print username
    Write-Host "$env:USERNAME" -NoNewline -ForegroundColor $Color_Username

    # Print separator '@'
    Write-Host "@" -NoNewline -ForegroundColor $Color_AtSign

    # Print hostname, followed by a space
    Write-Host "$env:COMPUTERNAME " -NoNewline -ForegroundColor $Color_Hostname

    # Print 'in ' text
    Write-Host "in " -NoNewline -ForegroundColor $Color_InText

    # Print current base directory
    Write-Host (Split-Path -Leaf (Get-Location).Path) -NoNewline -ForegroundColor $Color_Directory

    # Get and print Git branch if available
    $gitBranch = Get-GitBranchName
    if ($gitBranch) {
        Write-Host "$gitBranch" -NoNewline -ForegroundColor $Color_GitBranch
    }

    # Newline to separate the main prompt line from the prompt symbol
    Write-Host "" # Prints a newline

    # Print prompt symbol and return an empty string
    return "-> " # Return empty string as Write-Host already printed the prompt
}

