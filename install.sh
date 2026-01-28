#!/bin/bash

#######################################
# Humanizer Skills Installer
# Description: Installs humanizer skills for Claude Code (English, German, Chinese)
# Author: Humanizer Project
# Date: 2026-01-28
#######################################

set -e  # Exit on error
set -u  # Exit on undefined variable
set -o pipefail  # Exit on pipe failure

readonly SCRIPT_NAME=$(basename "$0")
readonly SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# Color codes for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $*"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $*"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $*"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $*" >&2
}

# Detect Claude Code skills directory
detect_skills_directory() {
    local skills_dir=""

    # Try common locations
    if [[ -d "$HOME/.claude/skills" ]]; then
        skills_dir="$HOME/.claude/skills"
    elif [[ -d "$HOME/.config/claude/skills" ]]; then
        skills_dir="$HOME/.config/claude/skills"
    elif [[ -d "$HOME/Library/Application Support/Claude/skills" ]]; then
        skills_dir="$HOME/Library/Application Support/Claude/skills"
    else
        # Default to ~/.claude/skills
        skills_dir="$HOME/.claude/skills"
        log_warning "Claude Code skills directory not found"
        log_info "Will create directory at: $skills_dir"
    fi

    echo "$skills_dir"
}

# Create skills directory if it doesn't exist
ensure_skills_directory() {
    local skills_dir="$1"

    if [[ ! -d "$skills_dir" ]]; then
        log_info "Creating skills directory: $skills_dir"
        mkdir -p "$skills_dir" || {
            log_error "Failed to create skills directory: $skills_dir"
            exit 1
        }
    fi
}

# Install a single skill
install_skill() {
    local lang_code="$1"
    local lang_name="$2"
    local skills_dir="$3"
    local use_symlinks="${4:-false}"

    local source_file="$SCRIPT_DIR/$lang_code/SKILL.md"
    local target_dir="$skills_dir/humanizer-$lang_code"
    local target_file="$target_dir/SKILL.md"

    # Validate source file exists
    if [[ ! -f "$source_file" ]]; then
        log_error "Source file not found: $source_file"
        return 1
    fi

    # Create target directory
    mkdir -p "$target_dir" || {
        log_error "Failed to create directory: $target_dir"
        return 1
    }

    # Install skill (copy or symlink)
    if [[ "$use_symlinks" == "true" ]]; then
        # Use symlinks for development
        if [[ -L "$target_file" ]]; then
            log_warning "$lang_name skill already symlinked, updating..."
            rm "$target_file"
        elif [[ -f "$target_file" ]]; then
            log_warning "$lang_name skill exists, backing up..."
            mv "$target_file" "$target_file.backup.$(date +%Y%m%d_%H%M%S)"
        fi

        ln -s "$source_file" "$target_file" || {
            log_error "Failed to create symlink for $lang_name skill"
            return 1
        }
        log_success "$lang_name skill symlinked to: $target_dir"
    else
        # Copy files for production
        if [[ -f "$target_file" ]]; then
            log_warning "$lang_name skill already exists, backing up..."
            mv "$target_file" "$target_file.backup.$(date +%Y%m%d_%H%M%S)"
        fi

        cp "$source_file" "$target_file" || {
            log_error "Failed to copy $lang_name skill"
            return 1
        }
        log_success "$lang_name skill installed to: $target_dir"
    fi
}

# Verify installation
verify_installation() {
    local skills_dir="$1"
    local errors=0

    log_info "Verifying installation..."

    for lang in "en" "de" "zh"; do
        local target_file="$skills_dir/humanizer-$lang/SKILL.md"
        if [[ -f "$target_file" ]] || [[ -L "$target_file" ]]; then
            log_success "✓ humanizer-$lang installed"
        else
            log_error "✗ humanizer-$lang NOT found"
            ((errors++))
        fi
    done

    return $errors
}

# Display usage instructions
show_usage() {
    cat << EOF
${BLUE}Humanizer Skills Installer${NC}

Usage: $SCRIPT_NAME [OPTIONS]

Options:
    -s, --symlink       Use symlinks instead of copying (for development)
    -d, --directory     Specify custom skills directory
    -h, --help          Show this help message

Examples:
    $SCRIPT_NAME                    # Install with copying
    $SCRIPT_NAME --symlink          # Install with symlinks (dev mode)
    $SCRIPT_NAME -d ~/.claude/skills # Install to custom directory

This script installs three language variants:
    • humanizer-en  (English)
    • humanizer-de  (German)
    • humanizer-zh  (Simplified Chinese)

After installation, use in Claude Code:
    /humanizer      (English)
    /humanizer-de   (German)
    /humanizer-zh   (Chinese)
EOF
}

# Main installation function
main() {
    local use_symlinks=false
    local custom_dir=""

    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -s|--symlink)
                use_symlinks=true
                shift
                ;;
            -d|--directory)
                custom_dir="$2"
                shift 2
                ;;
            -h|--help)
                show_usage
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                show_usage
                exit 1
                ;;
        esac
    done

    # Banner
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  Humanizer Skills Installer v1.0      ║${NC}"
    echo -e "${BLUE}║  Installing Claude Code Skills        ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
    echo ""

    # Detect or use custom skills directory
    local skills_dir
    if [[ -n "$custom_dir" ]]; then
        skills_dir="$custom_dir"
        log_info "Using custom directory: $skills_dir"
    else
        skills_dir=$(detect_skills_directory)
        log_info "Detected skills directory: $skills_dir"
    fi

    # Ensure directory exists
    ensure_skills_directory "$skills_dir"

    # Install mode
    if [[ "$use_symlinks" == "true" ]]; then
        log_info "Installation mode: Symlink (development)"
    else
        log_info "Installation mode: Copy (production)"
    fi
    echo ""

    # Install all three language skills
    log_info "Installing language skills..."
    install_skill "en" "English" "$skills_dir" "$use_symlinks"
    install_skill "de" "German" "$skills_dir" "$use_symlinks"
    install_skill "zh" "Simplified Chinese" "$skills_dir" "$use_symlinks"
    echo ""

    # Verify installation
    if verify_installation "$skills_dir"; then
        echo ""
        log_success "All skills installed successfully!"
        echo ""
        echo -e "${GREEN}Next steps:${NC}"
        echo "  1. Restart Claude Code (if running)"
        echo "  2. Use skills with:"
        echo "     ${BLUE}/humanizer${NC}     - English text humanization"
        echo "     ${BLUE}/humanizer-de${NC}  - German text humanization"
        echo "     ${BLUE}/humanizer-zh${NC}  - Chinese text humanization"
        echo ""
        echo "For more information, see: README.md"
    else
        log_error "Some skills failed to install"
        exit 1
    fi
}

# Run main function
main "$@"
