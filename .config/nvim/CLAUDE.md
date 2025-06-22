# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a comprehensive Neovim configuration written in Fennel (a Lisp that compiles to Lua) using the Aniseed framework. The configuration supports full-stack development with JavaScript/TypeScript, Python, PHP, and other languages.

## Architecture

The configuration uses a dual approach:
- **Legacy VimScript** (init.vim) for backward compatibility and plugin management
- **Modern Fennel** (fnl/init.fnl) for structured configuration with functional programming patterns

### Key Files and Structure

- `init.vim` - Main entry point, plugin definitions, legacy VimScript configuration
- `fnl/init.fnl` - Primary Fennel configuration (compiled to lua/init.lua)
- `fnl/dotfiles/util.fnl` - Utility functions for key mappings and config helpers
- `coc-settings.json` - Language server and completion settings for Conquer of Completion
- `UltiSnips/` - Code snippet templates organized by language/framework
- `skeletons/` - File templates for new file creation
- `autoload/` - VimScript helper functions
- `after/ftplugin/` - Filetype-specific configurations

### Configuration Philosophy

The config follows these patterns:
- Fennel for structured, functional configuration
- Plugin-based architecture with extensive customization
- Language-specific tooling via CoC and TreeSitter
- Comprehensive key mappings with leader-based shortcuts
- Template-driven development with skeletons and snippets

## Development Commands

### Core Development
- **Reload config**: `:lua ReloadConfig()` or `<leader>S`
- **Edit main config**: `<leader>,` (init.vim) or `<leader>.` (init.fnl)
- **Edit Lua config**: `<leader>;`

### File Navigation
- **Find files**: `<C-f>` (Telescope)
- **Buffer navigation**: `<leader>b` (buffer list)
- **Project search**: `<leader>/` (Denite grep with ripgrep)

### Testing
- **Test nearest**: `tn` (context-aware: Jest/PHPUnit based on filetype)
- **Test file**: `tf`
- **Test suite**: `ts`
- **Test last**: `tl`

### Debugging (Python/JavaScript)
- **Toggle breakpoint**: `<leader>b`
- **Start debugging**: `<leader>dd`
- **Step over**: `<leader>dn`
- **Step into**: `<leader>di`
- **Toggle DAP UI**: `<leader>dt`

### Language Features (via CoC)
- **Go to definition**: `gd`
- **Go to definition (split)**: `gv`
- **Go to references**: `gr`
- **Code actions**: `<leader>ac`
- **Rename symbol**: `<leader>rnw`
- **Show diagnostics**: `<space>a`
- **Next/prev diagnostic**: `<leader>j`/`<leader>k`

## Language-Specific Features

### JavaScript/TypeScript
- TreeSitter syntax highlighting with custom parsers
- ESLint integration via CoC
- Prettier formatting
- Auto-import support
- React/JSX support with specialized snippets

### Python
- Python LSP via CoC with Pyright
- Ruff linting and formatting
- Django debugging support (Docker containers)
- Virtual environment integration (`~/venvs/neovim/bin/python`)

### PHP
- PHP language server support
- PHPUnit testing integration
- Composer project detection

## Key Mappings Convention

- `<leader>` = `,` (comma)
- `<localleader>` = `-` (dash)
- Git operations: `<leader>g*` (e.g., `<leader>gs` for status)
- Wiki/notes: `<leader>w*`
- Debugging: `<leader>d*`
- Code actions: `<leader>*c`

## Plugin Ecosystem

### Core Plugins
- **Telescope** - Fuzzy finder and picker
- **CoC.nvim** - Language server client and completion
- **TreeSitter** - Syntax highlighting and text objects
- **DAP** - Debug Adapter Protocol support
- **Fennel/Aniseed** - Fennel language support and compilation

### Development Tools
- **UltiSnips** - Snippet engine with extensive language templates
- **vim-test** - Testing framework integration
- **Fugitive** - Git integration
- **Gitsigns** - Git change indicators

## Fennel Development

The configuration uses Aniseed to compile Fennel to Lua. When editing Fennel files:
- Changes auto-compile to corresponding Lua files
- Use `(print "debug")` for debugging
- Leverage the REPL with Conjure plugin
- Follow functional programming patterns

## Snippet and Template System

### UltiSnips
- Language-specific snippets in `UltiSnips/` directory
- Trigger with `<leader>e`, navigate with `<C-j>`/`<C-k>`
- Custom JavaScript/TypeScript service patterns

### Skeletons
- File templates in `skeletons/` directory
- Auto-applied based on file extension and patterns
- React components, test files, API clients, etc.

## Development Workflow

1. Use `<C-f>` to find files
2. Navigate with language-aware mappings (`gd`, `gr`)
3. Run tests with `tn`/`tf` as you develop
4. Use debugger for complex issues (`<leader>dd`)
5. Leverage snippets and templates for boilerplate
6. Commit with Git integration (`<leader>gs`)

## Common Issues

- If CoC language servers aren't working, check `coc-settings.json` paths
- Fennel compilation errors appear in `:messages`
- Python debugging requires Docker container setup on port 5678
- TreeSitter parsing may need `:TSUpdate` after major updates