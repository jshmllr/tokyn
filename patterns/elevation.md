# Elevating Default Components

Component libraries like shadcn/ui give you solid, accessible defaults. This guide helps you transcend those defaults to create distinctive, polished interfaces.

## The Philosophy

**Default ≠ Done.**

Library defaults are optimized for broad compatibility, not for your specific brand or aesthetic. Elevation is the process of making generic components feel intentional and crafted.

---

## When to Elevate

### Elevate When:
- Building a flagship feature or landing page
- The default feels "flat" or generic
- You need to establish brand presence
- The context demands polish (onboarding, checkout, dashboards)

### Keep Defaults When:
- Building internal tools or admin panels
- Speed matters more than polish
- The component is rarely seen
- Consistency with library ecosystem matters

---

## Elevation Techniques

### Shadows Feel Flat?

Reference: [/docs/01-shadow-borders.md](../docs/01-shadow-borders.md)

**Problem**: Single-layer shadows look artificial.

**Solution**: Shadow stacks with negative spread and color.

```css
/* Default shadcn shadow */
.card {
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

/* Elevated: layered shadow stack */
.card-elevated {
  box-shadow: 
    0 1px 2px oklch(0% 0 0 / 0.04),
    0 2px 4px oklch(0% 0 0 / 0.04),
    0 4px 8px oklch(0% 0 0 / 0.04),
    0 8px 16px oklch(0% 0 0 / 0.04);
}

/* Elevated: colored shadow matching element */
.primary-button-elevated {
  box-shadow: 
    0 2px 4px oklch(var(--primary) / 0.2),
    0 4px 8px oklch(var(--primary) / 0.15);
}
```

**Tailwind**:
```tsx
<Card className="shadow-[0_1px_2px_rgba(0,0,0,0.04),0_2px_4px_rgba(0,0,0,0.04),0_4px_8px_rgba(0,0,0,0.04)]">
```

---

### Buttons Lack Presence?

Reference: [/docs/02-surface-detailing.md](../docs/02-surface-detailing.md)

**Problem**: Buttons feel like rectangles, not physical objects.

**Solution**: Inner highlights, micro-shadows, subtle depth.

```css
/* Default button */
.button {
  background: var(--primary);
}

/* Elevated: inner highlight for depth */
.button-elevated {
  background: var(--primary);
  box-shadow: 
    inset 0 1px 0 oklch(100% 0 0 / 0.15),  /* top highlight */
    inset 0 -1px 0 oklch(0% 0 0 / 0.1),     /* bottom shadow */
    0 1px 2px oklch(0% 0 0 / 0.1);          /* drop shadow */
}

/* Elevated: active state with physical feedback */
.button-elevated:active {
  box-shadow: 
    inset 0 1px 2px oklch(0% 0 0 / 0.1);   /* pressed inward */
  transform: translateY(1px);
}
```

**Dark Mode Inner Highlight**:
```css
.dark .button-elevated {
  box-shadow: 
    inset 0 1px 0 oklch(100% 0 0 / 0.08),  /* subtle in dark mode */
    0 1px 3px oklch(0% 0 0 / 0.3);
}
```

---

### Backgrounds Feel Empty?

Reference: [/docs/03-backgrounds-texture.md](../docs/03-backgrounds-texture.md)

**Problem**: Solid color backgrounds feel lifeless.

**Solution**: Subtle noise, gradients, or patterns.

```css
/* Noise overlay */
.bg-textured {
  background-color: var(--background);
  position: relative;
}

.bg-textured::after {
  content: '';
  position: absolute;
  inset: 0;
  background-image: url('/noise.svg');
  opacity: 0.03;
  pointer-events: none;
}

/* Subtle gradient */
.bg-gradient-subtle {
  background: linear-gradient(
    180deg,
    oklch(98% 0.005 250) 0%,
    oklch(96% 0.005 250) 100%
  );
}

/* Grid pattern (fades out) */
.bg-grid {
  background-image: 
    linear-gradient(to right, oklch(0% 0 0 / 0.03) 1px, transparent 1px),
    linear-gradient(to bottom, oklch(0% 0 0 / 0.03) 1px, transparent 1px);
  background-size: 24px 24px;
  mask-image: linear-gradient(to bottom, black 50%, transparent 100%);
}
```

---

### Cards Look Generic?

**Problem**: Every card looks the same.

**Solution**: Contextual styling based on content.

