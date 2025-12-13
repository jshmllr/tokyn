# 4. Components, Layout, and Micro-interactions

## 4.1 Table and Data UI Refinement

**Core Ideas**

* Lighten metadata text and deemphasize icons.
* Minimize heavy borders; use subtle dividers and spacing.
* Align headers and rows cleanly.

```css
.table {
  width: 100%;
  border-collapse: collapse;
}

.table th {
  text-align: left;
  font-weight: 500;
  font-size: 0.75rem;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  padding: 0.75rem 0.75rem 0.5rem;
  color: #6b7280;
}

.table td {
  padding: 0.65rem 0.75rem;
  font-size: 0.875rem;
  color: #111827;
}

.table td.meta {
  color: #9ca3af;
}

.table tr + tr td {
  border-top: 1px solid rgba(17, 24, 39, 0.05);
}
```

Icons: default gray, colored only on hover or active states.

[^james6]

---

## 4.2 Dropdowns, Toasts, and Modal Stacks

**Patterns**

* Slight offset from trigger, not perfectly aligned.
* Shared shadow system with cards.
* Short, snappy transitions (around 180–220ms).

```css
.dropdown {
  opacity: 0;
  transform: translateY(4px);
  transition:
    opacity 180ms ease-out,
    transform 180ms ease-out;
}

.dropdown[data-state="open"] {
  opacity: 1;
  transform: translateY(0);
}
```

For stacked modals or toasts, offset each by a few pixels and a few milliseconds to create depth and hierarchy.

[^derek8]

---

## 4.3 Secondary Button and Input Styles

**Secondary Button**

```css
.btn-secondary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.5rem 1rem;
  border-radius: 999px;
  background: rgba(15, 23, 42, 0.05);
  color: #111827;
  border: 1px solid rgba(15, 23, 42, 0.08);
}
```

**Outline Button with Text Shadow**

```css
.btn-outline {
  padding: 0.5rem 1rem;
  border-radius: 999px;
  border: 1px solid rgba(15, 23, 42, 0.18);
  background: transparent;
  color: #111827;
  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.6);
}
```

**Input with Shadow Border**

```css
.input-contrast {
  background: #ffffff;
  border-radius: 0.5rem;
  border: 1px solid rgba(15, 23, 42, 0.08);
  box-shadow:
    0 0 0 1px rgba(15, 23, 42, 0.03),
    0 1px 2px rgba(15, 23, 42, 0.06);
}
```

[^steve6]

---

## 4.4 Checkbox and Radio Label Hierarchy

**HTML**

```html
<label class="choice">
  <input type="checkbox" />
  <span class="choice-label">
    <span class="choice-primary">Pro plan</span>
    <span class="choice-secondary">Best for teams who ship weekly</span>
  </span>
</label>
```

**CSS**

```css
.choice {
  display: flex;
  gap: 0.5rem;
  align-items: flex-start;
}

.choice-label {
  display: flex;
  flex-direction: column;
}

.choice-primary {
  font-weight: 500;
  color: #111827;
}

.choice-secondary {
  font-size: 0.8rem;
  color: #6b7280;
}
```

[^steve7]

---

## 4.5 Avoid Border-heavy Layouts

**Concept**

Use:

* Background color steps
* Spacing and grouping
* Minimal dividers

Instead of:

* Nested boxes with borders around everything.

**Layering Example**

* Page: `#f3f4f6`
* Card: `#ffffff`
* Inner sections: `#f9fafb` with padding, no border
* Single divider between sections

[^steve8]

---

## 4.6 Reusing CSS Animation Keyframes with Custom Properties

**Concept**

Make animations dynamic by reusing keyframes and varying behavior via custom properties. Useful for staggered or runtime-adjustable effects without duplicating code.

**Example**

```css
.b1 { --y: -500%; }
.b2 { --y: 200%; }

@keyframes enter {
  0% { translate: var(--x, 0) var(--y, 0); }
}

.b {
  animation: enter 1s;
}
```

Define keyframes with variables, then override per element. Adjust `--x`/`--y` for different directions.

[^jhey7]

