---
name: frontend-design
description: Create distinctive, production-grade frontend interfaces. Use when building web components, pages, or applications to avoid generic AI aesthetics and make memorable UIs.
---

# Frontend Design

This skill guides creation of distinctive, production-grade frontend interfaces that avoid generic "AI slop" aesthetics.

## Design Direction

Commit to a BOLD aesthetic direction:
- **Purpose**: What problem does this interface solve?
- **Tone**: Pick an extreme: brutally minimal, maximalist, retro-futuristic, organic, luxury, playful, editorial, brutalist, art deco, soft, industrial
- **Differentiation**: What's the one thing someone will remember?

**CRITICAL**: Choose a clear conceptual direction and execute with precision.

## Typography

See [typography reference](reference/typography.md) for scales and pairing.

**DO**: Use a modular type scale with fluid sizing (clamp)
**DO**: Vary font weights and sizes for clear hierarchy
**DON'T**: Use overused fonts—Inter, Roboto, Arial, Open Sans
**DON'T**: Use monospace as lazy shorthand for "technical"

## Color & Theme

See [color reference](reference/color-and-contrast.md) for OKLCH and palettes.

**DO**: Use modern CSS color functions (oklch, color-mix, light-dark)
**DO**: Tint neutrals toward your brand hue
**DON'T**: Use gray text on colored backgrounds
**DON'T**: Use pure black (#000) or pure white (#fff)
**DON'T**: Use the AI palette: cyan-on-dark, purple-to-blue gradients, neon accents

## Layout & Space

See [spatial reference](reference/spatial-design.md) for grids and rhythm.

**DO**: Create visual rhythm through varied spacing
**DO**: Use fluid spacing with clamp()
**DO**: Use asymmetry and break the grid intentionally
**DON'T**: Wrap everything in cards
**DON'T**: Nest cards inside cards
**DON'T**: Center everything

## Visual Details

**DO**: Use intentional, purposeful decorative elements
**DON'T**: Use glassmorphism everywhere
**DON'T**: Use rounded rectangles with generic drop shadows
**DON'T**: Use modals unless truly necessary

## Motion

See [motion reference](reference/motion-design.md) for timing and easing.

**DO**: Use motion to convey state changes
**DO**: Use exponential easing (ease-out-quart/quint/expo)
**DON'T**: Animate layout properties
**DON'T**: Use bounce or elastic easing—they feel dated

## The AI Slop Test

**Critical check**: If someone said "AI made this," would they believe it immediately? If yes, that's the problem.

Review the DON'T guidelines—they are fingerprints of AI-generated work from 2024-2025.

## Implementation

Match complexity to aesthetic vision. Maximalist designs need elaborate code. Minimalist designs need restraint and precision.

Interpret creatively. Make unexpected choices. No design should be the same.
