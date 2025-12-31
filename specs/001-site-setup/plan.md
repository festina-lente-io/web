# Implementation Plan: Project Showcase Website

**Branch**: `001-site-setup` | **Date**: 2025-12-25 | **Spec**: [spec.md](spec.md)
**Input**: Feature specification from `/specs/001-site-setup/spec.md`

## Summary

Build a static website with Hugo and Hextra theme to showcase Festina Lente projects (devtoys-mcp and code-standards) with comprehensive quickstart guides. The site will be deployed to GitHub Pages via GitHub Actions CI/CD pipeline, using GitVersion for semantic versioning. The homepage will display a project portfolio, with each project having a dedicated quickstart page following a standardized structure (Prerequisites, Installation, Quick Start, Next Steps, Troubleshooting, FAQ, Advanced Usage).

## Technical Context

**Static Site Generator**: Hugo (Go-based, v0.120.0+)
**Theme**: Hextra (modern documentation theme for Hugo)
**Hosting**: GitHub Pages
**CI/CD**: GitHub Actions workflow for automated build and deployment
**Versioning**: GitVersion for semantic versioning
**Go Version**: Go 1.21+ (for Hugo extended features)
**Hugo Version**: Hugo Extended v0.120.0+ (required for SCSS processing)
**Content Format**: Markdown with YAML front matter
**Build Tool**: Hugo CLI
**Testing**: 
  - HTML validation via htmltest
  - Link checking with htmltest
  - Lighthouse CI for performance/accessibility audits
  - pa11y for accessibility testing
**Target Platform**: Static HTML/CSS/JS served via GitHub Pages CDN
**Performance Goals**: 
  - Lighthouse Performance ≥90
  - Lighthouse Accessibility ≥95
  - Lighthouse Best Practices ≥90
  - Lighthouse SEO ≥95
  - First Contentful Paint <1.5s
  - Time to Interactive <3s
**Constraints**: 
  - No server-side processing (static hosting only)
  - Custom domain setup (www.festina-lente.io)
  - CNAME file required for GitHub Pages custom domain
  - GitHub Actions build time limits
  - Apex domain redirect: Implemented via DNS A records pointing to GitHub Pages IPs (185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153) + GitHub Pages automatic redirect to www subdomain
**Scale/Scope**: 
  - Initial: 2 projects with quickstart pages
  - Homepage + 2 project pages = 3 total pages
  - Expected to scale to 10-20 projects over time
  - Content updates: weekly to monthly

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

**Note**: The Festina Lente Web Constitution was written for Jekyll/Minimal Mistakes stack. This project uses Hugo/Hextra instead. The principles remain valid but implementation details are adapted for Hugo.

**Principle I - Content-First Development**:

- [x] Content structure (front matter, categories, tags) is documented
  - Hugo front matter schema defined for projects (title, description, repo_url, weight)
  - Markdown is primary format for all content
- [x] Markdown is the source of truth for all new content
  - All pages authored in Markdown with YAML front matter
- [x] Collections/data file schemas are defined (if applicable)
  - Project content organized in `/content/projects/` directory
  - Homepage in `/content/_index.md`

**Principle II - Configuration as Code**:

- [x] Configuration changes are documented with inline comments
  - `hugo.toml` (or `config.toml`) with documented settings
  - Hextra theme configuration documented
- [x] Custom variables are explained in README or config doc
  - Site parameters (title, description, baseURL) documented
  - Theme customization parameters explained
- [x] No configuration scattered across undocumented files
  - Single configuration file approach with Hugo

**Principle III - Performance & Accessibility (NON-NEGOTIABLE)**:

- [x] Performance targets defined (Lighthouse scores: Perf≥90, A11y≥95, BP≥90, SEO≥95)
  - See Technical Context for specific metrics
- [x] Image optimization plan included
  - Hugo image processing for responsive images
  - WebP format with fallbacks
  - Appropriate alt text for all images
- [x] Responsive design test plan specified (mobile/tablet/desktop)
  - Hextra theme provides mobile-first responsive design
  - Test on 320px, 768px, 1024px, 1920px viewports
- [x] Semantic HTML and keyboard navigation considered
  - Hextra theme follows semantic HTML standards
  - Navigation accessible via keyboard

**Principle IV - Version Control for Content**:

- [x] Content commit strategy defined
  - Descriptive commit messages required
  - Content changes follow same PR review process as code
- [x] Draft content workflow specified
  - Hugo draft mode via `draft: true` in front matter
  - Drafts not published in production builds
- [x] Breaking content structure changes include migration plan
  - Front matter schema changes documented
  - Migration scripts for bulk content updates

**Deployment Standards**:

- [x] Local build testing procedure defined
  - `hugo server` for local preview
  - `hugo` for production build
  - htmltest for link checking
- [x] Pre-deployment checklist prepared
  - See Pre-Deployment Checklist section below
- [x] Rollback procedure documented
  - GitHub Pages deployment history
  - Git revert for failed deployments

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
# Hugo/Hextra Project Structure
content/
├── _index.md            # Homepage content
└── projects/            # Project showcase pages
    ├── _index.md        # Projects section landing (optional)
    ├── devtoys-mcp.md   # DevToys MCP quickstart
    └── code-standards.md # Code Standards quickstart

