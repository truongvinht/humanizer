<#
.SYNOPSIS
    Humanizer Skills Installer for Claude Code (Windows)

.DESCRIPTION
    Installs humanizer skills for Claude Code in three languages:
    - English (humanizer-en)
    - German (humanizer-de)
    - Simplified Chinese (humanizer-zh)

.PARAMETER Symlink
    Use symlinks instead of copying files (requires admin privileges)

.PARAMETER Directory
    Specify custom skills directory

.EXAMPLE
    .\install.ps1
    Installs skills by copying files

.EXAMPLE
    .\install.ps1 -Symlink
    Installs skills using symlinks (requires admin)

.EXAMPLE
    .\install.ps1 -Directory "C:\Custom\Path"
    Installs to custom directory
#>

[CmdletBinding()]
param(
    [switch]$Symlink,
    [string]$Directory = ""
)

# Script configuration
$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Color functions
function Write-ColorOutput {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

function Write-Info {
    param([string]$Message)
    Write-ColorOutput "[INFO] $Message" "Cyan"
}

function Write-Success {
    param([string]$Message)
    Write-ColorOutput "[SUCCESS] $Message" "Green"
}

function Write-Warning {
    param([string]$Message)
    Write-ColorOutput "[WARNING] $Message" "Yellow"
}

function Write-ErrorMessage {
    param([string]$Message)
    Write-ColorOutput "[ERROR] $Message" "Red"
}

# Detect Claude Code skills directory
function Get-SkillsDirectory {
    $possiblePaths = @(
        "$env:USERPROFILE\.claude\skills",
        "$env:APPDATA\Claude\skills",
        "$env:LOCALAPPDATA\Claude\skills"
    )

    foreach ($path in $possiblePaths) {
        if (Test-Path $path) {
            return $path
        }
    }

    # Default to first option
    Write-Warning "Claude Code skills directory not found"
    Write-Info "Will create directory at: $($possiblePaths[0])"
    return $possiblePaths[0]
}

# Ensure skills directory exists
function Ensure-SkillsDirectory {
    param([string]$SkillsDir)

    if (-not (Test-Path $SkillsDir)) {
        Write-Info "Creating skills directory: $SkillsDir"
        try {
            New-Item -ItemType Directory -Path $SkillsDir -Force | Out-Null
        }
        catch {
            Write-ErrorMessage "Failed to create skills directory: $SkillsDir"
            Write-ErrorMessage $_.Exception.Message
            exit 1
        }
    }
}

# Check if running as administrator (for symlinks)
function Test-Administrator {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Install a single skill
function Install-Skill {
    param(
        [string]$LangCode,
        [string]$LangName,
        [string]$SkillsDir,
        [bool]$UseSymlinks = $false
    )

    $sourceFile = Join-Path $ScriptDir "$LangCode\SKILL.md"
    $targetDir = Join-Path $SkillsDir "humanizer-$LangCode"
    $targetFile = Join-Path $targetDir "SKILL.md"

    # Validate source file exists
    if (-not (Test-Path $sourceFile)) {
        Write-ErrorMessage "Source file not found: $sourceFile"
        return $false
    }

    # Create target directory
    try {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }
    catch {
        Write-ErrorMessage "Failed to create directory: $targetDir"
        return $false
    }

    # Backup existing file
    if (Test-Path $targetFile) {
        $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
        $backupFile = "$targetFile.backup.$timestamp"
        Write-Warning "$LangName skill exists, backing up..."
        Move-Item -Path $targetFile -Destination $backupFile -Force
    }

    # Install skill (copy or symlink)
    try {
        if ($UseSymlinks) {
            # Create symbolic link (requires admin)
            New-Item -ItemType SymbolicLink -Path $targetFile -Target $sourceFile -Force | Out-Null
            Write-Success "$LangName skill symlinked to: $targetDir"
        }
        else {
            # Copy file
            Copy-Item -Path $sourceFile -Destination $targetFile -Force
            Write-Success "$LangName skill installed to: $targetDir"
        }
        return $true
    }
    catch {
        Write-ErrorMessage "Failed to install $LangName skill"
        Write-ErrorMessage $_.Exception.Message
        return $false
    }
}

# Verify installation
function Test-Installation {
    param([string]$SkillsDir)

    Write-Info "Verifying installation..."
    $errors = 0

    $languages = @(
        @{Code = "en"; Name = "English"},
        @{Code = "de"; Name = "German"},
        @{Code = "zh"; Name = "Simplified Chinese"}
    )

    foreach ($lang in $languages) {
        $targetFile = Join-Path $SkillsDir "humanizer-$($lang.Code)\SKILL.md"
        if (Test-Path $targetFile) {
            Write-Success "✓ humanizer-$($lang.Code) installed"
        }
        else {
            Write-ErrorMessage "✗ humanizer-$($lang.Code) NOT found"
            $errors++
        }
    }

    return ($errors -eq 0)
}

# Display usage instructions
function Show-Usage {
    $usage = @"

Humanizer Skills Installer for Windows

Usage: .\install.ps1 [OPTIONS]

Options:
    -Symlink            Use symlinks instead of copying (requires admin)
    -Directory <path>   Specify custom skills directory
    -Help               Show this help message

Examples:
    .\install.ps1                        # Install with copying
    .\install.ps1 -Symlink               # Install with symlinks (run as admin)
    .\install.ps1 -Directory "C:\Path"   # Install to custom directory

This script installs three language variants:
    • humanizer-en  (English)
    • humanizer-de  (German)
    • humanizer-zh  (Simplified Chinese)

After installation, use in Claude Code:
    /humanizer      (English)
    /humanizer-de   (German)
    /humanizer-zh   (Chinese)

"@
    Write-Host $usage
}

# Main installation function
function Main {
    # Display banner
    Write-Host ""
    Write-ColorOutput "╔════════════════════════════════════════╗" "Cyan"
    Write-ColorOutput "║  Humanizer Skills Installer v1.0      ║" "Cyan"
    Write-ColorOutput "║  Installing Claude Code Skills        ║" "Cyan"
    Write-ColorOutput "╚════════════════════════════════════════╝" "Cyan"
    Write-Host ""

    # Check for help
    if ($Help) {
        Show-Usage
        exit 0
    }

    # Check admin privileges if using symlinks
    if ($Symlink -and -not (Test-Administrator)) {
        Write-ErrorMessage "Symlink mode requires administrator privileges"
        Write-Info "Please run PowerShell as Administrator or remove -Symlink flag"
        exit 1
    }

    # Detect or use custom skills directory
    if ($Directory) {
        $skillsDir = $Directory
        Write-Info "Using custom directory: $skillsDir"
    }
    else {
        $skillsDir = Get-SkillsDirectory
        Write-Info "Detected skills directory: $skillsDir"
    }

    # Ensure directory exists
    Ensure-SkillsDirectory -SkillsDir $skillsDir

    # Installation mode
    if ($Symlink) {
        Write-Info "Installation mode: Symlink (development)"
    }
    else {
        Write-Info "Installation mode: Copy (production)"
    }
    Write-Host ""

    # Install all three language skills
    Write-Info "Installing language skills..."
    $success = $true
    $success = (Install-Skill -LangCode "en" -LangName "English" -SkillsDir $skillsDir -UseSymlinks $Symlink) -and $success
    $success = (Install-Skill -LangCode "de" -LangName "German" -SkillsDir $skillsDir -UseSymlinks $Symlink) -and $success
    $success = (Install-Skill -LangCode "zh" -LangName "Simplified Chinese" -SkillsDir $skillsDir -UseSymlinks $Symlink) -and $success
    Write-Host ""

    # Verify installation
    if ($success -and (Test-Installation -SkillsDir $skillsDir)) {
        Write-Host ""
        Write-Success "All skills installed successfully!"
        Write-Host ""
        Write-ColorOutput "Next steps:" "Green"
        Write-Host "  1. Restart Claude Code (if running)"
        Write-Host "  2. Use skills with:"
        Write-ColorOutput "     /humanizer" "Cyan" -NoNewline
        Write-Host "     - English text humanization"
        Write-ColorOutput "     /humanizer-de" "Cyan" -NoNewline
        Write-Host "  - German text humanization"
        Write-ColorOutput "     /humanizer-zh" "Cyan" -NoNewline
        Write-Host "  - Chinese text humanization"
        Write-Host ""
        Write-Host "For more information, see: README.md"
    }
    else {
        Write-ErrorMessage "Some skills failed to install"
        exit 1
    }
}

# Run main function
try {
    Main
}
catch {
    Write-ErrorMessage "Installation failed with error:"
    Write-ErrorMessage $_.Exception.Message
    exit 1
}
