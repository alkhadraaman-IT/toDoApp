---
name: Tonal Task Engine
colors:
  surface: '#fbf8ff'
  surface-dim: '#dad9e6'
  surface-bright: '#fbf8ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f4f2ff'
  surface-container: '#eeecfa'
  surface-container-high: '#e8e7f4'
  surface-container-highest: '#e3e1ee'
  on-surface: '#1a1b24'
  on-surface-variant: '#454652'
  inverse-surface: '#2f3039'
  inverse-on-surface: '#f1effd'
  outline: '#757684'
  outline-variant: '#c5c5d4'
  surface-tint: '#4355b9'
  primary: '#293ca0'
  on-primary: '#ffffff'
  primary-container: '#4355b9'
  on-primary-container: '#d1d6ff'
  inverse-primary: '#bac3ff'
  secondary: '#016874'
  on-secondary: '#ffffff'
  secondary-container: '#9fecfa'
  on-secondary-container: '#0d6d79'
  tertiary: '#643f00'
  on-tertiary: '#ffffff'
  tertiary-container: '#845400'
  on-tertiary-container: '#ffd198'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dee0ff'
  primary-fixed-dim: '#bac3ff'
  on-primary-fixed: '#00105c'
  on-primary-fixed-variant: '#293ca0'
  secondary-fixed: '#a2effd'
  secondary-fixed-dim: '#85d2e0'
  on-secondary-fixed: '#001f24'
  on-secondary-fixed-variant: '#004f58'
  tertiary-fixed: '#ffddb6'
  tertiary-fixed-dim: '#fbba65'
  on-tertiary-fixed: '#2a1800'
  on-tertiary-fixed-variant: '#643f00'
  background: '#fbf8ff'
  on-background: '#1a1b24'
  surface-variant: '#e3e1ee'
typography:
  display-lg:
    fontFamily: Roboto Flex
    fontSize: 57px
    fontWeight: '400'
    lineHeight: 64px
    letterSpacing: -0.25px
  display-md:
    fontFamily: Roboto Flex
    fontSize: 45px
    fontWeight: '400'
    lineHeight: 52px
  headline-lg:
    fontFamily: Roboto Flex
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
  headline-lg-mobile:
    fontFamily: Roboto Flex
    fontSize: 28px
    fontWeight: '600'
    lineHeight: 36px
  headline-md:
    fontFamily: Roboto Flex
    fontSize: 28px
    fontWeight: '600'
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
    fontWeight: '600'
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
  gutter-mobile: 0.75rem
  gutter-desktop: 1.5rem
  margin: 1rem
  margin-mobile: 1rem
  margin-tablet: 1.5rem
  margin-desktop: 2rem
  space-xxs: 0.125rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
  space-xxl: 3rem
---

## Brand & Style

This design system expresses a purposeful, adaptive productivity workspace driven by Material 3 principles. The personality balances institutional precision with ambient warmth: focused, fluid, rhythmically structured, and reactive to user context. It targets individuals and collaborative professionals navigating dense personal roadmaps, daily sprints, and cognitive overload who require rapid clarity without visual noise.

The style unifies **Corporate / Modern Material Design 3** aesthetics with native Flutter touch paradigms:
- Dynamic tonal surfaces instead of harsh elevation drops.
- Fluid ergonomics featuring bottom-anchored actions, tactile touch targets, and rhythmic micro-feedback.
- Expressive state changes where interaction clarity is signaled through color shifts, state opacity overlays, and spatial shape morphing.

## Colors

The color system strictly enforces Material 3 dynamic color generation and tonal hierarchies, eliminating absolute blacks and stark gray neutrals in favor of indigo- and slate-tinted surfaces.

### Tonal Surface Hierarchy (Light Mode Default)
- **Primary Roles**:
  - `primary`: `#4355B9` (Deep royal indigo for primary actions, floating buttons, active chips)
  - `on-primary`: `#FFFFFF`
  - `primary-container`: `#DEE0FF` (Tonal priority cards, highlighted task segments)
  - `on-primary-container`: `#00105C`
- **Secondary Roles**:
  - `secondary`: `#006874` (Crisp dynamic teal for filtering, navigation rails, and project categories)
  - `on-secondary`: `#FFFFFF`
  - `secondary-container`: `#9EEFFD`
  - `on-secondary-container`: `#001F24`
- **Tertiary Roles**:
  - `tertiary`: `#845400` (Energizing amber/ochre for due-date proximity, urgent alerts, and stars)
  - `on-tertiary`: `#FFFFFF`
  - `tertiary-container`: `#FFDDB5`
  - `on-tertiary-container`: `#2A1800`
