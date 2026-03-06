# jira-da-theme

Shared design system for all **JIRA-DA** projects. Based on the [Catppuccin Mocha](https://catppuccin.com/) palette with dark/light theme support.

## Files

| File | What it contains |
|---|---|
| `tokens.css` | Color palette, semantic variables, glass/window effects, layout, KPI & tech-brand colors |
| `typography.css` | Local `@font-face` for Inter (Regular/SemiBold/Bold), heading scale, text utilities |
| `base.css` | CSS reset, scrollbar, link styles, autofill overrides, shared animations |
| `components.css` | Buttons, badges, cards, glass cards, data tables, status dots, section headers |
| `vendor/fonts/` | Inter woff2 files — **fully offline, no CDN** |
| `vendor/phosphor/` | Phosphor Icons woff2 + CSS — **fully offline** |
| `vendor/htmx.min.js` | HTMX library — shared across all Go/HTMX projects |

## Usage

Add as a git submodule to any project:

```bash
git submodule add https://github.com/gnemet/jira-da-theme.git ui/vendor/theme
```

Then import in your project's CSS:

```css
@import url('/ui/vendor/theme/tokens.css');
@import url('/ui/vendor/theme/typography.css');
@import url('/ui/vendor/theme/base.css');
@import url('/ui/vendor/theme/components.css');

/* Project-specific accent override */
:root {
    --accent-color: #f59e0b;  /* e.g. forge orange */
}
```

Or include in HTML:

```html
<link rel="stylesheet" href="/ui/vendor/theme/tokens.css">
<link rel="stylesheet" href="/ui/vendor/theme/typography.css">
<link rel="stylesheet" href="/ui/vendor/theme/base.css">
<link rel="stylesheet" href="/ui/vendor/theme/components.css">
```

## Icons

All projects use [Phosphor Icons](https://phosphoricons.com/) — include their CSS/JS separately (not bundled here to avoid duplication).

## Per-Project Overrides

Each project should set its own accent color after importing tokens:

| Project | Accent |
|---|---|
| **johanna** | `--accent-color: #f5c2e7` (pink) |
| **mcp-forge** | `--accent-color: #f59e0b` (forge orange) |
| **jiramntr** | `--accent-color: #C42728` (Generali red) |
| **opsconsole** | `--accent-color: #C42728` (Generali red) |