---

## 4.7 CSS Subgrid with Scroll-Driven Transforms

**Concept**

Create parallax-like galleries where items transform (e.g., scale/rotate) on scroll using subgrid for layout and different easings for smooth, varied motion.

**Example**

```css
.gallery {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}

.item {
  grid-column: 1 / -1;
  grid-row: 1 / -1; /* Stack with subgrid */
  animation: transform linear both;
  animation-timeline: scroll();
}

@keyframes transform {
  to { transform: scale(0.8) rotate(5deg); }
}
```

Use grid/subgrid for alignment, then scroll animations. Vary easings per item for natural motion.

[^jhey8]

---

## 4.8 Custom Property-Driven Shifts in Scroll Animations

**Concept**

Use custom properties to control shift directions in list animations on scroll, making effects reusable and updatable at runtime.

**Example**

```css
li:nth-of-type(odd) { --x: -4ch; }
li:nth-of-type(even) { --x: 4ch; }

@keyframes shift {
  50% { translate: var(--x) 0; }
}

li {
  animation: shift linear;
  animation-timeline: scroll();
}
```

[^jhey9]

---

## 4.9 Animating CSS Grid Tracks on Interaction

**Concept**

Dynamically adjust grid layouts on hover/focus for interactive reveals, using transitions for smooth changes.

**Example**

```css
ul:is(:hover, :focus-within) {
  --active: 1;
}

ul {
  display: grid;
  grid-template-columns: auto repeat(3, calc(10px + (var(--active) * 100px)));
  transition: all 0.2s;
}
```

[^jhey10]

---

## 4.10 Animated Block Reveals with Logical Properties

**Concept**

Create staggered block animations for text/images using masks or clips, scoped custom properties for direction control.

**Example**

```css
.block {
  --dir: inline-start;
  animation: reveal 0.5s;
}

@keyframes reveal {
  from { clip-path: inset(0 0 0 100% var(--dir)); }
}

.block:nth-child(2) {
  --dir: inline-end; /* Vary direction */
}
```

[^jhey11]

---

## 4.11 Scroll-Triggered Image Pop-Out Effect

**Concept**

Images "pop" out on scroll entry/exit using timeline triggers for precise control.

**Example** (Chrome 145+)

```css
.pop {
  timeline-trigger: --t view() cover 40% exit 200%;
}

.pop img {
  animation: pop 0.28s cubic-bezier(.455, .03, .515, .955) both;
  animation-trigger: --t play-forwards play-backwards;
}

@keyframes pop {
  to { scale: 1.2; }
}
```

[^jhey12]

---

## 4.12 Stacked Elements with Grid/Subgrid and Position: Sticky

**Concept**

Stack UI elements (e.g., scroll track windows) using grid for overlap, sticky for fixed positioning.

**Example**

```css
.container {
  display: grid;
}

.item {
  grid-area: 1/1;
  position: sticky;
  top: 0;
}

/* Use subgrid for child alignment */
```

Responsive with media queries.

[^jhey13]

---

## 4.13 Performance-Optimized Animations

**Concept**

Stick to transform/opacity for smooth animations, avoiding layout-triggering properties like left/width.

**Example**

```css
.elem {
  animation: move 1s;
}

@keyframes move {
  to {
    transform: translateX(100px);
    opacity: 0;
  }
  /* Avoid: left: 100px; */
}
```

Only animate properties that don't trigger layout recalculation for 60fps performance.

[^jhey14]

---

## 4.14 Animated Borders with Masks and Conic Gradients

**Concept**

Create spinning/animated borders on buttons using masks to hide parts, transitions for hover effects.

**Example**

```css
button {
  mask: conic-gradient(from 0deg at 50% 50%, transparent 0deg, black 1deg);
}

button:hover {
  animation: spin 1s;
}

@keyframes spin {
  to { rotate: 360deg; }
}
```

[^jhey15]

---

## 4.15 Position: Sticky for UI Effects

**Concept**

Use sticky positioning for layered, parallax-like effects in scrolling UIs.

**Example**

