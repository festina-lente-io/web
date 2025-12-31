# Hugo Configuration Contract

**File**: `/hugo.toml` (or `config.toml`, `config.yaml`)
**Format**: TOML
**Required**: Yes (site-wide configuration)

## Schema Definition

```toml
# CORE CONFIGURATION (Required)

baseURL = "https://www.festina-lente.io/"
  # Full site URL with protocol
  # Must end with /
  # Used for: canonical URLs, sitemap, RSS

title = "Festina Lente"
  # Site title
  # Length: 1-100 characters
  # Used in: <title> tag, meta tags, navigation

theme = "hextra"
  # Theme name
  # Value: "hextra" (for this project)

languageCode = "en-us"
  # Language code (ISO 639-1)
  # Default: "en-us"

# OPTIONAL CONFIGURATION

enableRobotsTXT = true
  # Generate robots.txt file
  # Recommended: true

enableGitInfo = true
  # Use git commit date for lastmod
  # Requires: git repository

# PARAMETERS (Theme-specific)

[params]
  description = "Open source projects for developers"
    # Site description (50-160 chars for SEO)
  
  author = "Festina Lente"
    # Site author/organization
  
  # Add more Hextra theme parameters as needed

# NAVIGATION MENU

[params.navbar]
  [[params.navbar.menu]]
    name = "Home"
    url = "/"
    weight = 1
  
  [[params.navbar.menu]]
    name = "Projects"
    url = "/projects/"
    weight = 2

# FOOTER CONFIGURATION

[params.footer]
  copyright = "© 2025 Festina Lente"

# MARKDOWN RENDERING

[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true  # Allow raw HTML in markdown

# HUGO MODULES (Theme)

[module]
  [[module.imports]]
    path = "github.com/imfing/hextra"
```

## Complete Example

```toml
baseURL = "https://www.festina-lente.io/"
title = "Festina Lente"
theme = "hextra"
languageCode = "en-us"
enableRobotsTXT = true
enableGitInfo = true

[params]
  description = "Open source projects for developers"
  author = "Festina Lente"

[params.navbar]
  [[params.navbar.menu]]
    name = "Home"
    url = "/"
    weight = 1
    
  [[params.navbar.menu]]
    name = "Projects"
    url = "/projects/"
    weight = 2
    
  [[params.navbar.menu]]
    name = "GitHub"
    url = "https://github.com/festina-lente-io"
    weight = 100
    external = true

[params.footer]
  copyright = "© 2025 Festina Lente."

[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true

[module]
  [[module.imports]]
    path = "github.com/imfing/hextra"

[outputs]
  home = ["HTML", "RSS", "JSON"]
  page = ["HTML"]
  section = ["HTML", "RSS"]
```

## Validation Rules

### Required Fields

- `baseURL`: Must be valid HTTPS URL ending with `/`
- `title`: 1-100 characters, not empty
- `theme`: Must be "hextra" or valid Hugo theme
- `languageCode`: Valid ISO 639-1 language code

### Optional Fields

- `params.description`: 50-160 characters (SEO optimal)
- `params.navbar.menu`: Each item must have `name`, `url`, `weight`
- Navigation `url`: Valid path or URL
- Navigation `weight`: Positive integer (lower = first)

### Hextra-Specific Parameters

Refer to Hextra theme documentation for additional parameters:
- Color schemes
- Logo configuration
- Social links
- Search settings
- Dark mode toggle

## Environment-Specific Configuration

### Development (`hugo.development.toml`)

```toml
baseURL = "http://localhost:1313/"
enableRobotsTXT = false

[params]
  enableAnalytics = false
```

### Production (`hugo.production.toml`)

```toml
baseURL = "https://www.festina-lente.io/"
enableRobotsTXT = true

[params]
  enableAnalytics = true
  googleAnalyticsID = "G-XXXXXXXXXX"
```

## Usage

Hugo merges configuration files:
1. Base: `hugo.toml`
2. Environment: `hugo.{environment}.toml`

Build with environment:
```bash
hugo --environment production
```

## Migration Notes

When updating configuration:
1. Document changes in comments
2. Test locally: `hugo server`
3. Verify all pages render
4. Check navigation menu
5. Validate URLs
6. Commit with descriptive message

### Breaking Changes

If changing `baseURL` or theme:
1. Update all hardcoded URLs
2. Regenerate sitemap
3. Test all internal links
4. Update DNS (if domain changes)
5. Version bump (major)
