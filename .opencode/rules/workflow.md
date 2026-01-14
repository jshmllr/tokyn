# Agentic UI Workflow

This rule orchestrates the entire UI development process. It detects the project mode and guides you through each phase.

## Phase 0: Mode Detection

Before starting any UI work, determine which mode applies:

### Enhancement Mode (Existing Component Library)
Detected when ANY of these are true:
- `components/ui/button.tsx` exists (shadcn/ui pattern)
- `@radix-ui/*` packages in dependencies
- `@headlessui/*` packages in dependencies
- `@chakra-ui/*` packages in dependencies

### Standalone Mode (Greenfield)
Detected when NONE of the above are present.

---

## Phase 1: Context Gathering

**ALWAYS start here before building UI.**

Run the `teach-impeccable` command to establish design context:
- Target audience and use cases
- Brand personality (3 words)
- Aesthetic direction and references
- Anti-references (what to avoid)

---

## Phase 2: Foundation

### Standalone Mode
1. Check if `/tokens/` directory exists
2. Follow composition patterns in `/patterns/composition.md`
3. Follow theme architecture in `/patterns/theming.md`

### Enhancement Mode
1. Use the library's existing token system
2. Follow extension patterns in `/patterns/extension.md`
3. Reference `/patterns/elevation.md` for transcending defaults

---

## Phase 3: Building

For every component:

### 3.1 Aesthetic Direction
- Commit to a bold aesthetic direction
- Avoid the "AI slop" anti-patterns
- Make distinctive, memorable choices

### 3.2 Interaction Patterns
- Keyboard accessibility (WAI-ARIA APG)
- Touch targets (≥24px desktop, ≥44px mobile)
- Form behavior and validation
- Animation constraints

### 3.3 Visual Techniques
Reference `/docs/` for specific techniques:
- `/docs/01-shadow-borders.md` — Shadow stacks, colored shadows, depth
- `/docs/02-surface-detailing.md` — Inner highlights, glass effects
- `/docs/03-backgrounds-texture.md` — Noise, gradients, patterns
- `/docs/04-components-layout.md` — Tables, dropdowns, modals

### 3.4 Composition
- NEVER duplicate component styles
- Wrap and extend existing components
- Use variant props over new components
- Design tokens as single source of truth

---

## Phase 4: Refinement

After building, run these commands in sequence:

### 4.1 Polish Pass
Run `polish` command for systematic final pass

### 4.2 Design Audit
Run `audit` command for design review

### 4.3 Accessibility Review
Run `rams` command for accessibility verification

---

## Phase 5: Quality Gate

Before shipping, complete `ui-checklist.md`

---

## Quick Reference

| Need | Resource |
|------|----------|
| Design context | `teach-impeccable` command |
| Visual techniques | `/docs/` best practices |
| Extension patterns | `/patterns/extension.md` |
| DRY principles | `/patterns/composition.md` |
| Final polish | `polish` command |
| Accessibility | `rams` command |
| Quality gate | `ui-checklist.md` |

---

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