- **Surface & Container Layers**:
  - `surface`: `#FDFBFF` (Base background canvas)
  - `surface-dim`: `#DAD9E0`
  - `surface-bright`: `#FDFBFF`
  - `surface-container-lowest`: `#FFFFFF` (Card surfaces resting on grouped lists)
  - `surface-container-low`: `#F3F3FA` (Section backings, grouped project sections)
  - `surface-container`: `#EBEBFA` (Standard task item cards, app bars when pinned)
  - `surface-container-high`: `#E5E4F0` (Overlaid panels, modal sheets)
  - `surface-container-highest`: `#E0DFEB` (Form inputs, search fields)
  - `surface-variant`: `#E2E1EC` (Divider rules, subtle segment borders)
  - `on-surface`: `#1B1B21` (High-contrast primary typography)
  - `on-surface-variant`: `#45464F` (Secondary subtasks, timestamps, metadata labels)
- **Outline & States**:
  - `outline`: `#757680` (Unselected check borders, search bar borders)
  - `outline-variant`: `#C6C5D0` (Subtask dividers, inactive tracks)
  - `error`: `#BA1A1A`
  - `on-error`: `#FFFFFF`
  - `error-container`: `#FFDAD6`
  - `on-error-container`: `#410002`

### State Overlays
All interactive states apply an `on-color` fill layer at controlled opacities:
- `hover`: 8% opacity
- `focus`: 12% opacity
- `press`: 12% opacity
- `drag`: 16% opacity

## Typography

The typographic system utilizes `Roboto Flex` to replicate Google's canonical Material 3 mechanical precision with adaptive optical weights.

### Application Hierarchy
- **Task Titles (Default)**: Use `title-md` with `on-surface` color. Completed tasks strike through with `line-through` and transition to `outline`.
- **Primary Section Headers**: Use `headline-sm` or `title-lg` to separate sprint lists, deadlines, and project folders.
- **Body & Subtasks**: Use `body-md` for descriptions and `body-sm` for secondary nested notes.
- **Micro-Data & Badges**: Use `label-sm` for date indicators, project pills, and keyboard shortcut indicators.
- **Numerical Stats**: Large metrics (e.g., "12 Done") in dashboard views consume `display-md` or `headline-lg` rendered in medium weights.

## Layout & Spacing

This system implements the Material 3 fluid adaptive grid tailored for mobile-first Flutter execution that scales through foldables, tablets, and desktop workstations.

### Breakpoints & Adaptive Framing
- **Compact (0 – 599px)**:
  - 4-column layout. Margin: `1rem` (`16px`). Gutter: `0.75rem` (`12px`).
  - Navigation anchored to a dynamic Bottom Navigation Bar or Navigation Suite.
  - Floating Action Button (FAB) pinned bottom-right at `16px` margin offsets above navigation chrome.
- **Medium (600 – 839px)**:
  - 8-column layout. Margin: `1.5rem` (`24px`). Gutter: `1rem` (`16px`).
  - Navigation morphs to a compact left Navigation Rail (56–72px width).
  - Two-pane list/detail view initiates.
- **Expanded (840px+)**:
  - 12-column layout max-width bounded to `1280px` centered. Margin: `2rem` (`32px`). Gutter: `1.5rem` (`24px`).
  - Navigation expands to a full permanent Navigation Drawer.

### Density & Touch Targets
All actionable elements adhere strictly to the 48x48dp minimum hit target rule, regardless of the internal visual boundary size (e.g., a 20dp checkbox maintains a 48dp touch footprint via 14dp invisible touch expansion).

## Elevation & Depth

Rather than relying on heavy skeuomorphic cast shadows, depth is communicated through **Tonal Surface Tinting** combined with soft, directional ambient shadows. As an element moves up the z-axis, its background color transitions from `surface` to `surface-container-high` alongside a calibrated diffuse shadow.

### Elevation Levels
- **Level 0 (Flat / Basal)**:
  - Fill: `surface`. Shadow: None. Border: `outline-variant` 1px border.
  - Used for static grouped containers and full-canvas lists.
- **Level 1 (Card / Resting Standard)**:
  - Fill: `surface-container-low` (`#F3F3FA`).
  - Shadow: `0px 1px 3px 1px rgba(27, 27, 33, 0.08), 0px 1px 2px 0px rgba(27, 27, 33, 0.12)`.
  - Used for standard individual task items and filter bars.
- **Level 2 (Hover / Active Cards)**:
  - Fill: `surface-container` (`#EBEBFA`).
  - Shadow: `0px 2px 6px 2px rgba(27, 27, 33, 0.08), 0px 1px 4px 0px rgba(27, 27, 33, 0.14)`.
  - Used for hovered task rows, active filter chips.
- **Level 3 (Floating Components / FAB)**:
  - Fill: `primary-container` (`#DEE0FF`) or `surface-container-high`.
  - Shadow: `0px 4px 8px 3px rgba(27, 27, 33, 0.10), 0px 1px 3px 0px rgba(27, 27, 33, 0.16)`.
  - Used for Floating Action Buttons, dynamic drag-and-drop task previews.
