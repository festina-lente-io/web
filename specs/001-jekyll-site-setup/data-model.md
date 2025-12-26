# Data Model: Jekyll Site Setup

**Date**: 2025-12-25  
**Feature**: Jekyll Website with Project Showcase  
**Branch**: 001-jekyll-site-setup

## Overview

This document defines the content entities, their attributes, relationships, and validation rules for the Jekyll website. In Jekyll, "entities" are represented as front matter schemas for collections, pages, and data files.

## Entity Schemas

### 1. Project Collection Item

**Location**: `_projects/*.md`  
**Purpose**: Represents a project in the portfolio with associated quickstart documentation

**Front Matter Schema**:

```yaml
---
title: String (required)
  # Display name of the project
  # Example: "DevToys MCP Server"
  # Validation: 1-100 characters, no special formatting

description: String (required)
  # Brief description of the project (1-3 sentences)
  # Example: "Model Context Protocol server providing development utility tools"
  # Validation: 50-150 words, plain text or markdown

repo_url: String (required)
  # GitHub repository URL
  # Example: "https://github.com/festina-lente-io/devtoys-mcp"
  # Validation: Must be valid HTTPS URL, must point to github.com

order: Integer (required)
  # Display order on homepage (lower numbers appear first)
  # Example: 1
  # Validation: Positive integer, unique across all projects

permalink: String (optional)
  # Custom URL path for the project page
  # Example: "/projects/devtoys-mcp/"
  # Default: Generated from collection permalink pattern
  # Validation: Must start with /, no spaces

layout: String (optional)
  # Layout template to use (defaults to collection default or single)
  # Example: "single"
  # Default: Inherited from theme

excerpt: String (optional)
  # Custom excerpt for homepage display (if different from description)
  # Default: Falls back to description
  # Validation: Similar to description length constraints
---

# Content Body (Markdown)
# Quickstart guide with standardized sections:
# - Prerequisites
# - Installation
# - Quick Start
# - Next Steps
# - Troubleshooting
# - FAQ
# - Advanced Usage
```

**Relationships**:
- **Homepage**: Projects are iterated and displayed as feature rows
- **Navigation**: Each project appears in navigation menu
- **Collection**: All projects belong to `_projects` collection

**Validation Rules**:
1. All required fields must be present
2. `order` values must be unique across all projects
3. `repo_url` must be valid URL starting with `https://github.com/`
4. Content body must include all seven standardized sections
5. External links in content should use `target="_blank"`

**Initial Data**:
- `_projects/devtoys-mcp.md` (order: 1)
- `_projects/code-standards.md` (order: 2)

---

### 2. Page

**Location**: Root directory or `_pages/`  
**Purpose**: Standalone pages like homepage, about, etc.

**Front Matter Schema**:

```yaml
---
title: String (required)
  # Page title
  # Example: "Festina Lente - Project Portfolio"
  # Validation: 1-100 characters

layout: String (required)
  # Minimal Mistakes layout to use
  # Example: "splash" for homepage, "single" for others
  # Validation: Must be valid Minimal Mistakes layout name

permalink: String (optional)
  # Custom URL path
  # Example: "/" for homepage, "/about/" for about page
  # Default: Generated from filename

header: Object (optional for splash layout)
  # Header configuration for splash layout
  # Example:
  #   overlay_color: "#000"
  #   overlay_filter: "0.5"
  #   overlay_image: /assets/images/header.jpg
  #   actions:
  #     - label: "Learn More"
  #       url: "/about/"

intro: Array (optional for splash layout)
  # Intro sections for splash layout
  # Array of text blocks

feature_row: Array (optional for splash layout)
  # Feature rows for displaying projects
  # Example:
  #   - image_path: /assets/images/project1.jpg
  #     title: "Project Name"
  #     excerpt: "Description"
  #     url: "/projects/project-name/"
  #     btn_label: "Learn More"
  #     btn_class: "btn--primary"

excerpt: String (optional)
  # Page excerpt for SEO and social sharing
  # Default: Auto-extracted from content

classes: Array (optional)
  # CSS classes to apply to page
  # Example: ["wide"]
---

# Content Body (Markdown)
# Page content (may be minimal for splash layout)
```

