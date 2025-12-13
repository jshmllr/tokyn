# 3. Backgrounds, Patterns, and Texture

## 3.1 Noise Overlays

**Concept**

Add a noise overlay on large surfaces to avoid sterile, flat gradients.

```css
.surface {
  position: relative;
  background: linear-gradient(135deg, #0f172a, #1d283a);
  overflow: hidden;
}

.surface::after {
  content: "";
  position: absolute;
  inset: 0;
  opacity: 0.12;
  pointer-events: none;
  background-image: url("/noise.png"); /* transparent grain PNG */
  mix-blend-mode: soft-light;
}
```

[^fons3]

---

## 3.2 Ultra Gradients and Blob Blends

**Concept**

Large blurred blobs of brand colors on a dark background create deep, vivid gradients.

```css
.gradient-bg {
  position: relative;
  background: #020617;
  overflow: hidden;
}

.gradient-bg::before {
  content: "";
  position: absolute;
  inset: -40%;
  background:
    radial-gradient(circle at 20% 30%, #38bdf8 0, transparent 60%),
    radial-gradient(circle at 80% 70%, #a855f7 0, transparent 60%);
  filter: blur(40px);
  opacity: 0.9;
}
```

Optionally combine with the noise overlay pattern.

[^fons4]

---

## 3.3 Grid Backgrounds via Masking

**Concept**

Subtle grid patterns help sell "data" without overwhelming the UI.

**Logical Steps**

1. Build a small grid of squares or strokes (e.g. 8×8) in Figma.
2. Tile or stretch it.
3. Mask it with a rectangle that has a gradient to transparent.
4. Lower opacity.

If needed in code, export the pattern as a bitmap and use as a repeating background.

[^james2]

---

## 3.4 Wavy Line Textures

**Concept**

Gently curved lines layered with gradients suggest motion and flow.

**Approach**

* Draw one wavy line using curves.
* Duplicate vertically with consistent spacing.
* Combine into a single vector and apply a gradient stroke.
* Fade using mask or lowered opacity.

Useful behind:

* Analytics visuals
* AI "signal" sections
* Hero backgrounds

[^james3]

---

## 3.5 Blurred Logo or Shape Backgrounds

**Concept**

Use a heavily blurred logo or shape behind content for subtle brand flavor.

**Approach**

* Place a large version of the logo behind the main content.
* Set it to brand color.
* Apply strong blur and reduce opacity.
* Blend with either `Overlay`/`Soft light` (design tools) or similar CSS layering.

[^james4]

---

## 3.6 Dotted Patterns with Randomized Opacity

**Concept**

Dot grids feel more organic if opacity is randomized.

**Implementation Idea**

* Create a grid of dots in Figma.
* Use a plugin or manual tweaking to randomize opacity ranges (e.g., 20–80%).
* Export as PNG or SVG.
* Use as a background image in CSS.

[^james5]

---

## 3.7 Image and Illustration Fades

**Concept**

Fade images into the background to avoid hard edges.

```css
.image-fade {
  position: relative;
  overflow: hidden;
}

.image-fade img {
  display: block;
  width: 100%;
  height: auto;
}

.image-fade::after {
  content: "";
  position: absolute;
  inset: auto 0 0 0;
  height: 40%;
  background: linear-gradient(to bottom, transparent, #f9fafb);
}
```

[^fons5]

---

## 3.8 Bleeding Images Out of Containers

**Concept**

Allow images to break out of padding on one or more sides for visual energy.

**Example**

```css
.card {
  border-radius: 1rem;
  background: #ffffff;
  padding: 1.5rem;
  overflow: hidden;
}

.card img.hero {
  width: 100%;
  margin: -1.5rem -1.5rem 1rem; /* bleeds to card edges */
  display: block;
}
```

[^steve5]

---

## 3.9 Interactive 3D Backdrops

**Concept**

Create immersive 3D backdrops and logos with CSS using layered transforms and shadows for depth cues. Add interactions via hover for dynamic effects. These work well as hero backgrounds or feature section backgrounds.

**Example**

```css
.backdrop {
  position: relative;
  transform-style: preserve-3d;
}

.star {
  transform: rotateX(45deg) rotateY(30deg);
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
}

.star:hover {
  transform: rotateX(60deg) rotateY(40deg);
  transition: transform 0.3s ease;
}
```

Layer transforms and add interactions via `:hover`. Use shadows to enhance the 3D effect and provide depth cues.

[^jhey6]

---

## Footnotes

[^fons3]: Fons Mans (@FonsMans). Add noise to gradients for texture (Tip #3).

[^fons4]: Fons Mans (@FonsMans). Ultra gradient technique with blob blends. 

[^fons5]: Fons Mans (@FonsMans). Image fade effect technique.

[^james2]: James McDonald (@jamesm). Grid backgrounds with masks and gradients. 

[^james3]: James McDonald (@jamesm). Wavy line textures for backgrounds. 

[^james4]: James McDonald (@jamesm). Blurred background patterns with plugins.

[^james5]: James McDonald (@jamesm). Dotted patterns with random opacity. 

[^steve5]: Steve Schoger. Overlapping images and bleeding images out of containers.

[^jhey6]: Jhey Tompkins (@jh3yy). Interactive 3D backdrops and logos.

