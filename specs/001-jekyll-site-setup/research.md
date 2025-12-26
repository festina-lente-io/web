# Research: Jekyll Site Setup

**Date**: 2025-12-25  
**Feature**: Jekyll Website with Project Showcase  
**Branch**: 001-jekyll-site-setup

## Overview

This document resolves all "NEEDS CLARIFICATION" items from the Technical Context and provides research findings on best practices for Jekyll, Minimal Mistakes, and GitHub Pages deployment.

## Research Tasks

### 1. Ruby and Jekyll Versions for GitHub Pages

**Context**: Need to determine GitHub Pages-compatible Ruby and Jekyll versions.

**Decision**: Use GitHub Pages dependency versions
- **Ruby Version**: 2.7.4 (GitHub Pages default as of 2025)
- **Jekyll Version**: 3.9.5 (GitHub Pages currently uses Jekyll 3.x)

**Rationale**:
- GitHub Pages has specific version requirements documented at https://pages.github.com/versions/
- Using the exact versions ensures local development matches production environment
- GitHub Pages automatically builds with these versions, so matching them locally prevents deployment surprises
- Jekyll 4.x is not yet supported by GitHub Pages (as of 2025)

**Alternatives Considered**:
1. **Jekyll 4.x**: Latest version with better performance and features
   - Rejected: Not supported by GitHub Pages default build process
   - Would require custom GitHub Actions workflow
2. **Ruby 3.x**: Latest Ruby version
   - Rejected: GitHub Pages uses Ruby 2.7.x
   - Using newer version locally could introduce compatibility issues

**Implementation Notes**:
- Gemfile should specify `gem "github-pages", group: :jekyll_plugins` to automatically pull compatible versions
- This ensures all dependencies match GitHub Pages environment
- Local development should use same Ruby version via rbenv or rvm

---

### 2. Jekyll Plugins for GitHub Pages

**Context**: Need to identify the complete list of GitHub Pages-compatible plugins available.

**Decision**: Use GitHub Pages default plugin bundle
- **Core Plugins** (automatically enabled):
  - jekyll-coffeescript
  - jekyll-gist
  - jekyll-github-metadata
  - jekyll-paginate
  - jekyll-relative-links
  - jekyll-optional-front-matter
  - jekyll-readme-index
  - jekyll-default-layout
  - jekyll-titles-from-headings
- **Additional Plugins** (enabled via config):
  - jekyll-feed (RSS/Atom feeds)
  - jekyll-seo-tag (SEO meta tags)
  - jekyll-sitemap (XML sitemap)
  - jekyll-avatar
  - jekyll-remote-theme
  - jekyll-include-cache (performance optimization)

**Rationale**:
- GitHub Pages restricts plugins for security reasons
- Only whitelisted plugins from `github-pages` gem are allowed
- These plugins cover essential functionality (SEO, feeds, sitemaps)
- Minimal Mistakes theme expects these standard plugins
- jekyll-include-cache significantly improves build performance

**Alternatives Considered**:
1. **Custom Ruby Plugins**: Could add any functionality
   - Rejected: Not supported by GitHub Pages default build
   - Would require GitHub Actions build workflow
2. **JavaScript-based Solutions**: Client-side functionality
   - Considered: May be needed for advanced features later
   - For MVP, standard plugins are sufficient

**Implementation Notes**:
- Add to `_config.yml`:
  ```yaml
  plugins:
    - jekyll-feed
    - jekyll-seo-tag
    - jekyll-sitemap
    - jekyll-include-cache
  ```
- No custom plugins needed for initial implementation

---

### 3. Testing Strategy and Tools

**Context**: Need to define testing tools for link checking, performance, and accessibility.

**Decision**: Multi-layer testing approach
1. **Link Checking**: HTML-Proofer (Ruby gem)
2. **Performance & Accessibility**: Lighthouse CI (via GitHub Actions)
3. **Accessibility Auditing**: pa11y (Node.js tool, optional for local dev)

