#!/usr/bin/env bash
#
# Tokyn Installer
# https://github.com/jshmllr/tokyn
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/jshmllr/tokyn/main/install.sh | bash
#   curl -fsSL https://tokyn.design/install | bash
#
# Options:
#   --full         Install everything (default)
#   --minimal      Rules and commands only
#   --enhancement  No tokens (for shadcn/ui projects)
#   --cursor-only  Only install to Cursor
#   --claude-only  Only install to Claude Code
#   --opencode-only Only install to OpenCode
#

set -e

# ============================================
# Configuration
# ============================================

REPO_URL="https://github.com/jshmllr/tokyn"
REPO_RAW="https://raw.githubusercontent.com/jshmllr/tokyn/main"
VERSION="1.0.0"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m' # No Color

# ============================================
# Helper Functions
# ============================================

print_banner() {
    echo ""
    echo -e "${CYAN}┌─────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│${NC}  ${BOLD}Tokyn${NC} ${DIM}v${VERSION}${NC}                                  ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}  ${DIM}─────────────────────────────────────────────────────────${NC}  ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}  A UI design system for AI coding assistants.               ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}  Guides Claude Code, Cursor, and OpenCode to build          ${CYAN}│${NC}"
    echo -e "${CYAN}│${NC}  distinctive, accessible interfaces—not generic AI slop.    ${CYAN}│${NC}"
    echo -e "${CYAN}└─────────────────────────────────────────────────────────────┘${NC}"
    echo ""
}

log_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

