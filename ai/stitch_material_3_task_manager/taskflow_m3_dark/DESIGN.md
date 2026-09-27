---
name: TaskFlow M3 Dark
colors:
  surface: '#121318'
  surface-dim: '#121318'
  surface-bright: '#38393e'
  surface-container-lowest: '#0d0e13'
  surface-container-low: '#1a1b20'
  surface-container: '#1e1f25'
  surface-container-high: '#292a2f'
  surface-container-highest: '#34343a'
  on-surface: '#e3e1e9'
  on-surface-variant: '#c6c5d0'
  inverse-surface: '#e3e1e9'
  inverse-on-surface: '#2f3036'
  outline: '#90909a'
  outline-variant: '#45464f'
  surface-tint: '#b8c4ff'
  primary: '#dde1ff'
  on-primary: '#202d5e'
  primary-container: '#b8c4ff'
  on-primary-container: '#445083'
  inverse-primary: '#4f5c90'
  secondary: '#bac3ff'
  on-secondary: '#08218a'
  secondary-container: '#2c3ea3'
  on-secondary-container: '#a8b4ff'
  tertiary: '#d5e4ff'
  on-tertiary: '#00315f'
  tertiary-container: '#a7c9ff'
  on-tertiary-container: '#2f5484'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#dde1ff'
  primary-fixed-dim: '#b8c4ff'
  on-primary-fixed: '#081748'
  on-primary-fixed-variant: '#384476'
  secondary-fixed: '#dee0ff'
  secondary-fixed-dim: '#bac3ff'
  on-secondary-fixed: '#00105c'
  on-secondary-fixed-variant: '#293ca0'
  tertiary-fixed: '#d4e3ff'
  tertiary-fixed-dim: '#a5c8ff'
  on-tertiary-fixed: '#001c3a'
  on-tertiary-fixed-variant: '#214877'
  background: '#121318'
  on-background: '#e3e1e9'
  surface-variant: '#34343a'
typography:
  display-lg:
    fontFamily: Roboto Flex
    fontSize: 57px
    fontWeight: '400'
    lineHeight: 64px
    letterSpacing: -0.25px
  headline-lg:
    fontFamily: Roboto Flex
    fontSize: 32px
    fontWeight: '500'
    lineHeight: 40px
  headline-lg-mobile:
    fontFamily: Roboto Flex
    fontSize: 28px
    fontWeight: '500'
    lineHeight: 36px
  headline-md:
    fontFamily: Roboto Flex
    fontSize: 28px
    fontWeight: '500'
    lineHeight: 36px
  headline-sm:
    fontFamily: Roboto Flex
    fontSize: 24px
    fontWeight: '500'
    lineHeight: 32px
  title-lg:
    fontFamily: Roboto Flex
    fontSize: 22px
    fontWeight: '500'
    lineHeight: 28px
  title-md:
    fontFamily: Roboto Flex
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 24px
    letterSpacing: 0.15px
  title-sm:
    fontFamily: Roboto Flex
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 20px
    letterSpacing: 0.1px
  body-lg:
    fontFamily: Roboto Flex
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
    letterSpacing: 0.5px
  body-md:
    fontFamily: Roboto Flex
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
    letterSpacing: 0.25px
  body-sm:
    fontFamily: Roboto Flex
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
    letterSpacing: 0.4px
  label-lg:
    fontFamily: Roboto Flex
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 20px
    letterSpacing: 0.1px
  label-md:
    fontFamily: Roboto Flex
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.5px
  label-sm:
    fontFamily: Roboto Flex
    fontSize: 11px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.5px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-tablet: 1.5rem
  gutter-desktop: 1.5rem
  margin: 1rem
  margin-tablet: 1.5rem
  margin-desktop: 2rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

This design system establishes a high-performance, focused dark interface for modern task management. Rooted in Material 3's tonal surface hierarchy, it reduces visual fatigue while maximizing legibility during high-cognition productivity workflows.

The visual ethos blends precision software utility with purposeful depth. Surfaces are not flat black voids; they are carefully layered slate-tinted planes that reflect structural hierarchy. The emotional tone is calm, capable, and distraction-free, using vibrant indigo-blue accents purely for intent, focus, and state progression.

## Colors

The palette leverages Material 3 tonal elevation dynamics specifically tuned for dark mode readability:

- **Primary (`#b8c4ff`)**: Soft luminous indigo used for key actions, active tab indicators, and selection states against dark surfaces.
- **On-Primary / Dark Blue (`#4355b9`)**: High-contrast anchor backing primary tonal components or interactive hover states.
- **Surface Scale**:
  - `surface`: `#121318` (Canvas and root background)
  - `surface-container-low`: `#1a1b21` (List groups and grouping sections)
  - `surface-container`: `#1e1f25` (Standard cards, list rows, bottom sheets)
  - `surface-container-high`: `#282a32` (Elevated modals, tooltips, dialogs, quick-task overlays)
