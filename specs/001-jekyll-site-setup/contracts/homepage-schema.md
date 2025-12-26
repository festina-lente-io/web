# Homepage (index.md) Schema
# Front matter and content contract for homepage using splash layout
# Location: index.md (repository root)

# ============================================================================
# FRONT MATTER SCHEMA
# ============================================================================
---
layout: splash
  # Type: String (required)
  # Description: Minimal Mistakes layout to use
  # Validation: Must be "splash" for homepage (FR-003)
  # Purpose: Splash layout provides full-width hero and feature rows

title: "Festina Lente - Project Portfolio"
  # Type: String (required)
  # Description: Page title for browser tab and SEO
  # Validation: 1-100 characters
  # Note: May not be displayed on page with splash layout

permalink: /
  # Type: String (required)
  # Description: URL path for this page
  # Validation: Must be "/" for homepage
  # Purpose: Makes this the root page of the site

excerpt: "Open-source software development projects and tools"
  # Type: String (optional but recommended)
  # Description: Page description for SEO meta tags
  # Validation: 150-300 characters
  # Purpose: Used in search results and social sharing

header:
  # Type: Object (required for splash layout)
  # Description: Hero header configuration
  
  overlay_color: "#000"
    # Type: String (optional)
    # Description: Background color for header (if no image)
    # Validation: Hex color code or CSS color name
    # Example: "#000", "#333", "rgba(0,0,0,0.8)"
  
  overlay_filter: "0.5"
    # Type: String or Number (optional)
    # Description: Opacity of overlay on header image
    # Validation: 0.0 (transparent) to 1.0 (opaque)
    # Purpose: Darken image to make text readable
  
  overlay_image: /assets/images/header-bg.jpg
    # Type: String (optional)
    # Description: Path to header background image
    # Validation: Relative path or URL
    # Recommendation: 1920x1080px, optimized for web
    # Note: Can omit if using overlay_color only
  
  actions:
    # Type: Array (optional)
    # Description: Call-to-action buttons in header
    - label: "View Projects"
      url: "#projects"
        # Internal anchor link to projects section
    - label: "GitHub"
      url: "https://github.com/festina-lente-io"
        # External link to GitHub organization

intro:
  # Type: Array (optional)
  # Description: Intro section(s) after header, before feature rows
  # Purpose: Provide context about the site/organization
  - excerpt: |
      Festina Lente develops open-source tools and standards for software 
      development teams. Our projects focus on developer productivity, code 
      quality, and automation.

feature_row:
  # Type: Array (required)
  # Description: Feature rows for displaying projects
  # Requirement: FR-003 mandates feature rows for project display
  # Note: This should be dynamically generated from _projects collection
  
  - image_path: /assets/images/devtoys-teaser.jpg
    # Type: String (optional)
    # Description: Thumbnail image for project
    # Validation: Relative path or URL
    # Recommendation: 400x300px, optimized for web
    # Note: Can omit for text-only feature rows
    
    alt: "DevToys MCP Server logo"
    # Type: String (required if image_path specified)
    # Description: Alt text for image (accessibility)
    # Validation: Descriptive text, 1-100 characters
    
    title: "DevToys MCP Server"
    # Type: String (required)
    # Description: Project name/title
    # Source: Should match title from _projects/devtoys-mcp.md
    
    excerpt: "Model Context Protocol server providing development utility tools for encoding, decoding, formatting, and text manipulation."
    # Type: String (required)
    # Description: Project description
    # Source: Should match description from _projects/devtoys-mcp.md
    # Validation: 50-150 words
    
    url: /projects/devtoys-mcp/
    # Type: String (required)
    # Description: Link to project quickstart page
    # Validation: Must match project permalink
    
    btn_label: "Learn More"
    # Type: String (optional)
    # Description: Button text
    # Default: "Read More"
    # Validation: 1-20 characters
    
    btn_class: "btn--primary"
    # Type: String (optional)
    # Description: CSS class for button styling
    # Options: btn--primary, btn--secondary, btn--success, btn--warning, btn--danger, btn--info
    # Default: btn--primary

  - image_path: /assets/images/code-standards-teaser.jpg
    alt: "Code Standards Guide icon"
    title: "Code Standards Guide"
    excerpt: "Comprehensive code quality standards and best practices for modern software development teams."
    url: /projects/code-standards/
    btn_label: "Learn More"
    btn_class: "btn--primary"

  # Add more projects by appending to this array
  # Each project should follow the same structure

