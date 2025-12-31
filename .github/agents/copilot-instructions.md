````chatagent
# web Development Guidelines

Auto-generated from all feature plans. Last updated: 2025-12-25

## Active Technologies

- **Static Site Generator**: Hugo Extended v0.120.0+ (Go-based)
- **Theme**: Hextra (modern documentation theme)
- **Go Version**: Go 1.21+
- **Build Tool**: Hugo CLI
- **Hosting**: GitHub Pages
- **CI/CD**: GitHub Actions workflow
- **Versioning**: GitVersion 5.x for semantic versioning
- **Content Format**: Markdown with YAML front matter
- **Testing**: htmltest (link validation), Lighthouse CI (performance), pa11y (accessibility)
- **Custom Domain**: www.festina-lente.io

## Project Structure

```text
content/
├── _index.md            # Homepage content
└── projects/            # Project showcase pages
    ├── devtoys-mcp.md   # DevToys MCP quickstart
    └── code-standards.md # Code Standards quickstart

static/
├── CNAME                # Custom domain configuration
└── images/              # Static image assets

hugo.toml                # Hugo site configuration
GitVersion.yml           # Semantic versioning configuration

.github/
└── workflows/
    └── deploy.yml       # CI/CD pipeline

themes/
└── hextra/              # Hextra theme (Hugo module or git submodule)

specs/                   # Feature specifications (excluded from build)
public/                  # Build output (git-ignored)
resources/               # Hugo cached resources (git-ignored)
.hugo_build.lock         # Hugo build lock file (git-ignored)
```

## Commands

# Development
hugo server                          # Start local dev server (http://localhost:1313)
hugo server --buildDrafts            # Include draft content
hugo server --disableFastRender      # Disable fast render (full rebuild)

# Build
hugo                                 # Build site to public/
hugo --minify                        # Build with minification
hugo --environment production        # Build for production

# Testing
htmltest                             # Check HTML and links (after installing htmltest)
pa11y http://localhost:1313          # Accessibility testing (requires Node.js pa11y)

# Module Management
hugo mod init github.com/festina-lente-io/web  # Initialize Hugo module
hugo mod get github.com/imfing/hextra          # Get Hextra theme
hugo mod get -u                                # Update all modules
hugo mod tidy                                  # Clean unused modules
hugo mod graph                                 # Show module dependency graph

## Code Style

**Markdown**:
- Use consistent heading hierarchy (# → ## → ###)
- Include blank lines between sections
- Use fenced code blocks with language specifiers
- Follow Hextra theme conventions for callouts and components

**YAML/Front Matter**:
- Consistent indentation (2 spaces)
- Quote strings with special characters
- Document all non-obvious fields with inline comments
- Follow schemas in specs/*/contracts/

**Project Content**:
- Project files in `content/projects/` must include: title, description, repo_url, weight
- All project quickstart guides must have seven standardized sections (Prerequisites, Installation, Quick Start, Next Steps, Troubleshooting, FAQ, Advanced Usage)
- Use descriptive filenames matching project slugs

**Configuration**:
- All `hugo.toml` changes require inline comments (Constitution Principle II adapted)
- Test locally before committing
- Hugo config changes apply immediately (no restart needed)

**Images**:
- Optimize before committing (<50KB for thumbnails, <200KB for headers)
- Always include alt text for accessibility
- Store in `static/images/`
- Use absolute paths starting with `/images/`
- Hugo can process images automatically (use page bundles for advanced features)

**Navigation**:
- Configure in `hugo.toml` under `[params.navbar.menu]`
- Maintain logical order using `weight` parameter
- Keep titles concise (1-30 characters)
- Mark external links with `external = true`

## Testing Requirements

**Pre-commit Checks**:
- [ ] Local build succeeds: `hugo`
- [ ] Local preview looks correct: `hugo server`
- [ ] All project pages render
- [ ] Navigation menu works
- [ ] No console errors in browser
- [ ] Front matter YAML is valid

**CI/CD Quality Gates**:
- htmltest: No broken links
- Lighthouse CI: Performance ≥90, Accessibility ≥95, Best Practices ≥90, SEO ≥95
- pa11y: WCAG 2.1 AA compliance
- Responsive design: Works on 320px, 768px, 1024px, 1920px viewports

## Deployment Workflow

1. **Feature Development**: Work in feature branches
2. **Local Testing**: `hugo server` for preview
3. **Commit**: Push changes to feature branch
4. **PR**: Create pull request to main
5. **CI Tests**: GitHub Actions runs tests automatically
6. **Review**: Peer review required
7. **Merge**: Merge to main triggers deployment
8. **Deploy**: GitHub Actions builds and deploys to GitHub Pages
9. **Verify**: Check https://www.festina-lente.io

## Common Tasks

### Add New Project

1. Create file: `content/projects/project-name.md`
2. Add front matter:
```yaml
---
title: "Project Name"
description: "Brief description (50-150 words)"
repo_url: "https://github.com/festina-lente-io/project-name"
weight: 30
draft: false
---
```
3. Add seven required sections
4. Test locally: `hugo server`
5. Commit and push

### Update Hextra Theme

```bash
hugo mod get -u github.com/imfing/hextra
hugo mod tidy
hugo server  # Test locally
```

### Customize Theme

Create files in `/layouts/` to override theme templates:
- `/layouts/partials/head-custom.html`: Custom <head> content
- `/layouts/partials/footer-custom.html`: Custom footer
- `/assets/css/custom.css`: Custom CSS

### Version Management

GitVersion automatically calculates version from git history:
- Commits to main → patch version increment (1.0.0 → 1.0.1)
- Feature branches → pre-release tags (1.0.1-feature.1)
- Version displayed in site footer

## Constitution Compliance

**Adapted from Jekyll Constitution for Hugo**:

1. **Content-First Development**: Markdown is source of truth, consistent front matter
2. **Configuration as Code**: Single `hugo.toml`, documented with comments
3. **Performance & Accessibility**: Lighthouse scores ≥90/95/90/95, responsive design
4. **Version Control**: Descriptive commits, draft workflow, migration plans for breaking changes

## Recent Changes

**2025-12-25**: Initial Hugo site setup with Hextra theme
- Migrated from Jekyll to Hugo for better performance
- Selected Hextra theme for modern documentation UX
- Set up GitHub Actions CI/CD with GitVersion
- Configured custom domain (www.festina-lente.io)

<!-- MANUAL ADDITIONS START -->
<!-- MANUAL ADDITIONS END -->

````