**Relationships**:
- **Navigation**: Pages appear in main navigation menu
- **Projects**: Homepage displays projects from collection

**Validation Rules**:
1. Homepage must use "splash" layout
2. Homepage must define `feature_row` for projects
3. All permalinks must be unique
4. Layout must be valid Minimal Mistakes layout

**Initial Data**:
- `index.md` (homepage with splash layout)

---

### 3. Navigation Item

**Location**: `_data/navigation.yml`  
**Purpose**: Define site navigation menu structure

**Schema**:

```yaml
main:  # Main navigation menu
  - title: String (required)
      # Display text for navigation link
      # Example: "Home"
      # Validation: 1-30 characters

    url: String (required)
      # Target URL (relative or absolute)
      # Example: "/"
      # Validation: Must be valid URL or path

    description: String (optional)
      # Tooltip or ARIA description
      # Example: "Return to homepage"

# Example structure:
main:
  - title: "Home"
    url: "/"
  - title: "DevToys MCP"
    url: "/projects/devtoys-mcp/"
  - title: "Code Standards"
    url: "/projects/code-standards/"
```

**Relationships**:
- **Pages**: Navigation items link to pages
- **Projects**: Navigation items link to project pages
- **Theme**: Minimal Mistakes reads this file for menu rendering

**Validation Rules**:
1. At least one navigation item required (typically "Home")
2. URLs must point to existing pages
3. Title must be unique within navigation
4. Order in YAML determines display order

**Initial Data**:
```yaml
main:
  - title: "Home"
    url: "/"
  - title: "DevToys MCP"
    url: "/projects/devtoys-mcp/"
  - title: "Code Standards"
    url: "/projects/code-standards/"
```

---

### 4. Site Configuration

**Location**: `_config.yml`  
**Purpose**: Global site settings and theme configuration

**Key Configuration Sections**:

```yaml
# Site Settings
title: String (required)
  # Site title
  # Example: "Festina Lente"

subtitle: String (optional)
  # Site subtitle/tagline
  # Example: "Software Development Projects"

description: String (required)
  # Site description for SEO
  # Example: "Portfolio of open-source projects by Festina Lente"

url: String (required)
  # Site URL (production)
  # Example: "https://www.festina-lente.io"
  # Validation: Must be HTTPS URL

baseurl: String (optional)
  # Subpath for site (usually empty for GitHub Pages user site)
  # Example: "" or "/blog"

repository: String (optional)
  # GitHub repository in format owner/repo
  # Example: "festina-lente-io/web"

# Theme Settings
remote_theme: String (required)
  # Remote theme identifier
  # Example: "mmistakes/minimal-mistakes"

minimal_mistakes_skin: String (required)
  # Theme skin
  # Example: "contrast"
  # Validation: Must be valid MM skin name

# Collections
collections:
  projects:
    output: Boolean (required)
      # Generate HTML pages for each item
      # Value: true
    permalink: String (required)
      # URL pattern for collection items
      # Example: "/projects/:name/"

# Defaults
defaults:
  # Scope-specific front matter defaults
  # Example:
  - scope:
      path: ""
      type: "projects"
    values:
      layout: "single"
      author_profile: false
      share: true

# Plugins
plugins: Array (required)
  # Jekyll plugins to enable
  # Example:
  #   - jekyll-feed
  #   - jekyll-seo-tag
  #   - jekyll-sitemap
  #   - jekyll-include-cache

# Build Settings
markdown: String (required)
  # Markdown processor
  # Value: "kramdown"

kramdown:
  # Kramdown configuration
  input: "GFM"  # GitHub Flavored Markdown

# SEO/Social
author:
  name: String
  avatar: String (URL)
  bio: String
  links: Array

og_image: String (optional)
  # Default Open Graph image

twitter:
  username: String (optional)

social:
  # Social media links
```