classes:
  # Type: String or Array (optional)
  # Description: CSS classes to apply to page
  # Example: "wide" for full-width layout

---

# ============================================================================
# CONTENT BODY (Markdown)
# ============================================================================
# Content after front matter (optional for splash layout)
# Usually minimal since splash layout relies on header and feature_row

## Projects {#projects}

<!-- Anchor for "View Projects" button -->
<!-- Content here appears before feature rows -->

Explore our open-source projects below:

<!-- Feature rows automatically rendered here by Jekyll -->

---

## About Festina Lente

<!-- Optional: Additional content after feature rows -->
<!-- Can include mission statement, contact info, etc. -->

Festina Lente is dedicated to building high-quality open-source tools for developers.
All our projects are available on [GitHub](https://github.com/festina-lente-io).

# ============================================================================
# DYNAMIC PROJECT LOADING (Implementation Note)
# ============================================================================
# Instead of hardcoding feature_row in front matter, consider Liquid template:

{% assign projects = site.projects | sort: 'order' %}
<div class="feature__wrapper">
  {% for project in projects %}
    <div class="feature__item">
      <div class="archive__item">
        {% if project.header.teaser %}
          <div class="archive__item-teaser">
            <img src="{{ project.header.teaser | relative_url }}" alt="{{ project.title }}">
          </div>
        {% endif %}
        <div class="archive__item-body">
          <h2 class="archive__item-title">{{ project.title }}</h2>
          <div class="archive__item-excerpt">
            <p>{{ project.description }}</p>
          </div>
          <p><a href="{{ project.url | relative_url }}" class="btn btn--primary">Learn More</a></p>
        </div>
      </div>
    </div>
  {% endfor %}
</div>

# This approach:
# - Automatically pulls projects from _projects/ collection
# - Respects order field for sorting
# - No need to manually update homepage when adding projects
# - Aligns with FR-012 (easy project expansion)

# ============================================================================
# VALIDATION RULES
# ============================================================================
# 1. layout must be "splash" (FR-003)
# 2. permalink must be "/"
# 3. feature_row must be present (or dynamic alternative)
# 4. Each feature row item must have title, excerpt, url
# 5. Images must have alt text for accessibility
# 6. URLs must point to existing project pages
# 7. Button classes must be valid Minimal Mistakes classes

# ============================================================================
# PERFORMANCE CONSIDERATIONS
# ============================================================================
# - Optimize header image: <200KB, 1920x1080px
# - Optimize teaser images: <50KB each, 400x300px
# - Use modern formats (WebP) with JPEG fallback
# - Lazy load images below the fold
# - Consider CDN for images if high traffic

# ============================================================================
# ACCESSIBILITY REQUIREMENTS
# ============================================================================
# - All images must have descriptive alt text
# - Color contrast between text and background must meet WCAG AA
# - Buttons must be keyboard accessible (handled by theme)
# - Heading hierarchy must be logical (h1 → h2 → h3)
# - Links must be distinguishable from regular text

# ============================================================================
# RESPONSIVE DESIGN
# ============================================================================
# Splash layout is responsive by default:
# - Desktop: Multi-column feature rows
# - Tablet: 2-column grid
# - Mobile: Single column stack
# - Header scales appropriately
# - Images resize to container width

# ============================================================================
# MAINTENANCE WORKFLOW
# ============================================================================
# Adding a new project to homepage:
# Option A (Manual):
#   1. Add new feature_row item in front matter
#   2. Include: image_path, alt, title, excerpt, url, btn_label, btn_class
#   3. Ensure order matches project priority

# Option B (Dynamic - Recommended):
#   1. Create project file in _projects/
#   2. Homepage automatically updates via Liquid template
#   3. No homepage edits needed (better maintainability)

# Removing a project:
#   - Option A: Delete feature_row item
#   - Option B: Remove/archive project file (if using dynamic approach)

# ============================================================================
# SEO OPTIMIZATION
# ============================================================================
# - Title should include site name and purpose
# - Excerpt should concisely describe site content
# - Use semantic HTML structure
# - Jekyll SEO Tag plugin handles meta tags automatically
# - Provide og:image for social sharing (header image works)
