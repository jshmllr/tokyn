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

