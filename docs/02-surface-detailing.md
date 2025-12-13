# 2. Surface and Shape Detailing

## 2.1 Inner Highlights for Dark Containers

**Concept**

Add a subtle inner highlight along the inner edge of a dark container to make the silhouette sharp.

```css
.dark-card {
  background: #020617;
  border-radius: 1rem;
  box-shadow:
    inset 0 0 0 1px rgba(255, 255, 255, 0.05),
    0 12px 40px rgba(0, 0, 0, 0.75);
}
```

Use on:

* Dark dashboard cards
* Command palettes
* Dark mode modals

[^derek4]

---

## 2.2 Concentric Border Radius

**Concept**

When you nest shapes, inner curves should follow the outer curve.

**Rule**

```css
.outer {
  border-radius: 12px;
  padding: 2px;
}

.inner {
  border-radius: 10px; /* 12 - 2 = concentric curves */
}
```

Works nicely for:

* Icon inside app-icon
* "Paper" inside card
* Nested button states

[^derek5]

---

## 2.3 macOS-style Micro-shadow Buttons

**Concept**

Small, crisp buttons with extremely fine shadows for depth.

```css
button.mac {
  all: unset;
  box-sizing: border-box;
  font: 13px -apple-system, BlinkMacSystemFont, system-ui, sans-serif;
  color: #262626;
  background: #ffffff;
  border-radius: 5px;
  height: 20px;
  padding: 0 10px;

  box-shadow:
    0 0 0 0.5px rgba(0, 0, 0, 0.076),
    0 0.5px 0 rgba(0, 0, 0, 0.035),
    0 -1px 1px 0.3px rgba(0, 0, 0, 0.0255),
    0 1px 1px rgba(0, 0, 0, 0.01),
    -1px 1px 1px 0.3px rgba(0, 0, 0, 0.05),
    1px 1px 1px 0.3px rgba(0, 0, 0, 0.05);
}
```

Use for:

* Dialog actions
* Toolbar actions
* Dense control panels

[^derek6]

---

## 2.4 Glass / Frosted Buttons and Panels

**Concept**

Translucent surfaces with blur and subtle border for a glass effect.

```css
.glass {
  position: relative;
  border-radius: 999px;
  background: rgba(15, 23, 42, 0.35);
  border: 1px solid rgba(255, 255, 255, 0.18);
  backdrop-filter: blur(16px);
  -webkit-backdrop-filter: blur(16px);
  box-shadow:
    0 18px 45px rgba(15, 23, 42, 0.6);
}
```

Good on:

* Hero overlays
* AI / dashboard highlight chips
* Docks and floating controls

[^derek7]

---

## 2.5 3D / Glossy Surfaces (Folded, Glossy, Gemstone, 3D Lines)

**Concept**

Multiple gradients plus inner shadows simulate folds, gloss, and facets.

**Folded Panel**

```css
.folded {
  border-radius: 1.25rem;
  overflow: hidden;
  background: linear-gradient(135deg, #020617, #0f172a);
  box-shadow:
    inset 0 1px 0 rgba(255, 255, 255, 0.16),
    inset 0 -1px 0 rgba(15, 23, 42, 0.9),
    0 18px 50px rgba(0, 0, 0, 0.7);
}
```

**Glossy Highlight**

* Add a blurred white oval at the top or center.
* Use another inner shadow to create the "edge" of the gloss.

Keep this for key icons and marketing elements, not for every button.

[^fons2]

---

## 2.6 Icon and Avatar Framing

**Concept**

Frame icons and avatars in small shapes or overlapping stacks to make them feel intentional.

```css
.icon-chip {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.5rem;
  border-radius: 999px;
  background: rgba(15, 23, 42, 0.06);
}

.avatar {
  border-radius: 999px;
  border: 3px solid #ffffff; /* matches background */
  margin-left: -12px;         /* for overlapping stacks */
}
```

[^steve3]

---

## 2.7 Color Strips and Accents on Panels

**Concept**

Use a narrow colored strip at the top to signal brand or status.

```css
.card-accent {
  position: relative;
  border-radius: 1rem;
  overflow: hidden;
  background: #ffffff;
}

.card-accent::before {
  content: "";
  position: absolute;
  inset: 0;
  height: 6px;
  background: linear-gradient(to right, #06b6d4, #6366f1);
}
```

Great for:

* Status cards (success / warning / error)
* Pricing tiers
* "Featured" or "Pro" blocks

[^steve4]

---

## 2.8 3D CSS Cuboids and Transformations

**Concept**

Think in 3D cubes for elements; use perspective and rotates for depth, shadows for realistic borders. Create 3D surfaces using CSS transforms and inner shadows.

**Example**

```css
.scene {
  perspective: 1000px;
}

.cube {
  transform-style: preserve-3d;
}

.face {
  position: absolute;
  box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.1); /* Inner shadow border */
}
```

Use perspective on the container and `transform-style: preserve-3d` on the cube element. Position faces absolutely and apply inner shadows for realistic depth.

[^jhey4]

---

## Footnotes

[^derek4]: Derek Briggs (@PixelJanitor). Inner highlights for dark mode containers. 

[^derek5]: Derek Briggs (@PixelJanitor). Concentric border radius technique. 

[^derek6]: Derek Briggs (@PixelJanitor). macOS-style micro-shadow buttons. 

[^derek7]: Derek Briggs (@PixelJanitor). Glass/frosted buttons and panels. 

[^fons2]: Fons Mans (@FonsMans). Folded gradient, glossy icon, gemstone, and 3D line effects.

[^steve3]: Steve Schoger. Icon and avatar framing techniques.

[^steve4]: Steve Schoger. Color strips and accents on panels.

[^jhey4]: Jhey Tompkins (@jh3yy). 3D CSS cuboids and transformations.
