# Theme Architecture

A universal theming approach that works across any tech stack. Based on CSS custom properties as the single source of truth.

## Core Principles

1. **CSS custom properties are the source of truth** — Works everywhere
2. **Semantic tokens over primitives** — Components reference meaning, not values
3. **Theme switching via data attribute** — Simple, performant, no JS required
4. **Dark mode is a first-class citizen** — Not an afterthought

---

## The Token Layer

### Primitives (Raw Values)

Primitives are the raw building blocks. They have no semantic meaning.

```css
/* /tokens/primitives.css */
:root {
  /* Spacing scale */
  --space-1: 4px;
  --space-2: 8px;
  --space-3: 12px;
  --space-4: 16px;
  --space-6: 24px;
  --space-8: 32px;
  --space-12: 48px;
  --space-16: 64px;

  /* Color palette (OKLCH for perceptual uniformity) */
  --gray-50: oklch(98% 0.005 250);
  --gray-100: oklch(95% 0.005 250);
  --gray-200: oklch(90% 0.005 250);
  --gray-300: oklch(82% 0.005 250);
  --gray-400: oklch(70% 0.005 250);
  --gray-500: oklch(55% 0.005 250);
  --gray-600: oklch(45% 0.005 250);
  --gray-700: oklch(35% 0.005 250);
  --gray-800: oklch(25% 0.005 250);
  --gray-900: oklch(18% 0.005 250);
  --gray-950: oklch(12% 0.005 250);

  /* Brand colors */
  --blue-500: oklch(55% 0.2 250);
  --blue-600: oklch(48% 0.2 250);
  --green-500: oklch(65% 0.2 145);
  --red-500: oklch(55% 0.2 25);

  /* Typography */
  --font-sans: system-ui, -apple-system, sans-serif;
  --font-mono: ui-monospace, monospace;
  
  --text-xs: 0.75rem;
  --text-sm: 0.875rem;
  --text-base: 1rem;
  --text-lg: 1.125rem;
  --text-xl: 1.25rem;
  --text-2xl: 1.5rem;

  /* Radius */
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-full: 9999px;
}
```

### Semantic Tokens (Meaningful Aliases)

Semantic tokens map primitives to meaning. They change with theme.

```css
/* /tokens/semantic.css */
:root {
  /* Backgrounds */
  --color-bg-primary: var(--gray-50);
  --color-bg-secondary: var(--gray-100);
  --color-bg-tertiary: var(--gray-200);
  --color-bg-inverse: var(--gray-900);

  /* Foregrounds (text) */
  --color-text-primary: var(--gray-900);
  --color-text-secondary: var(--gray-600);
  --color-text-tertiary: var(--gray-500);
  --color-text-inverse: var(--gray-50);
  --color-text-muted: var(--gray-400);

  /* Borders */
  --color-border-default: var(--gray-200);
  --color-border-strong: var(--gray-300);
  --color-border-muted: var(--gray-100);

  /* Interactive */
  --color-primary: var(--blue-500);
  --color-primary-hover: var(--blue-600);
  --color-primary-foreground: white;

  /* Status */
  --color-success: var(--green-500);
  --color-error: var(--red-500);

  /* Shadows */
  --shadow-sm: 0 1px 2px oklch(0% 0 0 / 0.05);
  --shadow-md: 0 2px 4px oklch(0% 0 0 / 0.05), 0 4px 8px oklch(0% 0 0 / 0.05);
  --shadow-lg: 0 4px 8px oklch(0% 0 0 / 0.08), 0 8px 16px oklch(0% 0 0 / 0.08);
}

/* Dark theme overrides */
[data-theme="dark"] {
  --color-bg-primary: var(--gray-950);
  --color-bg-secondary: var(--gray-900);
  --color-bg-tertiary: var(--gray-800);
  --color-bg-inverse: var(--gray-50);

  --color-text-primary: var(--gray-50);
  --color-text-secondary: var(--gray-300);
  --color-text-tertiary: var(--gray-400);
  --color-text-inverse: var(--gray-900);
  --color-text-muted: var(--gray-500);

  --color-border-default: var(--gray-800);
  --color-border-strong: var(--gray-700);
  --color-border-muted: var(--gray-900);

  /* Shadows need to be stronger in dark mode */
  --shadow-sm: 0 1px 2px oklch(0% 0 0 / 0.2);
  --shadow-md: 0 2px 4px oklch(0% 0 0 / 0.2), 0 4px 8px oklch(0% 0 0 / 0.2);
  --shadow-lg: 0 4px 8px oklch(0% 0 0 / 0.3), 0 8px 16px oklch(0% 0 0 / 0.3);
}
```