static/
├── CNAME                # Custom domain configuration for GitHub Pages
└── images/              # Static image assets

hugo.toml                # Hugo site configuration (or config.toml/config.yaml)
.github/
└── workflows/
    └── deploy.yml       # GitHub Actions CI/CD pipeline

GitVersion.yml           # GitVersion configuration for semantic versioning

themes/
└── hextra/              # Hextra theme (git submodule or Hugo module)

public/                  # Build output (git-ignored, generated by Hugo)
resources/               # Hugo cached resources (git-ignored)
.hugo_build.lock         # Hugo build lock file (git-ignored)
```

**Structure Decision**: Hugo with Hextra theme selected for:
- Fast build times (Go-based, significantly faster than Ruby/Jekyll)
- Hextra theme designed for documentation and project showcases
- Native GitHub Pages support via GitHub Actions
- Modern features (SCSS, image processing, syntax highlighting)
- No Ruby dependency (simpler CI/CD setup)
- Better performance out of the box compared to Jekyll

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

No violations. All constitutional principles are satisfied with the Hugo/Hextra approach.

## Phase 0: Research & Technology Validation

**Status**: ✅ COMPLETE

### Research Findings

**Hugo vs Jekyll Decision**:
- **Decision**: Use Hugo over Jekyll
- **Rationale**: 
  - Faster build times (Go vs Ruby)
  - No Ruby dependency simplifies CI/CD
  - Better out-of-box performance
  - Native image processing
  - Simpler deployment to GitHub Pages via Actions
- **Alternatives considered**: Jekyll (original in constitution), Next.js (too complex for static content), Astro (less mature ecosystem)

**Hextra Theme Selection**:
- **Decision**: Use Hextra theme for Hugo
- **Rationale**:
  - Designed specifically for documentation and project showcases
  - Modern, responsive design
  - Built-in features for navigation, search, dark mode
  - Active maintenance and good documentation
  - Mobile-first approach
- **Alternatives considered**: Hugo Book theme (less polished), Docsy (too enterprise-focused), custom theme (unnecessary complexity)

**GitHub Pages Deployment**:
- **Decision**: Use GitHub Actions for CI/CD
- **Rationale**:
  - Full control over Hugo version
  - Can integrate GitVersion for versioning
  - Can run tests (htmltest, Lighthouse CI, pa11y)
  - CNAME file automatically deployed
- **Alternatives considered**: GitHub Pages native Jekyll build (no Hugo support), Netlify (adds external dependency)

**GitVersion Integration**:
- **Decision**: Use GitVersion for semantic versioning
- **Rationale**:
  - Automated version bumping based on commits
  - Consistent versioning across projects
  - Can embed version in site footer/metadata
- **Implementation**: Run GitVersion in GitHub Actions, inject version into Hugo build

### Technical Decisions

**Configuration Files**:
- `hugo.toml`: Primary configuration file (TOML format recommended for Hugo 0.110+)
- `GitVersion.yml`: Semantic versioning configuration
- `.github/workflows/deploy.yml`: CI/CD pipeline

**Content Organization**:
- Projects in `/content/projects/` directory
- Each project gets own markdown file with front matter
- Homepage in `/content/_index.md`

**Custom Domain Setup**:
- CNAME file in `/static/` directory contains: `www.festina-lente.io`
- DNS A records point apex to GitHub Pages IPs
- DNS CNAME record for www subdomain
- Apex domain redirects to www via DNS configuration

**Build Pipeline**:
1. GitVersion calculates version
2. Hugo builds site with version metadata
3. htmltest validates links and HTML
4. Lighthouse CI runs performance audits
5. Deploy to GitHub Pages (gh-pages branch or docs/ folder)

### Dependencies

**Build Dependencies**:
- Hugo Extended v0.120.0+ (SCSS support required by Hextra)
- GitVersion v5.12.0+
- htmltest v0.17.0+ (HTML/link validation)
- Lighthouse CI v0.12.0+ (performance testing)
- pa11y v6.2.0+ (accessibility testing)

**Theme Dependency**:
- Hextra theme (as Hugo module or git submodule)
- Installation: `hugo mod get github.com/imfing/hextra` or git submodule

**No Runtime Dependencies**:
- Static HTML/CSS/JS output
- No server-side processing
- No JavaScript build step required (Hextra handles all client-side code)

## Phase 1: Design & Contracts

**Status**: ✅ COMPLETE

### Data Model

See [data-model.md](data-model.md) for complete entity definitions.

**Key Entities**:

1. **Project Content**
   - Front matter: `title`, `description`, `repo_url`, `weight`, `draft`
   - Sections: Prerequisites, Installation, Quick Start, Next Steps, Troubleshooting, FAQ, Advanced Usage
   - Location: `/content/projects/{project-name}.md`

2. **Homepage Content**
   - Front matter: `title`, `description`, `layout`
   - Content: Project portfolio overview
   - Location: `/content/_index.md`

3. **Site Configuration**
   - Hugo config: `baseURL`, `title`, `theme`, `params`
   - Hextra params: navigation, colors, features
   - Location: `/hugo.toml`

### API Contracts

See [contracts/](contracts/) directory for complete schemas.

**Hugo Front Matter Schema** (projects):
```yaml
---
title: "Project Name"
description: "Brief project description (50-150 words)"
repo_url: "https://github.com/festina-lente-io/repo-name"
weight: 10  # Display order (lower numbers first)
draft: false
type: "projects"  # Content type
---
```

**Hugo Configuration Schema** (`hugo.toml`):
```toml
baseURL = "https://www.festina-lente.io/"
title = "Festina Lente"
theme = "hextra"

