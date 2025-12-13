# 1. Shadow and Border Systems

## 1.1 Shadow Borders with Negative Spread (CSS / Tailwind)

**Concept**

Use `box-shadow` as the "border" instead of the `border` property.  
This keeps element dimensions consistent and blends border and shadow into one system.

**Why**

- Traditional borders increase the box size and break alignment.  
- Shadow borders stay outside the layout math, but still read as an edge.  
- Blending with the drop shadow creates natural gradients around the element.

**Base CSS**

```css
.card {
  background: #ffffff;
  border-radius: 0.75rem;
  /* Critical: prevents background from painting under the shadow-border */
  background-clip: padding-box;

  box-shadow:
    /* 1px "border" */
    0 0 0 1px rgba(15, 23, 42, 0.08),
    /* supporting depth shadows */
    0 1px 1px -1px rgba(15, 23, 42, 0.10),
    0 3px 6px -3px rgba(15, 23, 42, 0.15);
}
```

**Tailwind-style shadow token**

```js
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      boxShadow: {
        card: `
          0 0 0 1px rgba(15, 23, 42, 0.08),
          0 1px 1px -1px rgba(15, 23, 42, 0.10),
          0 3px 6px -3px rgba(15, 23, 42, 0.15)
        `,
      },
    },
  },
};
```

Apply via:

```html
<div class="bg-white rounded-xl shadow-card"></div>
```

[^derek1]

---

## 1.2 Natural Shadow Stacks with Negative Spread

**Concept**

Make shadows hug the element instead of blooming outward by combining:

* Increasing `y` offsets (distance)
* Matching blur to offset
* Negative spread ≈ half the offset

**Example**

```css
.elevated {
  --shadow-color: rgb(0 0 0 / 0.06);

  box-shadow:
    0 0 0 1px var(--shadow-color),
    0 1px 1px -0.5px var(--shadow-color),
    0 3px 3px -1.5px var(--shadow-color),
    0 6px 6px -3px var(--shadow-color),
    0 12px 12px -6px var(--shadow-color),
    0 24px 24px -12px var(--shadow-color);
}
```

This works as a single reusable "elevated surface" token.

[^derek2]

---

## 1.3 Inner Shadows as Borders (Figma and CSS)

**Concept**

Use inner shadows to create soft edges instead of stroked borders.

**Figma Recipe**

* Add an `Inner shadow` effect.
* Color: `#ffffff` for dark backgrounds, slightly darker neutral for light.
* X: `0`, Y: `1–2`
* Blur: `0–2`, Spread: `0`
* Opacity: 20–60% depending on contrast.

**CSS Equivalent**

```css
.card-soft {
  background: #f9fafb;
  border-radius: 0.75rem;
  box-shadow:
    inset 0 1px 0 rgba(255, 255, 255, 0.7),
    0 1px 3px rgba(15, 23, 42, 0.15);
}
```

Use this for:

* Buttons in toolbars
* Cards on colored surfaces
* Tiles over imagery

[^james1]

---

## 1.4 Transparent / Soft Borders Instead of Solid Strokes

**Concept**

Instead of a solid gray border, use a black or hue-tinted border at low opacity.

**Example**

```css
.input {
  background: #ffffff;
  border-radius: 0.5rem;
  border: 1px solid rgba(15, 23, 42, 0.08);
  box-shadow:
    0 1px 2px rgba(15, 23, 42, 0.04);
}
```

This keeps edges crisp but integrated with the environment.

[^steve1]

---

## 1.5 Colored (Saturated) Shadows

**Concept**

Use shadows tinted with your brand or background color for realism.

**Example**

```css
.button-primary {
  background: #2563eb;
  color: #ffffff;
  border-radius: 999px;
  padding: 0.5rem 1.25rem;
  box-shadow:
    0 10px 20px rgba(37, 99, 235, 0.35);
}
```

Good for:

* Hero CTAs
* Feature cards
* Highlighted states

[^fons1]

---

## 1.6 Text Shadows for Legibility

**Concept**

White text on noisy or bright backgrounds often needs a tiny shadow.

```css
.hero-title {
  color: #ffffff;
  text-shadow:
    0 1px 2px rgba(0, 0, 0, 0.45);
}
```

Keep blur and distance small to avoid a glowy look.

[^steve2]

---

## 1.7 Dark Mode Depth and Reflection

**Concept**

In dark themes, use light edges and inner highlights instead of heavy dark shadows.

```css
.panel-dark {
  background: #111827;
  border-radius: 0.75rem;
  box-shadow:
    inset 0 1px 0 rgba(255, 255, 255, 0.04), /* top reflection */
    0 0 0 1px rgba(15, 23, 42, 0.9);         /* edge definition */
}
```

Depth is created by layering shades of dark, not by one big black shadow.

[^derek3]

---

## 1.8 Shadows for 3D Depth in Layered Elements

**Concept**

Use shadows as "borders" for 3D depth without actual borders when building layered or animated elements. Shadows provide depth cues while maintaining layout consistency.

**Example**

```css
.light {
  --index: 1;
  animation-delay: calc(var(--index) * -0.2s);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Shadow as border */
}
```

Use custom properties to control shadow behavior dynamically across multiple elements.

[^jhey1]

---

## 1.9 Shadows as Soft Outlines in CSS Illustrations

**Concept**

When drawing complex shapes with CSS, use shadows to create soft borders and outlines instead of hard strokes. This creates more organic, refined edges.

**Example**

```css
.shape {
  background: linear-gradient(135deg, #6366f1, #8b5cf6);
  clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%);
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}
```

Layer multiple divs with backgrounds and clip-paths, then add box-shadow for border-like effects that feel more natural than strokes.

[^jhey2]

---

## Footnotes

[^derek1]: Derek Briggs (@PixelJanitor). Shadow borders technique with negative spread.

[^derek2]: Derek Briggs (@PixelJanitor). Natural shadow stacks with negative spread. 

[^derek3]: Derek Briggs (@PixelJanitor). Dark mode depth and reflection techniques.

[^james1]: James McDonald (@jamesm). Inner shadows as borders or enhancers.

[^steve1]: Steve Schoger. Transparent/soft borders instead of solid strokes. 

[^steve2]: Steve Schoger. Text shadows for legibility on bright backgrounds.

[^fons1]: Fons Mans (@FonsMans). Saturated shadows for realism.

[^jhey1]: Jhey Tompkins (@jh3yy). Shadows for 3D depth in layered elements.

[^jhey2]: Jhey Tompkins (@jh3yy). Shadows as soft outlines in CSS illustrations.

