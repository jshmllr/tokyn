# Extending Component Libraries

When using shadcn/ui, Radix, Headless UI, or similar libraries, follow these patterns to extend without duplicating.

## The Golden Rule

**Wrap, don't fork.**

Create project-specific variants by wrapping library components, not by copying their source code.

---

## Wrapping Patterns

### Basic Wrapper

Add project-specific defaults without touching the original:

```tsx
// components/ui/fancy-button.tsx
import { Button, ButtonProps } from "@/components/ui/button"
import { cn } from "@/lib/utils"

interface FancyButtonProps extends ButtonProps {
  glow?: boolean
}

export const FancyButton = ({ 
  className, 
  glow = false,
  ...props 
}: FancyButtonProps) => (
  <Button 
    className={cn(
      "shadow-lg shadow-primary/25 hover:shadow-xl transition-shadow",
      glow && "ring-2 ring-primary/20",
      className
    )}
    {...props}
  />
)
```

### Preset Wrapper

Lock in specific configurations for common use cases:

```tsx
// components/ui/icon-button.tsx
import { Button, ButtonProps } from "@/components/ui/button"

type IconButtonProps = Omit<ButtonProps, 'size'> & {
  label: string // Required for accessibility
}

export const IconButton = ({ label, children, ...props }: IconButtonProps) => (
  <Button 
    size="icon" 
    aria-label={label}
    {...props}
  >
    {children}
  </Button>
)
```

### Compound Wrapper

Compose multiple library components into a higher-level abstraction:

```tsx
// components/ui/form-field.tsx
import { Label } from "@/components/ui/label"
import { Input } from "@/components/ui/input"
import { cn } from "@/lib/utils"

interface FormFieldProps {
  label: string
  error?: string
  // ... input props
}

export const FormField = ({ label, error, ...inputProps }: FormFieldProps) => (
  <div className="space-y-2">
    <Label>{label}</Label>
    <Input 
      className={cn(error && "border-destructive")} 
      aria-invalid={!!error}
      {...inputProps} 
    />
    {error && (
      <p className="text-sm text-destructive">{error}</p>
    )}
  </div>
)
```

---

## Token Extension

Add project-specific tokens alongside library tokens, never replacing them.

### CSS Custom Properties

```css
/* globals.css - AFTER shadcn/ui tokens */

:root {
  /* === Project Extensions === */
  
  /* Shadows with color */
  --shadow-glow: 0 0 20px oklch(var(--primary) / 0.3);
  --shadow-soft: 0 4px 12px oklch(0% 0 0 / 0.08);
  --shadow-hard: 0 2px 4px oklch(0% 0 0 / 0.12);
  
  /* Surface effects */
  --surface-shine: linear-gradient(
    135deg,
    oklch(100% 0 0 / 0.1) 0%,
    transparent 50%
  );
  --surface-noise: url('/noise.svg');
  
  /* Animation */
  --ease-out-expo: cubic-bezier(0.16, 1, 0.3, 1);
  --duration-fast: 150ms;
  --duration-normal: 250ms;
  --duration-slow: 400ms;
}

.dark {
  /* Dark mode adjustments */
  --shadow-glow: 0 0 30px oklch(var(--primary) / 0.4);
  --shadow-soft: 0 4px 12px oklch(0% 0 0 / 0.3);
}
```

### Tailwind Extension

```js
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      boxShadow: {
        'glow': 'var(--shadow-glow)',
        'soft': 'var(--shadow-soft)',
        'hard': 'var(--shadow-hard)',
      },
      transitionTimingFunction: {
        'out-expo': 'var(--ease-out-expo)',
      },
      transitionDuration: {
        'fast': 'var(--duration-fast)',
        'normal': 'var(--duration-normal)',
        'slow': 'var(--duration-slow)',
      },
    },
  },
}
```

---

## When to Fork vs Wrap

### Wrap (Preferred)
- Adding styles or visual enhancements
- Changing default prop values
- Composing multiple components
- Adding project-specific props
- Restricting allowed props

### Fork (Last Resort)
- Fixing bugs in the library component
- Changing internal DOM structure
- Adding behavior the library doesn't support
- Major accessibility improvements not upstream

**If you fork, document why and plan to contribute upstream or update when the library fixes the issue.**

---

## Style Composition Hierarchy

When adding styles, follow this precedence (most to least preferred):

1. **Semantic tokens** — `bg-primary`, `text-muted-foreground`
2. **Extended tokens** — `shadow-glow`, `ease-out-expo`
3. **Utility classes** — `hover:scale-105`, `transition-all`
4. **Inline className** — One-off overrides
5. **Inline style** — Truly dynamic values only

```tsx
// Good: semantic tokens + extended tokens
<Button className="shadow-glow hover:shadow-xl transition-shadow duration-normal">

// Acceptable: utility classes for one-offs
<Button className="mt-4 w-full">

// Avoid: hardcoded values
<Button style={{ boxShadow: '0 0 20px rgba(0,0,0,0.3)' }}>
```

---

## Common Extension Patterns

### Enhanced Button with Depth

```tsx
const DepthButton = ({ children, ...props }) => (
  <Button 
    className="
      shadow-soft hover:shadow-hard 
      active:translate-y-px active:shadow-none
      transition-all duration-fast
    "
    {...props}
  >
    {children}
  </Button>
)
```

### Card with Hover Effect

```tsx
const InteractiveCard = ({ children, ...props }) => (
  <Card 
    className="
      transition-all duration-normal ease-out-expo
      hover:shadow-lg hover:-translate-y-1
      cursor-pointer
    "
    {...props}
  >
    {children}
  </Card>
)
```

### Input with Focus Glow

```tsx
const GlowInput = (props) => (
  <Input 
    className="
      focus:ring-2 focus:ring-primary/20 
      focus:shadow-glow
      transition-shadow duration-fast
    "
    {...props}
  />
)
```

---

## Anti-Patterns

### Don't: Duplicate library styles

```tsx
// BAD - copying shadcn button styles
const MyButton = styled.button`
  display: inline-flex;
  align-items: center;
  justify-content: center;
  /* ... all the button styles again ... */
`
```

### Don't: Override with !important

```tsx
// BAD - fighting the library
<Button className="!bg-blue-500 !hover:bg-blue-600">
```

### Don't: Create parallel components

```tsx
// BAD - separate component when wrapper would work
// components/CustomButton.tsx (doesn't use library Button at all)
```

### Don't: Modify library source files

```tsx
// BAD - editing node_modules or copied library files
// components/ui/button.tsx (shadcn source, modified)
```
