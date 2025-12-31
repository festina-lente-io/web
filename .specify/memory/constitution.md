<!--
  SYNC IMPACT REPORT
  ==================
  Version Change: 1.0.0 → 2.0.0
  Ratification: 2025-12-25
  
  Modified Principles:
  - UPDATED: All principles made technology-agnostic (Jekyll → SSG)
  - UPDATED: Configuration references generic (not _config.yml specific)
  - UPDATED: Theme references generic (not Minimal Mistakes specific)
  - REMOVED: Jekyll-specific implementation details
  - ADDED: Generic static site generator terminology
  
  Technology Scope:
  - Applies to: Jekyll, Hugo, 11ty, Astro, Next.js SSG, or any static generator
  - Implementation details defined per-project in plan.md
  
  Templates Status:
  ✅ plan-template.md - Verified compatible
  ✅ spec-template.md - Verified compatible
  ✅ tasks-template.md - Verified compatible
  
  Follow-up TODOs: None
-->

# Festina Lente Web Constitution

## Core Principles

### I. Content-First Development

Content is the primary deliverable; all technical decisions serve content delivery and user experience.

**Rules**:

- Markdown files MUST be the source of truth for all content
- Content structure (front matter, categories, tags) MUST be consistent across all pages/posts
- Collections and data files MUST have documented schemas
- Navigation and taxonomy changes REQUIRE documentation updates

**Rationale**: Static sites prioritize content over dynamic features. Treating content as structured data ensures consistency, enables automation, and prevents technical debt in the content layer.

**Implementation Notes**:
- Front matter format: YAML, TOML, or JSON (project choice)
- Content organization: Collections, sections, or directories (SSG-dependent)
- Schema documentation: In data-model.md or equivalent

### II. Configuration as Code

All site configuration, theme customization, and build settings MUST be version-controlled and documented.

**Rules**:

- Configuration file changes MUST include inline comments explaining intent
- Theme configuration MUST be centralized (not scattered across multiple files)
- Custom variables MUST be documented in project README or dedicated configuration doc
- Local overrides (for development) MUST be git-ignored and documented
- Build configuration (dependencies, versions) MUST be explicitly declared

**Rationale**: Site configuration drives behavior, appearance, and build process. Centralizing and documenting configuration prevents "mystery settings" and makes the site reproducible across environments and team members.

### III. Performance and Accessibility (NON-NEGOTIABLE)

Every page MUST meet baseline performance and accessibility standards before deployment.

**Rules**:

- Lighthouse scores MUST achieve: Performance ≥90, Accessibility ≥95, Best Practices ≥90, SEO ≥95
- Images MUST bStatic hosting serves content globally, but poor performance or accessibility excludes users. These are foundational requirements, not negotiable enhancements.

**Implementation Notes**:
- Use native SSG optimization features (image processing, minification)
- Test with Lighthouse, WebPageTest, or equivalent tools
- Verify WCAG 2.1 AA compliance minimum
- Responsive design MUST be tested on mobile, tablet, and desktop viewports
- Semantic HTML and ARIA labels REQUIRED where appropriate
- Links and navigation MUST be keyboard-accessibleData Schemas" not "Update file")
- Draft content MUST use SSG draft mechanism (`draft: true` front matter or draft directory)
- Breaking content structure changes (e.g., renaming categories) REQUIRE migration plan and documentation
- Content deleted from main branch MUST be recoverable via git history (no force-push without justification)

**Rationale**: Content is the product. Version control ensures accountability, enables rollback, and allows collaboration without overwriting work.

**IStatic Site Generator Standards

**Technology Stack** (defined per-project in plan.md):

- **Static Site Generator**: Hugo, Jekyll, 11ty, Astro, Next.js SSG, or equivalent
- **Theme/Template**: Project-specific choice documented in plan.md
- **Hosting**: GitHub Pages, Netlify, Vercel, CloudFlare Pages, or equivalent static host
- **CI/CD**: GitHub Actions, GitLab CI, or equivalent automation

**Required Practices**:

- Theme updates MUST be tested locally before deploying to production
- Custom layouts/templates MUST follow chosen theme/SSG conventions
- Build dependencies MUST be explicitly versioned and documented
- Template syntax MUST be validated locally before commit
- Build output MUST be git-ignored (not committed to main branch)

**File Organization** (SSG-dependent, document in README):

- Content files in documented content directory structure
- Static assets in dedicated static/public directory
- **Jekyll**: Static site generator (Ruby-based)
- **Minimal Mistakes**: Jekyll theme for layout, styling, and components
- **GitHub Pages**: Hosting and automated deployment via GitHub Actions or Pages build service

**Required Practices**:

- Theme updates MUST be tested locally before deploying to production
- Custom layouts/includes MUST follow Minimal Mistakes naming conventions and structure
- Plugins MUST be GitHub Pages-compatible (see [GitHub Pages supported plugins](https://pages.github.com/versions/))
- Liquid template syntax MUST be validated locally before commit

**File Organization**:

- `_posts/`: Blog posts in `YYYY-MM-DD-title.md` format
- `_pages/`: Standalone pages (About, Contact, etc.)
- `_data/`: YAML/JSON data files for navigation, authors, etc.
- `assets/`: Images, CSS overrides, JavaScript
- `_config.yml`: Site-wide configuration

**Custom Code**:

- CSS overrides MUST live in `assets/css/main.scss` or dedicated custom stylesheet
- JavaScript customizations MUST be placed in `assets/js/` and enqueued properly
- Avoid modifying theme files directly; use Jekyll's override mechanism

## GitHub Pages Deployment

**Deployment Workflow**:

- Main branch (`main`) MUST always be production-ready
- Feature branches for new content/features → PR → review → merge
- CI/CD pipeline handles build and deployment automatically
- Build failures MUST be addressed before merge (no bypassing CI)

**Pre-Deployment Checklist**:

- [ ] Local build succeeds (SSG build command)
- [ ] Local preview matches expected output (SSG dev server)
- [ ] No broken links (verified with link checker)
- [ ] Images optimized and properly referenced
- [ ] Front matter/metadata valid and complete
- [ ] Configuration changes tested locally

**Rollback Procedure**:

- If production build breaks: revert commit and redeploy via CI/CD
- Content errors: edit and push fix (fast-forward)
- Major issues: revert to last known good commit

## Governance

This constitution supersedes all other development practices. All changes, content updates, and feature additions MUST align with these principles.

**Amendment Process**:

- Proposed changes MUST be documented (reason, impact, migration path)
- Changes affecting content structure REQUIRE coordination with content team
- Version bumps follow semantic versioning:
  - **MAJOR**: Breaking changes (e.g., theme migration, new taxonomy structure)
  - **MINOR**: New principles or sections (e.g., adding SEO standards)
  - **PATCH**: Clarifications, wording improvements, non-semantic fixes

**Compliance**:

- All PRs MUST verify alignment with constitution principles
- Technical decisions that contradict principles MUST be justified and documented
- Content contributions MUST follow front matter and organizational standards
- Use `.specify/` templates and workflows for consistent feature implementation

**Continuous Improvement**:

- Constitution reviewed quarterly or when major theme/Jekyll updates occur
- Feedback from content creators and developers informs amendments
- Performance and accessibility benchmarks updated as web standards evolve

**Version**: 1.0.0 | **Ratified**: 2025-12-24 | **Last Amended**: 2025-12-24
