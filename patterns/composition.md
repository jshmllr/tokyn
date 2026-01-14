# Component Composition Principles

DRY (Don't Repeat Yourself) principles for building maintainable, consistent UI components. Use these patterns in Standalone Mode when not using an existing component library.

## The Composition Hierarchy

When building or extending components, follow this precedence (most to least preferred):

| Priority | Approach | When to Use |
|----------|----------|-------------|
| 1 | **Design tokens** | Always — single source of truth for values |
| 2 | **Base component** | One implementation, never duplicated |
| 3 | **Variant props** | Variations via props, not new components |
| 4 | **Composition slots** | children, render props for flexibility |
| 5 | **className overrides** | Last resort for one-offs |

---

## Design Tokens First

Never hardcode values. Always use tokens.

### Bad: Hardcoded Values

```tsx
// ❌ Values will drift, impossible to maintain
const Button = styled.button`
  padding: 12px 24px;
  background: #3b82f6;
  border-radius: 8px;
  font-size: 14px;
`;
```

### Good: Token-Based

```tsx
// ✅ Single source of truth, theme-aware
const Button = styled.button`
  padding: var(--space-3) var(--space-6);
  background: var(--color-primary);
  border-radius: var(--radius-md);
  font-size: var(--text-sm);
`;
```

### Token Categories

```
/tokens/
├── primitives.css    # Raw values: --space-4, --gray-500
└── semantic.css      # Meaningful: --color-bg-primary, --color-text-muted
```

Components should use **semantic tokens** whenever possible:

```css
/* Preferred: semantic */
background: var(--color-bg-secondary);

/* Acceptable: primitive (when semantic doesn't exist) */
gap: var(--space-2);

/* Never: hardcoded */
background: #f5f5f5;
```

---

## One Base Component

Every UI element should have exactly one base implementation.

### Bad: Multiple Button Implementations

```tsx
// ❌ Three different button implementations = drift
// components/PrimaryButton.tsx
const PrimaryButton = styled.button`...`;

// components/SecondaryButton.tsx  
const SecondaryButton = styled.button`...`;

// components/IconButton.tsx
const IconButton = styled.button`...`;
```

### Good: Single Base with Variants

```tsx
// ✅ One button, multiple variants
// components/Button.tsx
interface ButtonProps {
  variant?: 'primary' | 'secondary' | 'ghost';
  size?: 'sm' | 'md' | 'lg';
  children: React.ReactNode;
}

export const Button = ({ 
  variant = 'primary', 
  size = 'md',
  children,
  ...props 
}: ButtonProps) => {
  return (
    <button 
      className={cn(
        baseStyles,
        variantStyles[variant],
        sizeStyles[size]
      )}
      {...props}
    >
      {children}
    </button>
  );
};
```

---

## Variant Props Over New Components

Add variations through props, not by creating new components.

### When to Use Variant Props

- Visual differences (color, size, weight)
- State differences (loading, disabled, active)
- Layout differences (icon position, alignment)

### When to Create a New Component

- Different semantic purpose
- Reused 3+ times with same configuration
- Contains business logic, not just styling
- Different accessibility requirements

### Variant Implementation Pattern

```tsx
// Define variant styles as a map
const variants = {
  primary: 'bg-primary text-primary-foreground hover:bg-primary/90',
  secondary: 'bg-secondary text-secondary-foreground hover:bg-secondary/80',
  ghost: 'hover:bg-accent hover:text-accent-foreground',
  destructive: 'bg-destructive text-destructive-foreground hover:bg-destructive/90',
} as const;

const sizes = {
  sm: 'h-8 px-3 text-xs',
  md: 'h-10 px-4 text-sm',
  lg: 'h-12 px-6 text-base',
} as const;

// Component uses the maps
export const Button = ({ variant = 'primary', size = 'md', ...props }) => (
  <button className={cn(variants[variant], sizes[size])} {...props} />
);
```

---

## Composition Slots

Use children and render props for flexible composition.

### Children for Content

```tsx
// Flexible: accepts any content
<Card>
  <CardHeader>
    <CardTitle>Title</CardTitle>
  </CardHeader>
  <CardContent>
    {/* Any content */}
  </CardContent>
</Card>
```

### Render Props for Complex Cases

```tsx
// When you need access to internal state
<Dropdown
  trigger={({ open }) => (
    <Button aria-expanded={open}>
      Menu {open ? '▲' : '▼'}
    </Button>
  )}
>
  <DropdownItem>Option 1</DropdownItem>
  <DropdownItem>Option 2</DropdownItem>
</Dropdown>
```

### Slots Pattern

```tsx
interface CardProps {
  header?: React.ReactNode;
  footer?: React.ReactNode;
  children: React.ReactNode;
}

const Card = ({ header, footer, children }: CardProps) => (
  <div className="card">
    {header && <div className="card-header">{header}</div>}
    <div className="card-content">{children}</div>
    {footer && <div className="card-footer">{footer}</div>}
  </div>
);
```

---

## Wrap, Don't Duplicate

When you need a specialized version, wrap the base component.

### Bad: Copying Styles

```tsx
// ❌ Duplicates all button styles, will drift
const SubmitButton = styled.button`
  padding: 12px 24px;
  background: green;
  /* ... copying all base button styles ... */
`;
```

### Good: Wrapping

```tsx
// ✅ Uses base button, adds specialization
const SubmitButton = ({ children = 'Submit', ...props }) => (
  <Button type="submit" variant="primary" {...props}>
    {children}
  </Button>
);
```

### Wrapper Pattern for Defaults

```tsx
// Lock in specific configuration
export const IconButton = ({ label, icon, ...props }) => (
  <Button 
    size="icon" 
    variant="ghost"
    aria-label={label}
    {...props}
  >
    {icon}
  </Button>
);

// Lock in styling
export const PillButton = (props) => (
  <Button 
    className="rounded-full"
    {...props}
  />
);
```

---

## className Overrides (Last Resort)

For true one-offs, use className. But ask yourself: should this be a variant?

### Acceptable: True One-Off

```tsx
// Specific layout need in one place
<Button className="mt-4 w-full">
  Continue
</Button>
```

### Suspicious: Repeated Override

```tsx
// ❌ If you're doing this often, make a variant
<Button className="rounded-full px-6">...</Button>
<Button className="rounded-full px-6">...</Button>
<Button className="rounded-full px-6">...</Button>

// ✅ Better: add variant="pill" to Button
```

### Never: Style Override

```tsx
// ❌ Never override core styles this way
<Button className="!bg-red-500 !hover:bg-red-600">
```

---

## Component Organization

### File Structure

```
components/
├── ui/                    # Base components
│   ├── button.tsx
│   ├── input.tsx
│   ├── card.tsx
│   └── index.ts          # Re-exports
│
├── composed/              # Composed/specialized components
│   ├── submit-button.tsx  # Wraps Button
│   ├── search-input.tsx   # Wraps Input
│   └── feature-card.tsx   # Composes Card parts
│
└── patterns/              # Complex patterns
    ├── form-field.tsx     # Label + Input + Error
    └── data-table.tsx     # Table + Sorting + Pagination
```

### Export Strategy

```tsx
// components/ui/index.ts
export { Button } from './button';
export { Input } from './input';
export { Card, CardHeader, CardContent, CardFooter } from './card';

// Usage
import { Button, Input, Card } from '@/components/ui';
```

---

## Anti-Patterns to Avoid

### Don't: Create Component Per Color

```tsx
// ❌ This doesn't scale
const BlueButton = () => <button style={{background: 'blue'}} />;
const GreenButton = () => <button style={{background: 'green'}} />;
const RedButton = () => <button style={{background: 'red'}} />;

// ✅ Use variant prop
<Button variant="primary" />  // blue
<Button variant="success" />  // green
<Button variant="destructive" />  // red
```

### Don't: Prop Explosion

```tsx
// ❌ Too many boolean props
<Button 
  isPrimary 
  isLarge 
  isRounded 
  hasIcon 
  isLoading
/>

// ✅ Grouped, meaningful props
<Button 
  variant="primary" 
  size="lg" 
  loading
>
  <Icon /> Label
</Button>
```

### Don't: Deep Component Hierarchy

```tsx
// ❌ Unnecessary nesting
<ButtonWrapper>
  <ButtonContainer>
    <ButtonInner>
      <ButtonText>Click</ButtonText>
    </ButtonInner>
  </ButtonContainer>
</ButtonWrapper>

// ✅ Flat structure
<Button>Click</Button>
```

---

## Checklist

Before creating a new component, ask:

- [ ] Does a base component already exist that I should extend?
- [ ] Can this be a variant prop on an existing component?
- [ ] Am I duplicating styles from another component?
- [ ] Are all values coming from tokens?
- [ ] Is this truly reusable, or a one-off?
- [ ] Does this need to be a component, or just a className?