**Validation Rules**:
1. URL must match CNAME file content
2. All required plugins must be GitHub Pages-compatible
3. Collection output must be true for projects
4. Theme skin must be "contrast" per requirements
5. All URLs must use HTTPS

---

## Data Relationships Diagram

```text
┌─────────────────┐
│   _config.yml   │ (Global Configuration)
└────────┬────────┘
         │
         ├─────────────────────────────┐
         │                             │
         ▼                             ▼
┌──────────────────┐         ┌─────────────────┐
│  navigation.yml  │         │    Collections  │
│  (Navigation)    │         │   (_projects)   │
└────────┬─────────┘         └────────┬────────┘
         │                            │
         │                            │
         ▼                            ▼
┌──────────────────┐         ┌─────────────────┐
│   index.md       │◄────────│  Project Items  │
│   (Homepage)     │  reads  │  (devtoys-mcp,  │
│                  │         │   code-standards)│
└──────────────────┘         └─────────────────┘
         │                            │
         │                            │
         └────────────┬───────────────┘
                      │
                      ▼
                ┌──────────────┐
                │ Generated    │
                │ HTML Pages   │
                └──────────────┘
```

## Content Workflow

### Adding a New Project

1. Create new markdown file: `_projects/new-project.md`
2. Add required front matter:
   ```yaml
   ---
   title: "Project Name"
   description: "Brief description"
   repo_url: "https://github.com/org/repo"
   order: 3
   ---
   ```
3. Add quickstart content with seven standardized sections
4. Update `_data/navigation.yml` to add navigation link
5. Commit and push to trigger GitHub Pages build

### Modifying Homepage

1. Edit `index.md`
2. Update `feature_row` array to modify project display
3. Projects automatically pulled from `_projects` collection
4. Commit and push

### Updating Site Configuration

1. Edit `_config.yml`
2. Add inline comments explaining changes (per Constitution)
3. Test locally: `bundle exec jekyll serve`
4. Commit and push (triggers rebuild)

## Validation Strategy

**Pre-commit Checks**:
- [ ] Front matter syntax valid (YAML lint)
- [ ] Required fields present
- [ ] URLs valid format
- [ ] Order values unique

**Build-time Checks**:
- [ ] Jekyll build succeeds
- [ ] No liquid syntax errors
- [ ] Collections properly generated

**Post-build Checks**:
- [ ] HTML-Proofer validates links
- [ ] All images have alt text
- [ ] Internal links resolve
- [ ] External links return 200 OK

**Deployment Checks**:
- [ ] Lighthouse scores meet thresholds (SC-003)
- [ ] Pages load within 2 seconds (SC-006)
- [ ] Responsive design works 320px-4K (SC-004)

## State Transitions

### Project Lifecycle

```text
Draft → Published → Updated → (Archived)
  │         │          │           │
  │         │          │           └─> Remove from _projects/
  │         │          │               Keep in git history
  │         │          │
  │         │          └─> Edit markdown file
  │         │              Commit changes
  │         │
  │         └─> Add to _projects/
  │             Update navigation
  │             Deploy
  │
  └─> Create in _drafts/ or
      Use published: false
```

### Content Publication

- **Draft**: `published: false` in front matter OR file in `_drafts/`
- **Published**: File in `_projects/` with `published: true` (or omitted)
- **Updated**: Edit file, commit, rebuild
- **Archived**: Remove file (remains in git history for recovery)

---

## Summary

This data model defines three primary content entities:
1. **Project Collection Items**: Structured project content with quickstart guides
2. **Pages**: Site pages (especially homepage with splash layout)
3. **Navigation Items**: Menu structure in YAML

All entities follow Constitution principles:
- Content-first (Markdown source of truth)
- Configuration as code (documented schemas)
- Version controlled (git-tracked changes)

The model supports the key functional requirements:
- FR-005: Collections for project organization
- FR-008: Navigation configuration
- FR-009: Centralized configuration
- FR-020: Standardized quickstart structure
