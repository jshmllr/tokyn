---
name: interface-guidelines
description: Accessibility and interaction rules for building UIs. Use when building forms, buttons, navigation, animations, or any interactive elements.
---

# Interface Guidelines

Concise rules for building accessible, fast, delightful UIs. Use MUST/SHOULD/NEVER to guide decisions.

## Interactions

### Keyboard
- MUST: Full keyboard support per [WAI-ARIA APG](https://www.w3.org/WAI/ARIA/apg/patterns/)
- MUST: Visible focus rings (`:focus-visible`)
- MUST: Manage focus (trap, move, return) per APG patterns
- NEVER: `outline: none` without visible focus replacement

### Targets & Input
- MUST: Hit target ≥24px (mobile ≥44px)
- MUST: Mobile `<input>` font-size ≥16px to prevent iOS zoom
- NEVER: Disable browser zoom
- MUST: `touch-action: manipulation` to prevent double-tap zoom

### Forms
- MUST: Hydration-safe inputs (no lost focus/value)
- NEVER: Block paste in inputs
- MUST: Loading buttons show spinner and keep original label
- MUST: Enter submits focused input; in textarea, ⌘/Ctrl+Enter submits
- MUST: Errors inline next to fields; on submit, focus first error
- MUST: `autocomplete` + meaningful `name`; correct `type` and `inputmode`
- MUST: Compatible with password managers & 2FA

### State & Navigation
- MUST: URL reflects state (deep-link filters/tabs/pagination)
- MUST: Back/Forward restores scroll position
- MUST: Links use `<a>` for navigation (support Cmd/Ctrl/middle-click)
- NEVER: Use `<div onClick>` for navigation

### Feedback
- SHOULD: Optimistic UI; reconcile on response
- MUST: Confirm destructive actions or provide Undo
- MUST: Use polite `aria-live` for toasts/inline validation

## Animation

- MUST: Honor `prefers-reduced-motion`
- MUST: Animate compositor-friendly props (`transform`, `opacity`) only
- NEVER: Animate layout props (`top`, `left`, `width`, `height`)
- NEVER: `transition: all`—list properties explicitly
- SHOULD: Use ease-out-quart/quint/expo for natural deceleration
- MUST: Animations interruptible and input-driven

## Layout

- SHOULD: Optical alignment; adjust ±1px when perception beats geometry
- MUST: Verify mobile, laptop, ultra-wide
- MUST: Respect safe areas (`env(safe-area-inset-*)`)
- MUST: Avoid unwanted scrollbars

## Content & Accessibility

- MUST: Skeletons mirror final content to avoid layout shift
- MUST: `<title>` matches current context
- MUST: No dead ends; always offer next step/recovery
- MUST: Design empty/sparse/dense/error states
- MUST: `font-variant-numeric: tabular-nums` for number comparisons
- MUST: Redundant status cues (not color-only)
- MUST: Icon-only buttons have descriptive `aria-label`
- MUST: Prefer native semantics before ARIA

## Performance

- MUST: Track and minimize re-renders
- MUST: Mutations target <500ms
- MUST: Virtualize large lists (>50 items)
- MUST: Preload above-fold images; lazy-load the rest
- MUST: Prevent CLS (explicit image dimensions)

## Dark Mode & Theming

- MUST: `color-scheme: dark` on `<html>` for dark themes
- SHOULD: `<meta name="theme-color">` matches page background
- MUST: Native `<select>`: explicit background-color and color

## Design

- SHOULD: Layered shadows (ambient + direct)
- SHOULD: Crisp edges via semi-transparent borders + shadows
- SHOULD: Nested radii: child ≤ parent; concentric
- SHOULD: Tint borders/shadows/text toward bg hue
- MUST: Meet contrast—prefer APCA over WCAG 2
- MUST: Increase contrast on hover/active/focus