- **Typography & Content**:
  - `on-surface`: `#e2e2ec` (High-emphasis text, primary task titles)
  - `on-surface-variant`: `#c6c6d0` (Medium-emphasis text, metadata, dates, subtasks)
  - `outline`: `#44464f` (Ghost borders and structural dividers)
  - `outline-variant`: `#2b2d35` (Subtle separator lines)

## Typography

The type system is powered entirely by Roboto Flex, providing parametric versatility and strict mechanical legibility across varied pixel densities. 

All primary task titles deploy `title-md` or `body-lg` to retain high density and effortless scanning. Subtext, task tags, and timestamp indicators map to `body-sm` and `label-md` in `on-surface-variant` (`#c6c6d0`). Ensure headings above 24px use slightly tightened tracking to keep titles cohesive against high-contrast dark backdrops.

## Layout & Spacing

Layouts follow a fluid, responsive Material grid:
- **Mobile (<600px)**: 4 columns, 16px margins, 16px gutters.
- **Tablet (600px–1024px)**: 8 columns, 24px margins, 24px gutters.
- **Desktop (>1024px)**: 12 columns with a maximum centered container width of 1440px, flanked by 32px safe margins.

Spacing follows an explicit 8pt baseline scale, with a 4pt sub-scale (`space-xs`) reserved for tight internal component layouts such as badge padding, icon-to-label gaps, and inline tag offsets.

## Elevation & Depth

Visual depth is achieved through **Tonal Elevation** combined with ambient, tinted shadow drops rather than pure opacity shadows. In dark mode, lighter surfaces imply closer proximity to the viewer:

- **Level 0 (Base)**: `#121318` — Canvas, full-screen views. No shadow.
- **Level 1 (Resting Cards, Task Items)**: `#1e1f25` — Outlined by `#2b2d35` (1px) or shaded with `0px 1px 3px rgba(0, 0, 0, 0.4)`.
- **Level 2 (Navigation Bar, Docked Sheets)**: `#1a1b21` to `#1e1f25` — Tinted floor layers, top border of `#2b2d35` (1px), `0px 2px 6px rgba(0, 0, 0, 0.5)`.
- **Level 3 (Floating Action Button, Modals, Menus)**: `#282a32` — Elevated interactive controls, `0px 4px 12px rgba(0, 0, 0, 0.6)`.
- **Focus & Interaction**: Hovered and pressed states transition to a +4% primary-tinted overlay rather than white spreads, preserving the deep blue-slate ambience.

## Shapes

The design uses standard Material 3 rounded geometry (Scale 2):
- **Base Components (Inputs, Buttons, Cards)**: 8px (`0.5rem`) corner radius.
- **Containers & Surfaces (Cards, Task Groups)**: 12px to 16px (`1rem`).
- **Sheets, Dialogs & Navigation Bar Active Indicators**: 24px (`1.5rem`) to fully pill-shaped (9999px) for chips, FABs, and selection capsules.

## Components

### Buttons & Floating Action Button (FAB)
- **Primary Filled Button**: Container `#b8c4ff`, text and icon `#002a78`, height 40px, corner radius 20px (pill).
- **Tonal Button**: Container `#282a32`, text `#b8c4ff`, border none.
- **FAB**: Standard M3 56x56px container, background `#4355b9`, icon `#ffffff`, corner radius 16px.

### Inputs & Search
- **Text Fields**: Filled variant with background `#1e1f25`, bottom indicator `#44464f` resting, animating to 2px `#b8c4ff` on focus.
- **Text Color**: Input value `#e2e2ec`, placeholder `#c6c6d0`.
- **Corner Radius**: Top-left and top-right 8px, flat bottom.

### Lists & Cards
- **Task Card**: Background `#1e1f25`, 1px border `#2b2d35`, border radius 12px, padding 16px (`space-md`). Completed tasks reduce opacity to 60% with strikethrough typography on `title-md`.
- **Drag & Reorder Cue**: Low-contrast vertical drag handle in `#44464f` revealed on hover or long-press.

### Selection Controls
- **Checkboxes**: Unchecked stroke 2px `#c6c6d0`, checked state fills with `#b8c4ff` displaying a `#002a78` checkmark. 4px rounded corners.
- **Chips**: Filter and priority chips use background `#1a1b21`, border 1px `#44464f`, text `#c6c6d0`. Selected chips fill with `#282a32`, border color `#b8c4ff`, text `#b8c4ff`.

### Navigation Bar
- **M3 Bottom Navigation Bar**: Background `#121318` with subtle top hairline `#2b2d35`. Height 80px.
- **Active Tab Pill**: Horizontal pill (64x32px) in `#282a32` with `#b8c4ff` active icon and label.
- **Inactive Tab**: Icon and label `#c6c6d0`.