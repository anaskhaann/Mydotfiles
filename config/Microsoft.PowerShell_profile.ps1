# Color definitions for prompt elements
$Color_Username = "DarkMagenta"
$Color_AtSign = "White"
$Color_Hostname = "Green"
$Color_InText = "White"
$Color_Directory = "Yellow"
$Color_GitBranch = "Cyan"

# Configure PSReadLine to use white for all input text
Set-PSReadlineOption -Colors @{
    "Command" = "White"           
    "Parameter" = "DarkGray"       
    "Operator" = "White"           
    "Variable" = "Green"           
    "String" = "Cyan"              
    "Number" = "White"             
    "Type" = "Magenta"             
    "Comment" = "DarkGreen"        
    "Keyword" = "Blue"             
    "Error" = "Red"                
    "Member" = "White"             
    "Emphasis" = "Cyan"            
    "Selection" = "DarkBlue"       
    "Default" = "White"
}

# Get current Git branch name, returns null if not in a Git repository
function Get-GitBranchName {
    if (-not (git rev-parse --is-inside-work-tree 2>$null)) {
        return $null
    }
    
    $branch_name = (git rev-parse --abbrev-ref HEAD 2>$null).Trim()
    if (-not [string]::IsNullOrWhiteSpace($branch_name) -and $branch_name -ne "HEAD") {
        return " ($branch_name)"
    }
    return $null
}

# Custom prompt function
function prompt {
    # Build prompt: username@hostname in directory (git-branch)
    Write-Host "$env:USERNAME" -NoNewline -ForegroundColor $Color_Username
    Write-Host "@" -NoNewline -ForegroundColor $Color_AtSign
    Write-Host "$env:COMPUTERNAME " -NoNewline -ForegroundColor $Color_Hostname
    Write-Host "in " -NoNewline -ForegroundColor $Color_InText
    Write-Host (Split-Path -Leaf (Get-Location).Path) -NoNewline -ForegroundColor $Color_Directory
    
    # Add Git branch if available
    $gitBranch = Get-GitBranchName
    if ($gitBranch) {
        Write-Host "$gitBranch" -NoNewline -ForegroundColor $Color_GitBranch
    }
    
    Write-Host ""  # New line
    
    # Set console default colors for command output
    $Host.UI.RawUI.ForegroundColor = "White"
    
    return "-> "
}


# Aliases
# $ - for single arguments
# @ - for multiple arguments
# Git Aliases

function gs{
    git status
}

function ga {
    git add @args
}

function glo {
    git log --oneline
}

function gcmm {
    git commit -m "$args"
}