---

## Theme Switching

### HTML Setup

```html
<!DOCTYPE html>
<html data-theme="light">
  <head>
    <meta name="color-scheme" content="light dark">
    <meta name="theme-color" content="#fafafa">
    <link rel="stylesheet" href="/tokens/index.css">
  </head>
  <body>
    <!-- App -->
  </body>
</html>
```

### JavaScript Toggle

```typescript
function setTheme(theme: 'light' | 'dark' | 'system') {
  const root = document.documentElement;
  
  if (theme === 'system') {
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    root.dataset.theme = prefersDark ? 'dark' : 'light';
  } else {
    root.dataset.theme = theme;
  }
  
  // Update meta theme-color
  const themeColor = getComputedStyle(root).getPropertyValue('--color-bg-primary');
  document.querySelector('meta[name="theme-color"]')?.setAttribute('content', themeColor.trim());
  
  // Persist preference
  localStorage.setItem('theme', theme);
}

// Initialize on load
function initTheme() {
  const saved = localStorage.getItem('theme') as 'light' | 'dark' | 'system' | null;
  setTheme(saved || 'system');
}

// Listen for system changes
window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
  if (localStorage.getItem('theme') === 'system') {
    setTheme('system');
  }
});
```

### React Hook

```tsx
import { useEffect, useState } from 'react';

type Theme = 'light' | 'dark' | 'system';

export function useTheme() {
  const [theme, setThemeState] = useState<Theme>('system');

  useEffect(() => {
    const saved = localStorage.getItem('theme') as Theme | null;
    if (saved) setThemeState(saved);
  }, []);

  const setTheme = (newTheme: Theme) => {
    setThemeState(newTheme);
    
    const root = document.documentElement;
    if (newTheme === 'system') {
      const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
      root.dataset.theme = prefersDark ? 'dark' : 'light';
    } else {
      root.dataset.theme = newTheme;
    }
    
    localStorage.setItem('theme', newTheme);
  };

  return { theme, setTheme };
}
```

---

## Component Theming

### Rule: Always Use Semantic Tokens

```css
/* ❌ Bad: Uses primitive directly */
.card {
  background: var(--gray-100);
  color: var(--gray-900);
  border: 1px solid var(--gray-200);
}

/* ✅ Good: Uses semantic tokens */
.card {
  background: var(--color-bg-secondary);
  color: var(--color-text-primary);
  border: 1px solid var(--color-border-default);
}
```

### Why Semantic Tokens?

1. **Automatic theme support** — Dark mode works without changing components
2. **Meaningful names** — `--color-text-secondary` is clearer than `--gray-600`
3. **Single point of change** — Update the semantic token, all uses update
4. **Constraint** — Limits palette to intentional choices

### When Primitives Are Acceptable

- Building the semantic token layer itself
- One-off decorative elements
- When no semantic meaning applies

```css
/* Acceptable: decorative gradient using primitives */
.hero-gradient {
  background: linear-gradient(
    135deg,
    var(--blue-500) 0%,
    var(--purple-500) 100%
  );
}
```

---

## Framework Integration

### Vanilla CSS

```css
/* Just import the tokens */
@import '/tokens/index.css';

.button {
  background: var(--color-primary);
  color: var(--color-primary-foreground);
}
```

### Tailwind CSS

