# Tokyn

> A UI design system for AI coding assistants. Guides Claude Code, Cursor, and OpenCode to build distinctive, accessible interfaces—not generic AI slop.

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/jshmllr/tokyn/main/install.sh | bash
```

Auto-detects Claude Code, Cursor, and OpenCode. Installs rules, skills, commands, patterns, and tokens.

**Options:**
```bash
# Full install (default) - everything
curl -fsSL .../install.sh | bash

# Enhancement mode - no tokens (for shadcn/ui projects)
curl -fsSL .../install.sh | bash -s -- --enhancement

# Minimal - rules and commands only
curl -fsSL .../install.sh | bash -s -- --minimal

# Single tool
curl -fsSL .../install.sh | bash -s -- --cursor-only
curl -fsSL .../install.sh | bash -s -- --claude-only
```

---

## What Is This?

An opinionated UI design system and implementation playbook focused on interaction finesse, typography, and component standards for high-clarity product interfaces.

### Shadows, Borders, Surfaces, Backgrounds, and Micro-Details for Product UI

A practical, implementation-focused reference for building high-polish UI:

- Shadow borders that align perfectly with element size
- Realistic shadow stacks with negative spread
- Inner highlights and reflections for dark mode
- Concentric radii, macOS-style buttons, glass surfaces
- Gradient and texture techniques for backgrounds
- Detailed table, form, and component refinements
- Typography, color, spacing, and process heuristics

Use this like a mini design system guideline for both Figma and code.

---

## Table of Contents

1. [Shadow and Border Systems](docs/01-shadow-borders.md)  
   1.1 Shadow Borders with Negative Spread (CSS / Tailwind)  
   1.2 Natural Shadow Stacks with Negative Spread  
   1.3 Inner Shadows as Borders (Figma and CSS)  
   1.4 Transparent / Soft Borders Instead of Solid Strokes  
   1.5 Colored (Saturated) Shadows  
   1.6 Text Shadows for Legibility  
   1.7 Dark Mode Depth and Reflection

2. [Surface and Shape Detailing](docs/02-surface-detailing.md)  
   2.1 Inner Highlights for Dark Containers  
   2.2 Concentric Border Radius  
   2.3 macOS-style Micro-shadow Buttons  
   2.4 Glass / Frosted Buttons and Panels  
   2.5 3D / Glossy Surfaces (Folded, Glossy, Gemstone, 3D Lines)  
   2.6 Icon and Avatar Framing  
   2.7 Color Strips and Panel Accents

3. [Backgrounds, Patterns, and Texture](docs/03-backgrounds-texture.md)  
   3.1 Noise Overlays  
   3.2 Ultra Gradients and Blob Blends  
   3.3 Grid Backgrounds via Masking  
   3.4 Wavy Line Textures  
   3.5 Blurred Logo or Shape Backgrounds  
   3.6 Dotted Patterns with Randomized Opacity  
   3.7 Image and Illustration Fades  
   3.8 Bleeding Images Out of Containers

4. [Components, Layout, and Micro-interactions](docs/04-components-layout.md)  
   4.1 Table and Data UI Refinement  
   4.2 Dropdowns, Toasts, and Modal Stacks  
   4.3 Secondary Button and Input Styles  
   4.4 Checkbox and Radio Label Hierarchy  
   4.5 Avoid Border-heavy Layouts

5. [Typography, Color, Spacing, and Process Heuristics](docs/05-typography-color.md)  
   5.1 Typography & Copy  
   5.2 Color Systems  
   5.3 Spacing and Layout  
   5.4 Product & UX Principles  
   5.5 Practice and Workflow

6. [How to Operationalize This in a Design System](docs/06-operationalization.md)

7. [Credits and Sources](docs/07-credits-appendix.md)

8. [Research Prompts (Grok/X, ChatGPT, Perplexity)](docs/08-research-prompts.md)

---

## Reference Tools

- [UI Checklist](ui-checklist.md) — Comprehensive checklist for reviewing and validating UI designs (from [ShiftNudge](https://shiftnudge.notion.site/UI-Checklist-d47ae9676a004a9b9d942a7908ac9efd#777a6e19c8ed4d2e8f5ddbd769f7e279))

---

## Getting Started

This playbook works in two modes depending on your project:

### Mode Selection

| Your Project | Mode | What You Get |
|--------------|------|--------------|
| Greenfield (no component library) | **Standalone** | Full foundation: tokens, patterns, theming |
| Using shadcn/ui, Radix, Headless UI, etc. | **Enhancement** | Guidance layer: elevation, extension patterns |

The AI automatically detects which mode to use based on your project structure.

### Standalone Mode (Greenfield)

For new projects without an existing component library:

1. Copy or reference `/tokens/` for design tokens
2. Follow `/patterns/composition.md` for DRY component architecture
3. Use `/patterns/theming.md` for theme setup
4. Reference `/docs/` for visual techniques

```
tokens/
├── primitives.css     # Raw values (spacing, colors, typography)
├── semantic.css       # Theme-aware aliases (light/dark)
└── index.css          # Single import with base styles
```

### Enhancement Mode (With Component Library)

For projects using shadcn/ui, Radix, or similar:

1. Keep using the library's token system
2. Follow `/patterns/extension.md` for wrapping components
3. Use `/patterns/elevation.md` to transcend defaults
4. Reference `/docs/` for polish techniques

**Key insight**: Component libraries solve "how to build consistent components." This playbook solves "how to make them exceptional."

---

## Agentic Workflow

The playbook guides AI assistants through a structured process:

```
Phase 1: Context     → Run `teach-impeccable` to establish design direction
Phase 2: Foundation  → Set up tokens (Standalone) or use library patterns (Enhancement)
Phase 3: Building    → Consult skills, rules, and docs for every component
Phase 4: Refinement  → Run `polish` → `audit` → `rams` commands
Phase 5: Quality     → Complete `ui-checklist.md` before shipping
```

---

## Tool Integration

This playbook supports three AI coding assistants:

| Tool | Config Location | Skills | Commands |
|------|-----------------|--------|----------|
| **Claude Code** | `~/.claude/skills/`, `~/.claude/commands/` | 5 skills | 17 commands |
| **Cursor** | `.cursor/rules/`, `.cursor/commands/`, `.cursor/skills/` | 1 skill | 18 commands |
| **OpenCode** | `.opencode/rules/`, `.opencode/commands/` | — | 18 commands |

### Claude Code Skills

| Skill | Description |
|-------|-------------|
| `tokyn-workflow` | Master workflow with mode detection |
| `interface-guidelines` | Accessibility and interaction rules |
| `frontend-design` | Aesthetic direction, anti-patterns |
| `design-review` | Accessibility and visual design audits |
| `design-polish` | Final refinement checklist |

### Commands (All Tools)

Commands from [Impeccable](https://impeccable.style/) for systematic UI workflows:

| Command | Purpose |
|---------|---------|
| `teach-impeccable` | Design context gathering (run first) |
| `rams` | Accessibility and design review |
| `polish` | Final refinement pass |
| `audit` | Design review and assessment |
| `animate` | Motion design and transitions |
| `adapt` | Responsive design adaptation |
| `bolder` | Visual emphasis and hierarchy |
| `quieter` | Visual noise reduction |
| `clarify` | UX clarity and communication |
| `colorize` | Color system development |
| `critique` | Design feedback and iteration |
| `delight` | Micro-interactions and joy |
| `extract` | Design token extraction |
| `harden` | Error handling and edge cases |
| `normalize` | Consistency enforcement |
| `onboard` | Onboarding flow design |
| `optimize` | Performance optimization |
| `simplify` | Complexity reduction |

---

## Patterns

Component architecture and theming documentation:

| Pattern | Mode | Purpose |
|---------|------|---------|
| [extension.md](patterns/extension.md) | Enhancement | Wrapping components, token extension |
| [elevation.md](patterns/elevation.md) | Enhancement | Transcending library defaults |
| [composition.md](patterns/composition.md) | Standalone | DRY principles, variant props |
| [theming.md](patterns/theming.md) | Standalone | Theme architecture, dark mode |

---

## External Resources

- [Rams](https://www.rams.ai/) — AI design engineer for accessibility and visual design review
- [Vercel Design Guidelines](https://vercel.com/design/guidelines) — Vercel's design system documentation
- [Claude Code Frontend Design Skill](https://github.com/anthropics/claude-code/blob/main/plugins/frontend-design/skills/frontend-design/SKILL.md) — Anthropic's frontend design principles
- [Impeccable](https://impeccable.style/) — Source of the Cursor commands