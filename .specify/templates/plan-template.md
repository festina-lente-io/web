# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

**Note**: This template is filled in by the `/speckit.plan` command. See `.specify/templates/commands/plan.md` for the execution workflow.

## Summary

[Extract from feature spec: primary requirement + technical approach from research]

## Technical Context

<!--
  ACTION REQUIRED: Replace the content in this section with the technical details
  for the project. The structure here is presented in advisory capacity to guide
  the iteration process.
-->

**Static Site Generator**: Jekyll (Ruby-based)
**Theme**: Minimal Mistakes
**Hosting**: GitHub Pages
**Ruby Version**: [e.g., Ruby 3.1+ or NEEDS CLARIFICATION]
**Jekyll Version**: [e.g., Jekyll 4.3.2 or NEEDS CLARIFICATION]
**Plugins**: [e.g., jekyll-feed, jekyll-seo-tag, or default GitHub Pages plugins]
**Build Tool**: [e.g., Bundler for dependency management]
**Testing**: [e.g., HTML-Proofer for link checking, pa11y for accessibility, or NEEDS CLARIFICATION]
**Target Platform**: Static HTML/CSS/JS served via GitHub Pages CDN
**Performance Goals**: [e.g., Lighthouse Performance ≥90, First Contentful Paint <1.5s, or NEEDS CLARIFICATION]
**Constraints**: [e.g., GitHub Pages plugin restrictions, no server-side processing, or NEEDS CLARIFICATION]
**Scale/Scope**: [e.g., 50 pages, 100 blog posts, monthly content updates, or NEEDS CLARIFICATION]

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

**Principle I - Content-First Development**:

- [ ] Content structure (front matter, categories, tags) is documented
- [ ] Markdown is the source of truth for all new content
- [ ] Collections/data file schemas are defined (if applicable)

**Principle II - Configuration as Code**:

- [ ] `_config.yml` changes are documented with inline comments
- [ ] Custom variables are explained in README or config doc
- [ ] No configuration scattered across undocumented files

**Principle III - Performance & Accessibility (NON-NEGOTIABLE)**:

- [ ] Performance targets defined (Lighthouse scores: Perf≥90, A11y≥95, BP≥90, SEO≥95)
- [ ] Image optimization plan included
- [ ] Responsive design test plan specified (mobile/tablet/desktop)
- [ ] Semantic HTML and keyboard navigation considered

**Principle IV - Version Control for Content**:

- [ ] Content commit strategy defined
- [ ] Draft content workflow specified (`published: false` or `_drafts/`)
- [ ] Breaking content structure changes include migration plan

**Deployment Standards**:

- [ ] Local build testing procedure defined
- [ ] Pre-deployment checklist prepared
- [ ] Rollback procedure documented

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
<!--
  ACTION REQUIRED: Replace the placeholder tree below with the concrete layout
  for this feature. Delete unused options and expand the chosen structure with
  real paths. The delivered plan must not include Option labels.
-->

```text
# Jekyll/GitHub Pages Project (DEFAULT for this repository)
_posts/                  # Blog posts (YYYY-MM-DD-title.md format)
_pages/                  # Standalone pages (about, contact, etc.)
_data/                   # YAML/JSON data files (navigation, authors, etc.)
_drafts/                 # Unpublished content
_config.yml              # Site configuration
assets/
├── css/                 # Custom stylesheets
├── js/                  # Custom JavaScript
└── images/              # Image assets
_includes/               # Custom includes (optional, overrides theme)
_layouts/                # Custom layouts (optional, overrides theme)
_sass/                   # Custom SASS/SCSS (optional)

# [REMOVE IF UNUSED] Option: Single project (generic non-Jekyll)
src/
├── models/
├── services/
├── cli/
└── lib/

tests/
├── contract/
├── integration/
└── unit/

# [REMOVE IF UNUSED] Option: Web application (when "frontend" + "backend" detected)
backend/
├── src/
│   ├── models/
│   ├── services/
│   └── api/
└── tests/

frontend/
├── src/
│   ├── components/
│   ├── pages/
│   └── services/
└── tests/
```

**Structure Decision**: [Document the selected structure and reference the real
directories captured above]

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

| Violation | Why Needed | Simpler Alternative Rejected Because |
| --------- | ---------- | ------------------------------------ |
| [e.g., 4th project] | [current need] | [why 3 projects insufficient] |
| [e.g., Repository pattern] | [specific problem] | [why direct DB access insufficient] |