```js
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        background: 'var(--color-bg-primary)',
        foreground: 'var(--color-text-primary)',
        primary: {
          DEFAULT: 'var(--color-primary)',
          foreground: 'var(--color-primary-foreground)',
        },
        secondary: {
          DEFAULT: 'var(--color-bg-secondary)',
          foreground: 'var(--color-text-secondary)',
        },
        muted: {
          DEFAULT: 'var(--color-bg-tertiary)',
          foreground: 'var(--color-text-muted)',
        },
        border: 'var(--color-border-default)',
      },
      borderRadius: {
        sm: 'var(--radius-sm)',
        md: 'var(--radius-md)',
        lg: 'var(--radius-lg)',
      },
      boxShadow: {
        sm: 'var(--shadow-sm)',
        md: 'var(--shadow-md)',
        lg: 'var(--shadow-lg)',
      },
    },
  },
};
```

### CSS-in-JS (styled-components, emotion)

```tsx
// Access tokens via CSS variables
const Card = styled.div`
  background: var(--color-bg-secondary);
  border: 1px solid var(--color-border-default);
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-sm);
`;
```

### Vue

```vue
<style scoped>
.card {
  background: var(--color-bg-secondary);
  border: 1px solid var(--color-border-default);
}
</style>
```

### Svelte

```svelte
<style>
  .card {
    background: var(--color-bg-secondary);
    border: 1px solid var(--color-border-default);
  }
</style>
```

---

## Dark Mode Considerations

### Shadows

Shadows need to be stronger in dark mode to be visible:

```css
:root {
  --shadow-md: 0 4px 8px oklch(0% 0 0 / 0.08);
}

[data-theme="dark"] {
  --shadow-md: 0 4px 8px oklch(0% 0 0 / 0.25);
}
```

### Borders

Borders may need to be more prominent:

```css
:root {
  --color-border-default: var(--gray-200);
}

[data-theme="dark"] {
  --color-border-default: var(--gray-700);  /* Not gray-800, needs contrast */
}
```

### Images and Icons

Consider inverting or adjusting:

```css
[data-theme="dark"] img.invertible {
  filter: invert(1) hue-rotate(180deg);
}

[data-theme="dark"] .icon {
  opacity: 0.9;  /* Slightly dimmed */
}
```

### Color Scheme Declaration

Always declare color-scheme for native elements:

```css
:root {
  color-scheme: light;
}

[data-theme="dark"] {
  color-scheme: dark;
}
```

This affects:
- Scrollbar colors
- Form control colors
- `<select>` dropdown backgrounds
- System dialogs

---

## Testing Themes

### Checklist

- [ ] All text meets contrast requirements in both themes
- [ ] Shadows are visible in dark mode
- [ ] Borders have sufficient contrast
- [ ] Form controls are styled (not browser defaults)
- [ ] Images/icons work in both themes
- [ ] Focus indicators are visible
- [ ] `color-scheme` is set correctly
- [ ] `theme-color` meta tag updates

### Browser Testing

```css
/* Force a theme for testing */
html { data-theme: dark !important; }

/* Or use media query override in DevTools */
@media (prefers-color-scheme: dark) {
  /* ... */
}
```

---

## Anti-Patterns

### Don't: Hardcode Theme-Specific Values

```css
/* ❌ Bad: Only works in light mode */
.card {
  background: white;
  color: #333;
}

/* ✅ Good: Works in any theme */
.card {
  background: var(--color-bg-primary);
  color: var(--color-text-primary);
}
```

### Don't: Use Separate Dark Mode Stylesheets

```html
<!-- ❌ Bad: Separate files -->
<link rel="stylesheet" href="light.css" media="(prefers-color-scheme: light)">
<link rel="stylesheet" href="dark.css" media="(prefers-color-scheme: dark)">

<!-- ✅ Good: Single file with data-theme -->
<link rel="stylesheet" href="tokens.css">
```

### Don't: Duplicate Component Styles

```css
/* ❌ Bad: Duplicating styles for each theme */
.button { background: blue; }
.dark .button { background: lightblue; }

/* ✅ Good: Single definition using tokens */
.button { background: var(--color-primary); }
```

### Don't: Forget System Preference

```typescript
// ❌ Bad: Only light/dark options
type Theme = 'light' | 'dark';

// ✅ Good: Include system option
type Theme = 'light' | 'dark' | 'system';
```