**Rationale**:
- **HTML-Proofer**:
  - Ruby-native, integrates well with Jekyll workflow
  - Validates HTML, checks links (internal/external), verifies images have alt text
  - Can run locally and in CI
  - Catches broken links before deployment
- **Lighthouse CI**:
  - Industry-standard performance/accessibility/SEO auditing
  - Automated via GitHub Actions
  - Provides scores that align with success criteria (SC-003)
  - Can fail builds if scores drop below thresholds
- **pa11y**:
  - Automated WCAG 2.1 compliance checking
  - Complements Lighthouse accessibility checks
  - Can catch additional a11y issues
  - Optional for local development, recommended for CI

**Alternatives Considered**:
1. **Manual Testing Only**: Human review of pages
   - Rejected: Not scalable, prone to human error
   - Still valuable as supplement, not replacement
2. **Jekyll Build Validation Only**: Only check if site builds
   - Rejected: Doesn't catch content quality issues (broken links, poor performance)
3. **WAVE (WebAIM)**: Browser-based accessibility testing
   - Considered: Good for manual spot-checks
   - Doesn't automate well for CI/CD
4. **axe DevTools**: Browser extension for accessibility
   - Considered: Excellent for manual testing during development
   - Less suited for automated CI workflows than pa11y

**Implementation Notes**:
- Add to Gemfile: `gem 'html-proofer'`
- Create GitHub Actions workflow for Lighthouse CI
- HTML-Proofer can run as rake task: `rake test` for local development
- Performance/accessibility testing runs on PR and main branch pushes
- Set Lighthouse thresholds: Performance ≥90, Accessibility ≥95, Best Practices ≥90, SEO ≥95

---

### 4. Minimal Mistakes Theme Setup Best Practices

**Context**: Need to understand optimal Minimal Mistakes configuration and customization patterns.

**Decision**: Use remote theme with minimal customization
- **Installation**: Remote theme via `jekyll-remote-theme` plugin
- **Skin**: "contrast" (per FR-002)
- **Customization Strategy**: Configuration-driven (via `_config.yml`)

**Rationale**:
- **Remote Theme Benefits**:
  - No need to copy theme files into repository
  - Automatic updates when theme is updated
  - Cleaner repository structure
  - Aligns with Constitution Principle II (Configuration as Code)
- **Minimal Customization**:
  - Minimal Mistakes is highly configurable via `_config.yml`
  - Most requirements achievable without overriding layouts/includes
  - Reduces maintenance burden
  - Makes theme updates easier

**Alternatives Considered**:
1. **Gem-based Theme**: Install theme as Ruby gem
   - Rejected: Remote theme is more GitHub Pages-friendly
   - Requires gemspec, more complex setup
2. **Fork Theme**: Copy all theme files into repository
   - Rejected: Creates maintenance burden
   - Harder to merge theme updates
   - Violates DRY principle
3. **Heavy Customization**: Override many layouts/includes
   - Rejected: Increases complexity unnecessarily
   - Only customize if configuration insufficient

**Implementation Notes**:
- Add to `_config.yml`:
  ```yaml
  remote_theme: mmistakes/minimal-mistakes
  minimal_mistakes_skin: "contrast"
  ```
- Only create `_includes/` or `_layouts/` overrides if absolutely necessary
- Document any overrides in README

---

### 5. Jekyll Collections Configuration

**Context**: Need to determine optimal collections setup for project showcase.

**Decision**: Use Jekyll collections with `output: true` for individual project pages
- **Collection Name**: `_projects`
- **Output**: Enabled (generates HTML pages for each project)
- **Permalink**: `/projects/:name/`
- **Sort Order**: Custom front matter field `order` or `date`

**Rationale**:
- Collections are designed for grouped content like projects
- Better than pages for content with consistent structure/metadata
- Enables filtering, sorting, and iteration in Liquid templates
- Front matter provides structured metadata (title, description, repo_url)
- Output enabled allows each project to have its own quickstart page

