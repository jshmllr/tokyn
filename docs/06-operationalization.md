# 6. How to Operationalize This in a Design System

A practical way to embed these ideas:

## 1. Shadow Tokens

Create named shadow styles for:

* `shadow-card` (elevated card surfaces)
* `shadow-button` (small targets)
* `shadow-popover` (dropdowns, tooltips)
* `shadow-dark-panel` (panels in dark mode)

## 2. Surface Tokens

Define surface colors and associated treatments:

* `surface/base` (page)
* `surface/card` (primary card)
* `surface/subtle` (nested blocks)
* Each with a defined noise / gradient / shadow rule.

## 3. Border & Radius Rules

* Prefer shadow borders or soft, semi-transparent borders.
* Document concentric radius rules (inner radius = outer radius − padding).

## 4. Component Recipes

Turn patterns into component docs:

* "Elevated card (light/dark)"
* "Input with shadow border"
* "macOS-style micro button"
* "Glass chip"
* "Data table row"

## 5. Figma & Code Parity

* Mirror these tokens as Figma styles (color, effect, text).
* Mirror the same tokens in Tailwind / CSS variables.

Once you have tokens and a small set of component recipes, this entire playbook becomes a consistent visual language instead of a bag of tricks.

