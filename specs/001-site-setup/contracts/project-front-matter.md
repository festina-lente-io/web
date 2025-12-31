# Project Content Front Matter Schema

**File**: Project markdown files in `/content/projects/*.md`
**Format**: YAML front matter
**Required**: Yes (all project pages)

## Schema Definition

```yaml
---
# REQUIRED FIELDS

title: string
  # Display name of the project
  # Length: 1-100 characters
  # Example: "DevToys MCP"

description: string
  # Brief project description
  # Length: 50-150 words
  # Used in: meta tags, project listings, SEO
  # Example: "A Model Context Protocol server providing developer tools."

repo_url: string
  # GitHub repository URL
  # Format: Must be valid HTTPS URL to github.com
  # Example: "https://github.com/festina-lente-io/devtoys-mcp"

# OPTIONAL FIELDS

weight: integer
  # Display order (lower = higher priority)
  # Range: 1-1000
  # Default: 10
  # Example: 10

draft: boolean
  # Draft status (not published if true)
  # Default: false
  # Example: false

date: datetime
  # Creation date
  # Format: ISO 8601 (YYYY-MM-DD or RFC3339)
  # Example: 2025-12-25

lastmod: datetime
  # Last modification date
  # Format: ISO 8601 (YYYY-MM-DD or RFC3339)
  # Auto-populated by Hugo if enableGitInfo = true

type: string
  # Content type
  # Value: "projects" (recommended for consistency)
  # Default: inferred from directory structure

tags: array<string>
  # Content tags for categorization
  # Example: ["mcp", "developer-tools", "nodejs"]

categories: array<string>
  # Content categories
  # Example: ["Tools", "Libraries"]
---
```

## Example: DevToys MCP

```yaml
---
title: "DevToys MCP"
description: "A Model Context Protocol (MCP) server that provides developer tools and utilities directly in Claude Desktop. Simplifies common development tasks like JSON formatting, base64 encoding, hash generation, and more."
repo_url: "https://github.com/festina-lente-io/devtoys-mcp"
weight: 10
draft: false
date: 2025-12-25
type: "projects"
tags: ["mcp", "developer-tools", "nodejs", "claude"]
categories: ["Tools"]
---
```

## Example: Code Standards

```yaml
---
title: "Code Standards"
description: "A comprehensive collection of coding standards, best practices, and style guides for multiple programming languages. Ensures consistent, maintainable, and high-quality code across projects."
repo_url: "https://github.com/festina-lente-io/code-standards"
weight: 20
draft: false
date: 2025-12-25
type: "projects"
tags: ["standards", "best-practices", "documentation"]
categories: ["Documentation"]
---
```

## Validation Rules

### Field Constraints

- **title**:
  - Minimum length: 1 character
  - Maximum length: 100 characters
  - Must not be empty

- **description**:
  - Minimum words: 50
  - Maximum words: 150
  - Should be concise yet informative

- **repo_url**:
  - Must be valid URL
  - Must use HTTPS protocol
  - Must point to github.com domain
  - Pattern: `^https://github\.com/[\w-]+/[\w-]+/?$`

- **weight**:
  - Must be integer
  - Range: 1-1000
  - Lower values display first

- **draft**:
  - Must be boolean (true/false)
  - Drafts not published in production builds

- **date**, **lastmod**:
  - Must be valid ISO 8601 datetime
  - Formats: YYYY-MM-DD, YYYY-MM-DDTHH:MM:SSZ

- **tags**, **categories**:
  - Must be array of strings
  - Each string: 1-50 characters
  - Lowercase recommended

### Content Body Requirements

After front matter, markdown body must include 7 sections:

1. ## Prerequisites
2. ## Installation
3. ## Quick Start
4. ## Next Steps
5. ## Troubleshooting
6. ## FAQ
7. ## Advanced Usage

**Note**: Sections can be brief but must be present.

## Usage in Templates

Hugo templates can access front matter variables:

```html
<!-- layouts/projects/single.html -->
<h1>{{ .Title }}</h1>
<p>{{ .Params.description }}</p>
<a href="{{ .Params.repo_url }}" target="_blank">View on GitHub</a>
<div class="content">
  {{ .Content }}
</div>
```

## Migration Notes

When adding new projects:
1. Copy template from existing project
2. Update all required fields
3. Write content for all 7 sections
4. Validate YAML syntax
5. Preview locally: `hugo server`
6. Commit and push

When modifying schema:
1. Update all existing project files
2. Document change in this file
3. Update data-model.md
4. Create migration script if bulk changes needed
5. Test all projects build successfully