```css
.header {
  position: sticky;
  top: 0;
  z-index: 1;
}

.content {
  position: relative;
}
```

Useful for parallax headers and layered scrolling effects.

[^jhey16]

---

## 4.16 Staggered Animations with Animation-Delay

**Concept**

Create bopping/staggered effects by delaying animations based on index.

**Example**

```css
.bear {
  --index: 1;
  animation-delay: calc(var(--index) * 0.2s);
}

@keyframes bop {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}
```

Use custom properties to calculate delays dynamically.

[^jhey17]

---

## 4.17 Animated Image Reveals on Scroll

**Concept**

Scale-in images as they enter view using view timelines.

**Example**

```css
img {
  animation: scale-in linear both;
  animation-timeline: view();
  animation-range: entry 50% cover 50%;
}

@keyframes scale-in {
  from { scale: 0; }
}
```

[^jhey18]

---

## 4.18 Landing Page Effects with Scroll-Driven Clips

**Concept**

Unclip shapes and scale images on scroll for immersive reveals, using blurred text on exit.

**Example**

```css
.content {
  clip-path: ellipse(220% 200% at 50% 300%);
  animation: unclip linear both;
  animation-timeline: view();
}

@keyframes unclip {
  to { clip-path: ellipse(220% 200% at 50% 175%); }
}

h2 {
  animation: fade linear;
  animation-timeline: view();
  animation-range: cover 40% cover 85%;
}

@keyframes fade {
  to {
    opacity: 0;
    filter: blur(2rem);
  }
}
```

[^jhey19]

---

## 4.19 Animated Border with Mask Layers

**Concept**

Spin a 1:1 gradient layer behind a mask for efficient border animations without animating the gradient itself.

**Example**

```css
.elem {
  mask: linear-gradient(45deg, black, transparent);
  overflow: hidden;
}

.layer {
  background: conic-gradient(from 0deg, #6366f1, #8b5cf6, #ec4899, #6366f1);
  animation: spin 2s infinite linear;
}

@keyframes spin {
  to { rotate: 360deg; }
}
```

[^jhey20]

---

## Footnotes

[^derek8]: Derek Briggs (@PixelJanitor). Dropdown UI, toast updates, and modal stacks with polished animations. 

[^james6]: James McDonald (@jamesm). Table UI refinements including alignment, metadata text, and icon treatment. 

[^steve6]: Steve Schoger. Secondary button and input styles.

[^steve7]: Steve Schoger. Checkbox and radio label hierarchy. 

[^steve8]: Steve Schoger. Avoiding border-heavy layouts.

[^jhey7]: Jhey Tompkins (@jh3yy). Reusing CSS animation keyframes with custom properties.

[^jhey8]: Jhey Tompkins (@jh3yy). CSS subgrid with scroll-driven transforms and easings.

[^jhey9]: Jhey Tompkins (@jh3yy). Custom property-driven shifts in scroll animations.

[^jhey10]: Jhey Tompkins (@jh3yy). Animating CSS grid tracks on interaction.

[^jhey11]: Jhey Tompkins (@jh3yy). Animated block reveals with logical properties.

[^jhey12]: Jhey Tompkins (@jh3yy). Scroll-triggered image pop-out effect.

[^jhey13]: Jhey Tompkins (@jh3yy). Stacked elements with grid/subgrid and position: sticky.

[^jhey14]: Jhey Tompkins (@jh3yy). Performance-optimized animations (transform and opacity only).

[^jhey15]: Jhey Tompkins (@jh3yy). Animated borders with masks and conic gradients.

[^jhey16]: Jhey Tompkins (@jh3yy). Position: sticky for UI effects (e.g., parallax headers).

[^jhey17]: Jhey Tompkins (@jh3yy). Staggered animations with animation-delay and custom properties.

[^jhey18]: Jhey Tompkins (@jh3yy). Animated image reveals on scroll.

[^jhey19]: Jhey Tompkins (@jh3yy). Landing page effects with scroll-driven clips and scales.

[^jhey20]: Jhey Tompkins (@jh3yy). Animated border with mask layers (no gradient animation).