```css
/* Feature card: prominent */
.card-feature {
  background: linear-gradient(
    135deg,
    var(--card) 0%,
    oklch(from var(--card) l calc(c + 0.01) h) 100%
  );
  border: 1px solid oklch(0% 0 0 / 0.05);
  box-shadow: 
    0 4px 6px oklch(0% 0 0 / 0.05),
    0 10px 20px oklch(0% 0 0 / 0.04);
}

/* Interactive card: responds to hover */
.card-interactive {
  transition: all 250ms cubic-bezier(0.16, 1, 0.3, 1);
}

.card-interactive:hover {
  transform: translateY(-2px);
  box-shadow: 
    0 8px 16px oklch(0% 0 0 / 0.08),
    0 16px 32px oklch(0% 0 0 / 0.06);
}

/* Subtle card: recedes */
.card-subtle {
  background: oklch(from var(--background) l c h / 0.5);
  border: 1px solid oklch(0% 0 0 / 0.03);
  box-shadow: none;
}
```

---

### Inputs Feel Flat?

**Problem**: Form inputs don't invite interaction.

**Solution**: Focus states with depth and glow.

```css
/* Elevated input */
.input-elevated {
  transition: all 200ms ease-out;
  box-shadow: inset 0 1px 2px oklch(0% 0 0 / 0.05);
}

.input-elevated:focus {
  box-shadow: 
    inset 0 1px 2px oklch(0% 0 0 / 0.05),
    0 0 0 3px oklch(var(--primary) / 0.1),
    0 0 20px oklch(var(--primary) / 0.1);
}

/* Dark mode: glow is more pronounced */
.dark .input-elevated:focus {
  box-shadow: 
    inset 0 1px 2px oklch(0% 0 0 / 0.2),
    0 0 0 3px oklch(var(--primary) / 0.2),
    0 0 30px oklch(var(--primary) / 0.15);
}
```

---

### Tables Look Spreadsheet-y?

Reference: [/docs/04-components-layout.md](../docs/04-components-layout.md)

**Problem**: Tables feel like Excel, not like designed UI.

**Solution**: Subtle row differentiation, refined borders.

```css
/* Elevated table */
.table-elevated {
  border-collapse: separate;
  border-spacing: 0;
}

.table-elevated th {
  background: oklch(from var(--muted) l c h);
  font-weight: 500;
  text-transform: uppercase;
  font-size: 0.75rem;
  letter-spacing: 0.05em;
}

.table-elevated td {
  border-bottom: 1px solid oklch(0% 0 0 / 0.05);
}

.table-elevated tr:hover td {
  background: oklch(from var(--accent) l c h / 0.5);
}

/* Sticky header with shadow */
.table-elevated thead {
  position: sticky;
  top: 0;
  box-shadow: 0 1px 0 oklch(0% 0 0 / 0.1);
}
```

---

## The Refinement Workflow

1. **Build with defaults first**
   - Get functionality working
   - Don't optimize prematurely

2. **Identify elevation opportunities**
   - Run `audit` command
   - Note where defaults feel flat

3. **Apply techniques selectively**
   - Reference this guide and `/docs/`
   - Elevate high-impact areas first

4. **Verify consistency**
   - Elevated components should feel cohesive
   - Don't mix elevation levels arbitrarily

5. **Final pass**
   - Run `polish` command
   - Run `rams` for accessibility

---

## Elevation Levels

Use consistent elevation levels across your project:

| Level | Use Case | Shadows | Interaction |
|-------|----------|---------|-------------|
| **0** | Recessed (inputs) | Inset shadow | N/A |
| **1** | Default surface | Subtle shadow | N/A |
| **2** | Cards, panels | Medium shadow | Hover lift |
| **3** | Dropdowns, modals | Strong shadow | N/A |
| **4** | Floating elements | Prominent shadow | N/A |

```css
:root {
  --elevation-0: inset 0 1px 2px oklch(0% 0 0 / 0.05);
  --elevation-1: 0 1px 2px oklch(0% 0 0 / 0.05);
  --elevation-2: 0 2px 4px oklch(0% 0 0 / 0.05), 0 4px 8px oklch(0% 0 0 / 0.05);
  --elevation-3: 0 4px 8px oklch(0% 0 0 / 0.08), 0 8px 16px oklch(0% 0 0 / 0.08);
  --elevation-4: 0 8px 16px oklch(0% 0 0 / 0.1), 0 16px 32px oklch(0% 0 0 / 0.1);
}
```

---

## Anti-Patterns

### Don't: Over-elevate everything
```css
/* BAD - every element has heavy shadows */
.everything { box-shadow: 0 10px 40px rgba(0,0,0,0.3); }
```

### Don't: Mix metaphors
```css
/* BAD - some elements have depth, others are flat */
.card { box-shadow: var(--elevation-3); }
.adjacent-card { box-shadow: none; }  /* Why different? */
```

### Don't: Elevate for elevation's sake
```css
/* BAD - decorative without purpose */
.plain-text { text-shadow: 0 2px 4px rgba(0,0,0,0.1); }
```

### Don't: Forget dark mode
```css
/* BAD - shadows invisible in dark mode */
.card { box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
/* Needs: stronger shadows or glow in dark mode */
```
