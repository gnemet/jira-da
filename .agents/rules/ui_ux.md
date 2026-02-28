# UI/UX Rules (Shared)

## Design Philosophy
- **Premium & Elegant**: Clean, high-end interface with generous spacing and professional typography.
- **Harmony**: Use curated, harmonious color palettes (e.g., Slate/Indigo, Catppuccin Mocha).
- **Theme Support**: Native Dark and Light modes on all components with seamless synchronization.
- **Glassmorphism**: Use frosted-glass effects (blur, transparency) for a modern, fluid feel.

## Typography & Icons
- **System Font Stack**: Prioritize performance with system fonts (offline-first).
- **Visual Hierarchy**: Use opacity and weight to distinguish active/inactive states and primary/secondary information.
- **Icon Libraries**: FontAwesome (`fas`, `fab`) or Phosphor (`ph-*`) — choose per project and stick to one.

## Interactions & UX
- **HTMX**: Dynamic updates via AJAX for fragments and partial page loads.
- **Responsive**: Mobile-first CSS optimizations.
- **Keyboard**: ALWAYS handle Escape to close/cancel and Enter to submit/confirm.
- **Auto-hide**: Floating sidebars/panels MUST automatically close on outside click.

## Clean Code (UI)
- **NO HARDCODED COLORS**: **NEVER** use hex codes or RGB values in CSS/HTML. ALWAYS use theme variables (e.g., `var(--accent-color)`).
- **NO HARDCODED STRINGS**: Use i18n system or catalog-driven labels where applicable.
- **Separation of Concerns**: Keep structure (HTML), style (CSS), and logic (JS) separated.
- **NO INLINE LOGIC**: No `onclick`, `onchange`, or `style` attributes in HTML.

## Diagrams & Architecture
- **Mermaid Hand-Drawn Style**: All Mermaid diagrams MUST use `look: handDrawn` for a sketchy, whiteboard-style aesthetic.
- **Dark Theme**: Mermaid diagrams MUST use `theme: dark` to match the application's default theme.
