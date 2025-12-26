# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

**Note**: This template is filled in by the `/speckit.plan` command. See `.specify/templates/commands/plan.md` for the execution workflow.

## Summary

Build a GitHub Pages website using Jekyll and Minimal Mistakes theme with a homepage that showcases projects in a portfolio layout and provides comprehensive quickstart guides for each project. The site will use Jekyll collections for project organization, serve from www.festina-lente.io custom domain, and meet strict performance and accessibility standards.

## Technical Context

**Static Site Generator**: Jekyll 3.9.5 (GitHub Pages default version)
**Theme**: Minimal Mistakes (contrast skin, remote theme)
**Hosting**: GitHub Pages
**Ruby Version**: 2.7.4 (GitHub Pages compatible, research.md section 1)
**Jekyll Version**: 3.9.5 (GitHub Pages default, research.md section 1)
**Plugins**: GitHub Pages default bundle (jekyll-feed, jekyll-seo-tag, jekyll-sitemap, jekyll-include-cache) - research.md section 2
**Build Tool**: Bundler for dependency management
**Testing**: HTML-Proofer for link checking, Lighthouse CI for performance/accessibility, pa11y for automated accessibility testing (research.md section 3)
**Target Platform**: Static HTML/CSS/JS served via GitHub Pages CDN
**Performance Goals**: Lighthouse scores: Performance ≥90, Accessibility ≥95, Best Practices ≥90, SEO ≥95; page load <2s on standard broadband
**Constraints**: GitHub Pages plugin restrictions (whitelist only), no server-side processing, static content only
**Scale/Scope**: Initial 2 projects (devtoys-mcp, code-standards), homepage + project quickstart pages, expandable by adding markdown files to `_projects/` collection
**Custom Domain**: www.festina-lente.io (primary) with apex domain redirect (research.md section 6)
**Responsive Design**: 320px to 4K resolution support
**Collections**: `_projects` with output enabled, permalink pattern `/projects/:name/` (research.md section 5)

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

**Principle I - Content-First Development**:

- [x] Content structure (front matter, categories, tags) is documented - Projects collection with title, description, repo_url, permalink, order attributes
- [x] Markdown is the source of truth for all new content - All pages and project quickstart guides authored in Markdown
- [x] Collections/data file schemas are defined (if applicable) - Project collection schema defined in spec (FR-019, FR-020)

**Principle II - Configuration as Code**:

- [x] `_config.yml` changes are documented with inline comments - Required by FR-009
- [x] Custom variables are explained in README or config doc - FR-009 mandates inline documentation
- [x] No configuration scattered across undocumented files - Navigation in _data/navigation.yml per FR-008

**Principle III - Performance & Accessibility (NON-NEGOTIABLE)**:

- [x] Performance targets defined (Lighthouse scores: Perf≥90, A11y≥95, BP≥90, SEO≥95) - SC-003 defines these exact targets
- [x] Image optimization plan included - Constitution requires optimized images with alt text
- [x] Responsive design test plan specified (mobile/tablet/desktop) - FR-011 + SC-004 cover 320px to 4K
- [x] Semantic HTML and keyboard navigation considered - FR-011 mobile-friendly + constitution accessibility requirements

**Principle IV - Version Control for Content**:

- [x] Content commit strategy defined - Standard git workflow on feature branch
- [x] Draft content workflow specified (`published: false` or `_drafts/`) - Constitution specifies this pattern
- [x] Breaking content structure changes include migration plan - Initial setup, no existing content to migrate

**Deployment Standards**:

- [x] Local build testing procedure defined - Pre-deployment checklist in constitution applies
- [x] Pre-deployment checklist prepared - Constitution provides standard checklist
- [x] Rollback procedure documented - Constitution defines rollback procedure

**GATE STATUS**: ✅ PASSED - All constitutional requirements met, no violations to justify

## Constitution Check - Phase 1 Re-evaluation

*Post-design verification with concrete implementation decisions*

**Principle I - Content-First Development**:

- ✅ **Validated**: data-model.md defines complete front matter schemas for all content types
- ✅ **Validated**: Contracts specify Project, Navigation, and Config schemas with validation rules
- ✅ **Validated**: All content authored in Markdown with YAML front matter (Jekyll standard)
- ✅ **Validated**: Collections configuration documented in config-schema.yml

**Principle II - Configuration as Code**:

- ✅ **Validated**: config-schema.yml provides comprehensive inline documentation for all settings
- ✅ **Validated**: All theme configuration centralized in `_config.yml` (remote_theme pattern)
- ✅ **Validated**: Navigation centralized in `_data/navigation.yml` with schema documentation
- ✅ **Validated**: No scattered configuration - clear separation: _config.yml (global), _data/ (structured data)

**Principle III - Performance & Accessibility (NON-NEGOTIABLE)**:

- ✅ **Validated**: Testing strategy includes HTML-Proofer, Lighthouse CI, and pa11y (research.md section 3)
- ✅ **Validated**: Image optimization guidelines in contracts/project-schema.md (<50KB teasers, <200KB headers)
- ✅ **Validated**: Responsive design via Minimal Mistakes theme (mobile-first, 320px-4K tested)
- ✅ **Validated**: All image schemas require alt text (homepage-schema.md, project-schema.md)
- ✅ **Validated**: Semantic HTML via Minimal Mistakes layouts, keyboard navigation built-in

**Principle IV - Version Control for Content**:

- ✅ **Validated**: Standard git workflow documented in quickstart.md
- ✅ **Validated**: Draft content workflow specified: `published: false` front matter or `_drafts/` directory
- ✅ **Validated**: Content structure defined in data-model.md with migration path for future changes
- ✅ **Validated**: All content tracked in git with descriptive commits (per quickstart guidelines)

**Deployment Standards**:

- ✅ **Validated**: Local testing procedure in quickstart.md (build, htmlproofer, lighthouse)
- ✅ **Validated**: Pre-deployment checklist from constitution applies (documented in quickstart)
- ✅ **Validated**: Rollback procedure: revert commit + redeploy (documented in quickstart)

**PHASE 1 GATE STATUS**: ✅ PASSED - Design fully complies with constitution, ready for implementation

## Project Structure

### Documentation (this feature)

```text
specs/[###-feature]/
├── plan.md              # This file (/speckit.plan command output)
├── research.md          # Phase 0 output (/speckit.plan command)
├── data-model.md        # Phase 1 output (/speckit.plan command)
├── quickstart.md        # Phase 1 output (/speckit.plan command)
├── contracts/           # Phase 1 output (/speckit.plan command)
└── tasks.md             # Phase 2 output (/speckit.tasks command - NOT created by /speckit.plan)
```

### Source Code (repository root)

```text
# Jekyll/GitHub Pages Project Structure
_projects/               # Project collection items (devtoys-mcp.md, code-standards.md)
_pages/                  # Standalone pages (if needed for About, etc.)
_data/
└── navigation.yml       # Site navigation configuration
_config.yml              # Site-wide configuration with inline documentation
assets/
├── css/                 # Custom stylesheets (if theme overrides needed)
├── js/                  # Custom JavaScript (if needed)
└── images/              # Image assets for projects/pages
index.md                 # Homepage with splash layout and feature rows
CNAME                    # Custom domain configuration (www.festina-lente.io)
Gemfile                  # Ruby dependencies (Jekyll, Minimal Mistakes theme)
Gemfile.lock             # Locked dependency versions
_includes/               # Custom includes (optional, only if overriding theme)
_layouts/                # Custom layouts (optional, only if overriding theme)
```

**Structure Decision**: Using Jekyll collections pattern for projects (`_projects/`) as specified in FR-005. Homepage will be `index.md` with splash layout (FR-003). Navigation centralized in `_data/navigation.yml` per FR-008. All configuration in `_config.yml` per FR-009 and Constitution Principle II. CNAME file at root for custom domain per FR-016.

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

| Violation | Why Needed | Simpler Alternative Rejected Because |
| --------- | ---------- | ------------------------------------ |
| [e.g., 4th project] | [current need] | [why 3 projects insufficient] |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient] |