log_success() {
    echo -e "${GREEN}✓${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

log_error() {
    echo -e "${RED}✗${NC} $1"
}

log_step() {
    echo -e "  ${DIM}→${NC} $1"
}

# ============================================
# Detection Functions
# ============================================

detect_cursor() {
    # Check for .cursor directory in common locations
    if [[ -d "$HOME/.cursor" ]] || command -v cursor &> /dev/null; then
        return 0
    fi
    # Check if we're in a project with .cursor
    if [[ -d ".cursor" ]]; then
        return 0
    fi
    return 1
}

detect_claude_code() {
    # Check for claude CLI
    if command -v claude &> /dev/null; then
        return 0
    fi
    # Check for .claude directory
    if [[ -d "$HOME/.claude" ]] || [[ -d ".claude" ]]; then
        return 0
    fi
    return 1
}

detect_opencode() {
    # Check for opencode CLI
    if command -v opencode &> /dev/null; then
        return 0
    fi
    # Check for .opencode directory
    if [[ -d "$HOME/.opencode" ]] || [[ -d ".opencode" ]]; then
        return 0
    fi
    return 1
}

# ============================================
# Installation Functions
# ============================================

create_directory() {
    local dir="$1"
    if [[ ! -d "$dir" ]]; then
        mkdir -p "$dir"
        log_step "Created $dir"
    fi
}

backup_file() {
    local file="$1"
    if [[ -f "$file" ]]; then
        local backup="${file}.backup.$(date +%Y%m%d%H%M%S)"
        cp "$file" "$backup"
        log_step "Backed up existing file to ${backup##*/}"
    fi
}

download_file() {
    local url="$1"
    local dest="$2"
    local name="$3"
    
    if curl -fsSL "$url" -o "$dest" 2>/dev/null; then
        log_step "$name"
        return 0
    else
        log_warning "Failed to download $name"
        return 1
    fi
}

# ============================================
# Cursor Installation
# ============================================

install_cursor() {
    local target="${1:-.cursor}"
    local mode="$2"
    
    echo ""
    log_info "Installing to Cursor (${target}/)..."
    
    # Create directories
    create_directory "${target}/rules"
    create_directory "${target}/commands"
    create_directory "${target}/skills/frontend-design/reference"
    
    # Rules
    download_file "${REPO_RAW}/.cursor/rules/workflow.mdc" "${target}/rules/workflow.mdc" "rules/workflow.mdc"
    download_file "${REPO_RAW}/.cursor/rules/interface-guidelines.mdc" "${target}/rules/interface-guidelines.mdc" "rules/interface-guidelines.mdc"
    
    # Commands
    local commands=(
        "rams" "teach-impeccable" "polish" "audit" "animate" "adapt"
        "bolder" "quieter" "clarify" "colorize" "critique" "delight"
        "extract" "harden" "normalize" "onboard" "optimize" "simplify"
    )
    
    for cmd in "${commands[@]}"; do
        download_file "${REPO_RAW}/.cursor/commands/${cmd}.md" "${target}/commands/${cmd}.md" "commands/${cmd}.md"
    done
    
    # Skills
    download_file "${REPO_RAW}/.cursor/skills/frontend-design/SKILL.md" "${target}/skills/frontend-design/SKILL.md" "skills/frontend-design/SKILL.md"
    
    local references=(
        "color-and-contrast" "interaction-design" "motion-design"
        "responsive-design" "spatial-design" "typography" "ux-writing"
    )
    
    for ref in "${references[@]}"; do
        download_file "${REPO_RAW}/.cursor/skills/frontend-design/reference/${ref}.md" "${target}/skills/frontend-design/reference/${ref}.md" "skills/frontend-design/reference/${ref}.md"
    done
    
    # Patterns (always install)
    create_directory "patterns"
    download_file "${REPO_RAW}/patterns/extension.md" "patterns/extension.md" "patterns/extension.md"
    download_file "${REPO_RAW}/patterns/elevation.md" "patterns/elevation.md" "patterns/elevation.md"
    download_file "${REPO_RAW}/patterns/composition.md" "patterns/composition.md" "patterns/composition.md"
    download_file "${REPO_RAW}/patterns/theming.md" "patterns/theming.md" "patterns/theming.md"
    
    # Tokens (full mode only)
    if [[ "$mode" == "full" ]]; then
        create_directory "tokens"
        download_file "${REPO_RAW}/tokens/primitives.css" "tokens/primitives.css" "tokens/primitives.css"
        download_file "${REPO_RAW}/tokens/semantic.css" "tokens/semantic.css" "tokens/semantic.css"
        download_file "${REPO_RAW}/tokens/index.css" "tokens/index.css" "tokens/index.css"
    fi
    
    # Docs (full mode only)
    if [[ "$mode" == "full" ]]; then
        create_directory "docs"
        local docs=(
            "01-shadow-borders" "02-surface-detailing" "03-backgrounds-texture"
            "04-components-layout" "05-typography-color" "06-operationalization"
            "07-credits-appendix" "08-research-prompts"
        )
        for doc in "${docs[@]}"; do
            download_file "${REPO_RAW}/docs/${doc}.md" "docs/${doc}.md" "docs/${doc}.md"
        done
    fi
    
    # UI Checklist
    download_file "${REPO_RAW}/ui-checklist.md" "ui-checklist.md" "ui-checklist.md"
    
    log_success "Cursor installation complete"
}

# ============================================
# Claude Code Installation (Skills)
# ============================================

install_claude_code() {
    local target="${1:-$HOME/.claude}"
    local mode="$2"
    
    echo ""
    log_info "Installing to Claude Code (${target}/)..."
    
    # Create skill directories
    create_directory "${target}/skills/tokyn-workflow"
    create_directory "${target}/skills/interface-guidelines"
    create_directory "${target}/skills/frontend-design/reference"
    create_directory "${target}/skills/design-review"
    create_directory "${target}/skills/design-polish"
    create_directory "${target}/commands"
    
    # Main workflow skill
    download_file "${REPO_RAW}/.claude/skills/tokyn-workflow/SKILL.md" "${target}/skills/tokyn-workflow/SKILL.md" "skills/tokyn-workflow/SKILL.md"
    
    # Interface guidelines skill
    download_file "${REPO_RAW}/.claude/skills/interface-guidelines/SKILL.md" "${target}/skills/interface-guidelines/SKILL.md" "skills/interface-guidelines/SKILL.md"
    
    # Frontend design skill with references
    download_file "${REPO_RAW}/.claude/skills/frontend-design/SKILL.md" "${target}/skills/frontend-design/SKILL.md" "skills/frontend-design/SKILL.md"
    
    local references=(
        "color-and-contrast" "interaction-design" "motion-design"
        "responsive-design" "spatial-design" "typography" "ux-writing"
    )
    
    for ref in "${references[@]}"; do
        download_file "${REPO_RAW}/.claude/skills/frontend-design/reference/${ref}.md" "${target}/skills/frontend-design/reference/${ref}.md" "skills/frontend-design/reference/${ref}.md"
    done
    
    # Design review skill (rams)
    download_file "${REPO_RAW}/.claude/skills/design-review/SKILL.md" "${target}/skills/design-review/SKILL.md" "skills/design-review/SKILL.md"
    
    # Design polish skill
    download_file "${REPO_RAW}/.claude/skills/design-polish/SKILL.md" "${target}/skills/design-polish/SKILL.md" "skills/design-polish/SKILL.md"
    
    # Slash commands for Claude Code
    local commands=(
        "rams" "teach-impeccable" "audit" "animate" "adapt" "bolder" "quieter"
        "clarify" "colorize" "critique" "delight" "extract" "harden"
        "normalize" "onboard" "optimize" "simplify"
    )
    
    for cmd in "${commands[@]}"; do
        download_file "${REPO_RAW}/.claude/commands/${cmd}.md" "${target}/commands/${cmd}.md" "commands/${cmd}.md"
    done
    
    # Patterns (in project directory)
    create_directory "patterns"
    download_file "${REPO_RAW}/patterns/extension.md" "patterns/extension.md" "patterns/extension.md"
    download_file "${REPO_RAW}/patterns/elevation.md" "patterns/elevation.md" "patterns/elevation.md"
    download_file "${REPO_RAW}/patterns/composition.md" "patterns/composition.md" "patterns/composition.md"
    download_file "${REPO_RAW}/patterns/theming.md" "patterns/theming.md" "patterns/theming.md"
    
    # Tokens (full mode only)
    if [[ "$mode" == "full" ]]; then
        create_directory "tokens"
        download_file "${REPO_RAW}/tokens/primitives.css" "tokens/primitives.css" "tokens/primitives.css"
        download_file "${REPO_RAW}/tokens/semantic.css" "tokens/semantic.css" "tokens/semantic.css"
        download_file "${REPO_RAW}/tokens/index.css" "tokens/index.css" "tokens/index.css"
    fi
    
    # UI Checklist
    download_file "${REPO_RAW}/ui-checklist.md" "ui-checklist.md" "ui-checklist.md"
    
    log_success "Claude Code installation complete"
}

# ============================================
# OpenCode Installation
# ============================================

install_opencode() {
    local target="${1:-.opencode}"
    local mode="$2"
    
    echo ""
    log_info "Installing to OpenCode (${target}/)..."
    
    # Create directories (similar structure to Cursor)
    create_directory "${target}/rules"
    create_directory "${target}/commands"
    
    # Rules
    download_file "${REPO_RAW}/.opencode/rules/workflow.md" "${target}/rules/workflow.md" "rules/workflow.md"
    download_file "${REPO_RAW}/.opencode/rules/interface-guidelines.md" "${target}/rules/interface-guidelines.md" "rules/interface-guidelines.md"
    
    # Commands
    local commands=(
        "rams" "teach-impeccable" "polish" "audit" "animate" "adapt"
        "bolder" "quieter" "clarify" "colorize" "critique" "delight"
        "extract" "harden" "normalize" "onboard" "optimize" "simplify"
    )
    
    for cmd in "${commands[@]}"; do
        download_file "${REPO_RAW}/.opencode/commands/${cmd}.md" "${target}/commands/${cmd}.md" "commands/${cmd}.md"
    done
    
    # Patterns
    create_directory "patterns"
    download_file "${REPO_RAW}/patterns/extension.md" "patterns/extension.md" "patterns/extension.md"
    download_file "${REPO_RAW}/patterns/elevation.md" "patterns/elevation.md" "patterns/elevation.md"
    download_file "${REPO_RAW}/patterns/composition.md" "patterns/composition.md" "patterns/composition.md"
    download_file "${REPO_RAW}/patterns/theming.md" "patterns/theming.md" "patterns/theming.md"
    
    # Tokens (full mode only)
    if [[ "$mode" == "full" ]]; then
        create_directory "tokens"
        download_file "${REPO_RAW}/tokens/primitives.css" "tokens/primitives.css" "tokens/primitives.css"
        download_file "${REPO_RAW}/tokens/semantic.css" "tokens/semantic.css" "tokens/semantic.css"
        download_file "${REPO_RAW}/tokens/index.css" "tokens/index.css" "tokens/index.css"
    fi
    
    # UI Checklist
    download_file "${REPO_RAW}/ui-checklist.md" "ui-checklist.md" "ui-checklist.md"
    
    log_success "OpenCode installation complete"
}

# ============================================
# Main
# ============================================

main() {
    local mode="full"
    local cursor_only=false
    local claude_only=false
    local opencode_only=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --full)
                mode="full"
                shift
                ;;
            --minimal)
                mode="minimal"
                shift
                ;;
            --enhancement)
                mode="enhancement"
                shift
                ;;
            --cursor-only)
                cursor_only=true
                shift
                ;;
            --claude-only)
                claude_only=true
                shift
                ;;
            --opencode-only)
                opencode_only=true
                shift
                ;;
            --help|-h)
                print_banner
                echo "Usage: install.sh [options]"
                echo ""
                echo "Options:"
                echo "  --full          Install everything (default)"
                echo "  --minimal       Rules and commands only"
                echo "  --enhancement   No tokens (for shadcn/ui projects)"
                echo "  --cursor-only   Only install to Cursor"
                echo "  --claude-only   Only install to Claude Code"
                echo "  --opencode-only Only install to OpenCode"
                echo "  --help, -h      Show this help message"
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                exit 1
                ;;
        esac
    done
    
    print_banner
    
    # Detect tools
    echo "Detecting installed tools..."
    
    local has_cursor=false
    local has_claude=false
    local has_opencode=false
    
    if detect_cursor; then
        log_success "Cursor detected"
        has_cursor=true
    else
        log_step "Cursor not found"
    fi
    
    if detect_claude_code; then
        log_success "Claude Code detected"
        has_claude=true
    else
        log_step "Claude Code not found"
    fi
    
    if detect_opencode; then
        log_success "OpenCode detected"
        has_opencode=true
    else
        log_step "OpenCode not found"
    fi
    
    # Check if any tools found
    if ! $has_cursor && ! $has_claude && ! $has_opencode; then
        echo ""
        log_warning "No supported tools detected."
        echo ""
        echo "This installer supports:"
        echo "  • Cursor (https://cursor.sh)"
        echo "  • Claude Code (https://claude.ai/code)"
        echo "  • OpenCode"
        echo ""
        echo "You can still install manually by cloning the repository:"
        echo "  git clone ${REPO_URL}"
        exit 1
    fi
    
    # Show mode
    echo ""
    log_info "Installation mode: ${BOLD}${mode}${NC}"
    case $mode in
        full)
            echo "  Including: rules, commands, skills, patterns, tokens, docs"
            ;;
        enhancement)
            echo "  Including: rules, commands, skills, patterns (no tokens)"
            ;;
        minimal)
            echo "  Including: rules, commands only"
            ;;
    esac
    
    # Install to detected tools
    if $cursor_only; then
        install_cursor ".cursor" "$mode"
    elif $claude_only; then
        install_claude_code "$HOME/.claude" "$mode"
    elif $opencode_only; then
        install_opencode ".opencode" "$mode"
    else
        # Install to all detected tools
        if $has_cursor; then
            install_cursor ".cursor" "$mode"
        fi
        
        if $has_claude; then
            install_claude_code "$HOME/.claude" "$mode"
        fi
        
        if $has_opencode; then
            install_opencode ".opencode" "$mode"
        fi
    fi
    
    # Success message
    echo ""
    echo -e "${GREEN}┌─────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${GREEN}│${NC}  ${BOLD}Installation complete!${NC}                                      ${GREEN}│${NC}"
    echo -e "${GREEN}└─────────────────────────────────────────────────────────────┘${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Run ${BOLD}teach-impeccable${NC} to establish design context"
    echo "  2. Start building with AI-assisted UI guidance"
    echo "  3. Run ${BOLD}polish${NC} and ${BOLD}audit${NC} before shipping"
    echo ""
    echo "Documentation: ${REPO_URL}"
    echo ""
}

main "$@"
