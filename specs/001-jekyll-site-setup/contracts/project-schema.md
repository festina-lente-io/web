# Project Collection Item Schema
# Front matter contract for files in _projects/ collection
# Each file represents one project with quickstart documentation

# ============================================================================
# FILE NAMING CONVENTION
# ============================================================================
# Format: _projects/<project-slug>.md
# Examples:
#   - _projects/devtoys-mcp.md
#   - _projects/code-standards.md
# Slug becomes part of URL: /projects/<project-slug>/

# ============================================================================
# FRONT MATTER SCHEMA
# ============================================================================
---
title: "DevToys MCP Server"
  # Type: String (required)
  # Description: Display name of the project
  # Validation: 1-100 characters
  # Usage: Displayed in homepage feature row, navigation, page header
  # Example: "DevToys MCP Server", "Code Standards Guide"

description: "Model Context Protocol server providing development utility tools for encoding, decoding, formatting, and text manipulation."
  # Type: String (required)
  # Description: Brief project description (1-3 sentences, 50-150 words)
  # Validation: 50-150 words, plain text or simple markdown
  # Usage: Displayed in homepage feature row, meta description for SEO
  # Note: This appears as excerpt on homepage if custom excerpt not provided

repo_url: "https://github.com/festina-lente-io/devtoys-mcp"
  # Type: String (required)
  # Description: GitHub repository URL
  # Validation: Must be valid HTTPS URL pointing to github.com
  # Format: https://github.com/<owner>/<repo>
  # Usage: Used for "View on GitHub" links
  # Note: Must be publicly accessible

order: 1
  # Type: Integer (required)
  # Description: Display order on homepage (lower numbers appear first)
  # Validation: Positive integer, must be unique across all projects
  # Usage: Determines position in homepage feature rows
  # Example: 1 = first project, 2 = second project, etc.
  # Note: Leave gaps (1, 10, 20) to allow easy insertion of new projects

permalink: /projects/devtoys-mcp/
  # Type: String (optional)
  # Description: Custom URL path for this project page
  # Validation: Must start with /, no spaces, use hyphens for multi-word slugs
  # Default: Generated from collection permalink pattern (/projects/:name/)
  # Usage: Override if you need non-standard URL structure
  # Note: Usually omitted; let Jekyll generate from filename

layout: single
  # Type: String (optional)
  # Description: Layout template to use for rendering
  # Validation: Must be valid Minimal Mistakes layout
  # Default: Inherited from collection defaults (single)
  # Options: single, splash, archive, home
  # Note: Usually omitted; defaults work for most projects

excerpt: "Quick overview of DevToys MCP for homepage display"
  # Type: String (optional)
  # Description: Custom excerpt for homepage feature row
  # Validation: Similar to description length (50-100 words ideal)
  # Default: Falls back to description field
  # Usage: Override description for homepage if you want different text
  # Note: Most projects can omit this and use description

header:
  # Type: Object (optional)
  # Description: Header image/overlay configuration
  # Usage: Add visual element to project page
  overlay_color: "#333"
  overlay_filter: "0.5"
  overlay_image: /assets/images/devtoys-header.jpg
  teaser: /assets/images/devtoys-teaser.jpg
    # Teaser image for homepage feature row

toc: true
  # Type: Boolean (optional)
  # Description: Enable table of contents sidebar
  # Default: true (from collection defaults)
  # Usage: Helps navigate long quickstart guides
  # Note: Automatically generated from markdown headings

toc_sticky: true
  # Type: Boolean (optional)
  # Description: Make TOC sticky during scroll
  # Default: true (from collection defaults)
  # Usage: Keep navigation visible while scrolling

read_time: true
  # Type: Boolean (optional)
  # Description: Show estimated reading time
  # Default: true (from collection defaults)

share: true
  # Type: Boolean (optional)
  # Description: Enable social sharing buttons
  # Default: true (from collection defaults)

classes: wide
  # Type: String or Array (optional)
  # Description: CSS classes to apply to page
  # Options: wide (full-width content)
  # Usage: Remove sidebars for more content space

author_profile: false
  # Type: Boolean (optional)
  # Description: Show author profile sidebar
  # Default: false (from collection defaults)
  # Usage: Usually disabled for project documentation

related: false
  # Type: Boolean (optional)
  # Description: Show related posts/pages
  # Default: false (from collection defaults)

tags:
  # Type: Array (optional)
  # Description: Tags for categorization/filtering
  # Example: ["mcp", "developer-tools", "typescript"]
  - mcp
  - developer-tools
  - typescript

categories:
  # Type: Array (optional)
  # Description: Categories for organization
  # Example: ["projects", "tools"]
  - projects
  - tools

