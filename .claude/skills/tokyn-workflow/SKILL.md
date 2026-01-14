---
name: ui-finesse-workflow
description: Master workflow for building exceptional UIs. Use when starting UI work, building components, or when the user asks about the development process for interfaces.
---

# UI Finesse Workflow

You are following the UI Finesse Playbook workflow for building exceptional user interfaces.

## Phase 0: Mode Detection

Before starting, determine which mode applies:

### Enhancement Mode (Existing Component Library)
Detected when ANY of these are true:
- `components/ui/button.tsx` exists (shadcn/ui pattern)
- `@radix-ui/*` packages in dependencies
- `@headlessui/*` packages in dependencies

### Standalone Mode (Greenfield)
Detected when NONE of the above are present.

## Phase 1: Context Gathering

**ALWAYS start here before building UI.**

If no design context exists, gather:
- Target audience and use cases
- Brand personality (3 words)
- Aesthetic direction and references
- Anti-references (what to avoid)

## Phase 2: Foundation

### Standalone Mode
1. Use design tokens from `/tokens/` if present
2. Follow composition patterns in `/patterns/composition.md`
3. Follow theme architecture in `/patterns/theming.md`

### Enhancement Mode
1. Use the library's existing token system
2. Follow extension patterns in `/patterns/extension.md`
3. Reference `/patterns/elevation.md` for transcending defaults

## Phase 3: Building

For every component:
1. Consult the `frontend-design` skill for aesthetic direction
2. Follow `interface-guidelines` skill for interaction patterns
3. Reference `/docs/` for specific techniques
4. Use composition over duplication

## Phase 4: Refinement

After building:
1. Run `design-polish` skill for systematic final pass
2. Run `design-review` skill for accessibility verification

## Phase 5: Quality Gate

Before shipping, verify:
- All checklist items from `ui-checklist.md`
- No critical accessibility issues
- Passes the "AI slop test" (doesn't look generic)

## Quick Reference

| Need | Resource |
|------|----------|
| Aesthetic direction | `frontend-design` skill |
| Interaction patterns | `interface-guidelines` skill |
| Final polish | `design-polish` skill |
| Accessibility review | `design-review` skill |
| Visual techniques | `/docs/` best practices |
| Extension patterns | `/patterns/extension.md` |
| DRY principles | `/patterns/composition.md` |

## Anti-Patterns to Avoid

### Building
- Starting without design context
- Copying styles instead of wrapping components
- Hardcoding colors/spacing instead of using tokens

### Aesthetics
- Generic "AI slop" (purple gradients, glowing accents, Inter font)
- Glassmorphism everywhere
- Same-sized card grids
- Gradient text on metrics
