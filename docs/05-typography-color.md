# 5. Typography, Color, Spacing, and Process Heuristics

## 5.1 Typography & Copy

Core rules:

* Body text: 14–16px in app UIs, 16–18px in marketing.
* Line length: ~50–75 characters.
* Line height: 130–160%.
* Headlines: slight negative letter spacing.
* All caps labels: increased letter spacing.
* Use real-ish content as early as possible.

```css
body {
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  font-size: 16px;
  line-height: 1.5;
}

h1 {
  font-size: 2.25rem;
  letter-spacing: -0.03em;
}

.label-caps {
  text-transform: uppercase;
  letter-spacing: 0.12em;
  font-size: 0.75rem;
}
```

---

## 5.2 Color Systems

Guidelines:

* Limit palette to a few core colors plus neutrals.
* Slightly tint your greys toward your brand hue.
* On colored backgrounds, use desaturated versions of the same hue for text and secondary elements.
* For gradients, change hue and lightness, not just brightness.

---

## 5.3 Spacing and Layout

* Start with more whitespace than you think you need, then reduce.
* Use consistent spacing steps (e.g., 4, 8, 12, 16, 24, 32).
* Group related items via spacing and alignment, not borders.
* Avoid having every element with a unique spacing value.

---

## 5.4 Product & UX Principles

Compressed from many tips:

* Content first: UI exists to support content.
* Use standard patterns where they work; innovate where it matters.
* Don't make users think more than necessary.
* Provide feedback for every meaningful action.
* Design for accessibility from the start.
* Simplify flows and remove unnecessary choices.
* Use research continuously, not just at the beginning.

---

## 5.5 Practice and Workflow

Heuristics:

* Make small designs or experiments frequently.
* Duplicate and iterate; never destroy your previous step.
* Treat your first idea as a draft.
* Create templates and starter files for common flows.
* Ask for feedback early and often, filter ruthlessly.
* After each project, write down what worked and what failed.