last_modified_at: 2025-12-25T10:00:00-05:00
  # Type: String (optional)
  # Description: Last modification date (ISO 8601 format)
  # Usage: SEO, sitemap priority
  # Format: YYYY-MM-DDTHH:MM:SS+TZ

---

# ============================================================================
# CONTENT BODY (Markdown)
# ============================================================================
# Required: All seven standardized sections
# Requirement: FR-020 mandates this structure

## Prerequisites

<!-- List requirements to use this project -->
<!-- Examples: -->
<!-- - Node.js 18+ -->
<!-- - Python 3.10+ -->
<!-- - API keys, environment setup -->

Before getting started with DevToys MCP, ensure you have:

- Node.js 18 or higher installed
- Claude Desktop or compatible MCP client
- Basic familiarity with command-line tools

## Installation

<!-- Step-by-step installation instructions -->
<!-- Use numbered lists for sequential steps -->
<!-- Include code blocks for commands -->

1. Clone the repository:
   ```bash
   git clone https://github.com/festina-lente-io/devtoys-mcp.git
   cd devtoys-mcp
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Build the project:
   ```bash
   npm run build
   ```

## Quick Start

<!-- First 5-10 minutes: Get user to success ASAP -->
<!-- Show most common use case -->
<!-- Minimal explanation, maximum action -->

Configure Claude Desktop to use DevToys MCP:

1. Edit your Claude Desktop configuration:
   ```json
   {
     "mcpServers": {
       "devtoys": {
         "command": "node",
         "args": ["/path/to/devtoys-mcp/dist/index.js"]
       }
     }
   }
   ```

2. Restart Claude Desktop

3. Try a command: "Encode this text to base64: Hello World"

## Next Steps

<!-- What to do after Quick Start -->
<!-- Point to advanced features, customization, integration -->
<!-- Help user go deeper -->

Now that you have DevToys MCP running:

- Explore available tools: encoding, decoding, formatting, hashing
- Learn about [advanced configuration](#advanced-usage)
- Integrate with your development workflow
- Check out the [GitHub repository](https://github.com/festina-lente-io/devtoys-mcp) for updates

## Troubleshooting

<!-- Common problems and solutions -->
<!-- Format: Problem → Solution -->
<!-- Use descriptive headings -->

### MCP Server Not Appearing in Claude

**Problem**: Claude Desktop doesn't show DevToys in available servers

**Solution**:
- Verify the path in config is absolute, not relative
- Check that `npm run build` completed successfully
- Restart Claude Desktop completely (quit and reopen)

### "Command not found" Error

**Problem**: Error when running tools

**Solution**:
- Ensure Node.js 18+ is installed: `node --version`
- Reinstall dependencies: `npm ci`

## FAQ

<!-- Frequently asked questions -->
<!-- Short Q&A format -->
<!-- Address common confusion points -->

**Q: What is MCP?**
A: Model Context Protocol - a standard for integrating tools with AI assistants like Claude.

**Q: Can I use this with other AI tools?**
A: Yes, any MCP-compatible client can use DevToys MCP.

**Q: Is this open source?**
A: Yes, MIT licensed. Contributions welcome!

## Advanced Usage

<!-- Deep dive into advanced features -->
<!-- Custom configurations, integration patterns, edge cases -->
<!-- For users who've mastered the basics -->

### Custom Tool Configuration

Advanced users can extend DevToys MCP with custom tools...

### Integration with CI/CD

Use DevToys MCP in automated workflows...

### Performance Tuning

For high-volume usage, consider these optimizations...

# ============================================================================
# VALIDATION RULES
# ============================================================================
# 1. All required front matter fields must be present
# 2. order value must be unique across all projects
# 3. repo_url must be valid HTTPS GitHub URL
# 4. All seven content sections must be present
# 5. External links to GitHub should use target="_blank" (handled by theme)
# 6. Code blocks should specify language for syntax highlighting
# 7. Headings should follow hierarchical structure (H2 for sections, H3 for subsections)

# ============================================================================
# CONTENT GUIDELINES
# ============================================================================
# - Use clear, concise language
# - Keep Quick Start minimal (5-10 minutes to success)
# - Prerequisites should list all requirements before installation
# - Installation should be step-by-step with commands
# - Troubleshooting should use Problem → Solution format
# - FAQ should be genuinely frequent questions
# - Advanced Usage for edge cases and deep dives

# ============================================================================
# MARKDOWN FORMATTING
# ============================================================================
# - Use ## for main sections (Prerequisites, Installation, etc.)
# - Use ### for subsections
# - Use ` for inline code
# - Use ``` for code blocks with language specification
# - Use **bold** for emphasis
# - Use [link text](url) for links
# - Use numbered lists for sequential steps
# - Use bullet lists for non-sequential items
# - Add blank lines between sections for readability