[params]
  description = "Open source project showcase"
  
[params.navbar]
  [[params.navbar.menu]]
    name = "Projects"
    url = "/projects/"
    weight = 1

[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true  # Allow raw HTML in markdown
```

**GitHub Actions Workflow Contract**:
- Trigger: push to main branch, pull request
- Jobs: build, test, deploy
- Artifacts: Hugo public/ directory
- Secrets: GITHUB_TOKEN (automatic)

### Project Quickstart

See [quickstart.md](quickstart.md) for developer onboarding guide.

**Quick Start Summary**:
1. Install Hugo Extended v0.120.0+
2. Clone repository
3. Initialize Hextra theme: `hugo mod get github.com/imfing/hextra`
4. Run local server: `hugo server`
5. Create new project: Add markdown file to `/content/projects/`
6. Build for production: `hugo`
7. Deploy: Push to main (GitHub Actions handles deployment)

### Pre-Deployment Checklist

- [ ] Local Hugo build succeeds: `hugo`
- [ ] Local preview matches expected output: `hugo server`
- [ ] All project pages render correctly
- [ ] Navigation menu includes all project links
- [ ] External links open in new tabs (`target="_blank"`)
- [ ] Images optimized and include alt text
- [ ] Front matter valid on all content files
- [ ] CNAME file present in `/static/` directory
- [ ] GitVersion.yml configured correctly
- [ ] GitHub Actions workflow validated
- [ ] htmltest passes (no broken links)
- [ ] Lighthouse CI meets thresholds (Perf≥90, A11y≥95, BP≥90, SEO≥95)
- [ ] Responsive design tested (320px, 768px, 1024px, 1920px)
- [ ] Keyboard navigation works on all pages
- [ ] Hugo version documented in README

## Phase 2: Task Breakdown

**Status**: PENDING - Run `/speckit.tasks` command to generate task breakdown

This phase is handled by the `/speckit.tasks` command, which will:
1. Read this plan.md and data-model.md
2. Generate tasks.md with prioritized implementation tasks
3. Break down work into granular, actionable items
4. Assign dependencies and effort estimates

**Expected task categories**:
- Repository setup and dependencies
- Hugo configuration and Hextra theme integration
- Content structure and homepage creation
- Project quickstart pages (devtoys-mcp, code-standards)
- GitHub Actions CI/CD pipeline
- GitVersion integration
- Testing setup (htmltest, Lighthouse CI, pa11y)
- Custom domain configuration
- Documentation (README, contributing guidelines)

## Rollback Procedure

If production deployment fails or introduces critical issues:

1. **Immediate Rollback**:
   ```bash
   git revert <commit-sha>
   git push origin main
   ```
   GitHub Actions will automatically redeploy previous version

2. **Content Errors**:
   - Edit problematic content file
   - Commit and push fix
   - GitHub Actions deploys corrected version

3. **Build Failures**:
   - Check GitHub Actions logs
   - Fix configuration or content issue
   - Push fix to main branch

4. **Major Issues**:
   - Revert to last known good commit
   - Create hotfix branch for investigation
   - Document issue and resolution

## Version Management

**GitVersion Configuration**:
- Mode: Mainline (trunk-based development)
- Increment: Patch (default)
- Branches:
  - `main`: production releases (1.x.x)
  - `feature/*`: pre-release versions (1.x.x-feature.1)
- Version displayed in site footer
- Version injected into Hugo build via environment variable

**Version Injection**:
```yaml
# In GitHub Actions workflow
- name: Calculate Version
  uses: gittools/actions/gitversion/execute@v0.10.2
  id: gitversion

- name: Build with Hugo
  env:
    HUGO_VERSION: ${{ steps.gitversion.outputs.semVer }}
  run: hugo --minify
```

**Hugo Template Usage**:
```html
<!-- layouts/partials/footer.html -->
<footer>
  <p>Version {{ getenv "HUGO_VERSION" }}</p>
</footer>
```

## Notes

- Constitution adapted from Jekyll/Minimal Mistakes to Hugo/Hextra
- Core principles remain unchanged, implementation details updated
- Hugo chosen for performance and simplicity over Jekyll
- Hextra theme provides all required features out-of-box
- GitVersion ensures consistent semantic versioning
- Full CI/CD pipeline with quality gates (tests, audits)
- Custom domain (www.festina-lente.io) configured via CNAME file