**Alternatives Considered**:
1. **_posts Collection**: Use blog post structure
   - Rejected: Posts imply chronological content; projects are not time-based
   - Date-based URLs inappropriate for projects
2. **_pages Directory**: Individual pages without collection
   - Rejected: Harder to iterate over all projects for homepage listing
   - No structured metadata system
3. **Data Files (_data/)**: YAML/JSON with project info
   - Rejected: Doesn't support long-form content (quickstart guides)
   - Would still need separate pages for each project

**Implementation Notes**:
- Add to `_config.yml`:
  ```yaml
  collections:
    projects:
      output: true
      permalink: /projects/:name/
  ```
- Create `_projects/` directory at repository root
- Each project file: `_projects/devtoys-mcp.md`, `_projects/code-standards.md`
- Front matter schema:
  ```yaml
  ---
  title: "Project Name"
  description: "Brief description"
  repo_url: "https://github.com/org/repo"
  order: 1
  ---
  ```

---

### 6. Custom Domain Setup and DNS Configuration

**Context**: Need to clarify custom domain setup process for www.festina-lente.io.

**Decision**: Use www subdomain as primary with apex redirect
- **Primary Domain**: www.festina-lente.io
- **Apex Redirect**: festina-lente.io → www.festina-lente.io
- **CNAME File**: Contains `www.festina-lente.io`
- **DNS Configuration**: CNAME record for www, A/ALIAS records for apex

**Rationale**:
- **www subdomain benefits**:
  - Better CDN flexibility (CNAME can point to GitHub Pages)
  - Easier to change hosting providers in future
  - Supports cookies across subdomains
- **GitHub Pages Support**:
  - Officially supports www subdomain
  - Apex domain support requires A records pointing to GitHub IPs
  - CNAME file at repository root triggers custom domain
- **User Experience**:
  - Redirect ensures users reach site regardless of which URL they type
  - SSL/HTTPS works automatically with GitHub Pages custom domains

**Alternatives Considered**:
1. **Apex Domain Only**: Use festina-lente.io without www
   - Rejected: Less flexible for CDN/hosting changes
   - Requires A records that may change
2. **Both Equally**: Serve site on both apex and www without redirect
   - Rejected: Creates duplicate content issues for SEO
   - Fragments analytics

**Implementation Notes**:
- Create CNAME file at repository root: `echo "www.festina-lente.io" > CNAME`
- Configure DNS:
  - CNAME record: `www.festina-lente.io` → `festina-lente-io.github.io`
  - A records for apex: `festina-lente.io` → GitHub Pages IPs (185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153)
  - Or use ALIAS/ANAME record if DNS provider supports: `festina-lente.io` → `festina-lente-io.github.io`
- Update `_config.yml`:
  ```yaml
  url: "https://www.festina-lente.io"
  ```
- GitHub Pages will handle apex → www redirect automatically

---

## Summary of Decisions

| Item | Decision | Key Rationale |
|------|----------|---------------|
| Ruby Version | 2.7.4 | GitHub Pages compatibility |
| Jekyll Version | 3.9.5 | GitHub Pages default |
| Plugins | github-pages gem bundle | Security whitelist, includes essentials |
| Testing | HTML-Proofer + Lighthouse CI + pa11y | Multi-layer validation |
| Theme Installation | Remote theme | Clean repo, easy updates |
| Theme Customization | Configuration-driven | Minimal overrides, maintainable |
| Collections | `_projects` with output | Structured project content |
| Custom Domain | www.festina-lente.io primary | CDN flexibility, GitHub Pages best practice |

## Next Steps

All "NEEDS CLARIFICATION" items resolved. Proceed to Phase 1:
1. Generate data-model.md with entity schemas
2. Create contracts/ directory with configuration schemas
3. Generate quickstart.md with developer setup guide
4. Update agent context with Jekyll/Minimal Mistakes technology additions