- **Level 4 (Modal Sheets / Drawers)**:
  - Fill: `surface-container-high` (`#E5E4F0`).
  - Shadow: `0px 6px 10px 4px rgba(27, 27, 33, 0.12), 0px 2px 3px 0px rgba(27, 27, 33, 0.18)`.
  - Used for bottom creation sheets and sliding contextual inspectors.
- **Level 5 (Dialogs / Snackbars)**:
  - Fill: `surface-container-highest` (`#E0DFEB`).
  - Shadow: `0px 8px 12px 6px rgba(27, 27, 33, 0.12), 0px 4px 4px 0px rgba(27, 27, 33, 0.20)`.

## Shapes

The shape system rigorously maps Material 3 geometric curvature tokens to specific functional roles:

- **Extra Small (`4px` / `0.25rem`)**: Inline category indicators, progress bar capsules, snackbar action button corners.
- **Small (`8px` / `0.5rem`)**: Filter and input chips, text fields, menu item selections, checkboxes (`rounded-[4px]`).
- **Medium (`12px` / `0.75rem`)**: Subtask groups, contextual tooltips, action badges.
- **Large (`16px` / `1rem`)**: Standard Task Cards, standard Floating Action Button (FAB).
- **Extra Large (`24px` / `1.5rem`)**: Large FABs, segment containers, dashboard priority widgets.
- **Full / Pill (`9999px`)**: Status pills, circular avatar anchors, drag handles (`rounded-full`), active pill indicators on Navigation Bars.
- **Asymmetric Curves**: Bottom Sheet dialogs employ top-only radii (`rounded-t-[28px]`, bottom corners `0px`) to anchor directly to mobile hardware bezels.

## Components

### Buttons & Floating Action Buttons (FAB)
- **Filled Button**: Primary CTA. Background `primary`, text `on-primary`. Height 40dp, horizontal padding 24dp, corner radius 20dp (pill). On press, state overlay 12% `on-primary`.
- **Tonal Button**: Secondary importance. Background `secondary-container`, text `on-secondary-container`. Radius 20dp.
- **Outlined Button**: Height 40dp, border 1dp `outline`, text `primary`. Radius 20dp.
- **Large FAB (M3 Style)**: Size 56x56dp (standard) or 96x96dp (extended home FAB). Surface `primary-container`, icon `on-primary-container` (24dp or 36dp). Corner radius 16dp (standard) or 28dp (large). Elevation Level 3.

### Task Cards & List Items
- **Card Container**: Base fill `surface-container-low`, radius 16dp (`rounded-2xl`). Border: 1dp solid `surface-variant`.
- **Layout**: Left-to-right alignment:
  1. 48dp hit-target leading control (Checkbox).
  2. Vertical flex stack: Task Title (`title-md`), optional body excerpt (`body-sm`), metadata row (due date badge, subtask progress, project tag).
  3. Trailing reorder drag affordance or urgency pin.
- **Dismissible Swipe Indicator**:
  - Left-to-right swipe: Surface reveals `secondary-container` with `on-secondary-container` checkmark icon (Mark Completed).
  - Right-to-left swipe: Surface reveals `error-container` with `on-error-container` trash icon (Delete). Smooth physics dampening with haptic tick trigger.

### Checkboxes
- **Unchecked**: 18x18dp square with 4dp corner radius. 2dp border `outline`. Background transparent.
- **Checked**: Fill transitions via spring animation to `primary`. Border turns `primary`. Inner check vector rendered in `on-primary`.
- **Hit Target**: Enclosed in centered 48x48dp interactive bounding area.

### Chips (Filter, Input, Suggestion)
- **Height**: 32dp.
- **Radius**: 8dp (`rounded-lg`).
- **Inactive**: Fill `surface-container-low`, border 1dp `outline-variant`, text `on-surface-variant` (`label-md`).
- **Active / Selected**: Fill `secondary-container`, border 0dp, text `on-secondary-container`. Optional leading checkmark icon (18dp).

### Subtask Progress Bar
- **Track**: Height 4dp, fill `surface-variant`, rounded `9999px`.
- **Indicator**: Fill `primary` (or `tertiary` if overdue), rounded `9999px`. Dynamic spring tween across value mutations.

### Text Inputs (Task Creation / Search)
- **Filled Text Field**: Height 56dp. Background `surface-container-highest`, bottom active indicator border 2dp `primary` (unfocused 1dp `outline`). Radius `8px 8px 0 0`.
- **Outlined Search Bar (Docked or Pinned)**: Height 56dp. Background `surface-container-high`. Radius 28dp (pill). Leading search glyph `on-surface-variant`, trailing user avatar or voice filter. Zero exterior border, subtle elevation level 1.

### Bottom Sheet (Task Creation Drawer)
- **Container**: Background `surface-container-high`, top corners rounded 28dp (`rounded-t-[28px]`).
- **Drag Handle**: Width 32dp, height 4dp, fill `outline-variant`, margin-top 16dp, rounded full.
- **Content**: Autofocused title input field, horizontal scroll chip carousel (Project, Due Date, Priority, Reminder), and trailing FAB-style submission pill.