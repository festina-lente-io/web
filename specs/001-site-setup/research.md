# Research: Project Showcase Website

**Feature**: Project Showcase Website
**Created**: 2025-12-25
**Status**: Complete

## Technology Stack Decisions

### Static Site Generator: Hugo

**Decision**: Use Hugo over Jekyll and other alternatives

**Rationale**:
- **Performance**: Hugo builds are 10-50x faster than Jekyll (Go vs Ruby)
- **No Runtime Dependencies**: Single binary, no Ruby/gem management
- **Native Features**: Built-in image processing, SCSS compilation, minification
- **GitHub Pages Compatible**: Works via GitHub Actions with full control
- **Active Development**: Regular updates, large community, excellent documentation
- **Developer Experience**: Fast live reload, clear error messages

**Alternatives Considered**:

1. **Jekyll** (Original in constitution)
   - ❌ Slower build times (Ruby-based)
   - ❌ Requires Ruby/Bundler setup
   - ✅ Native GitHub Pages support
   - ❌ Plugin limitations on GitHub Pages
   - **Rejected**: Performance and deployment complexity

2. **Next.js** (React-based)
   - ✅ Modern, popular framework
   - ✅ Excellent developer experience
   - ❌ Overkill for static content showcase
   - ❌ JavaScript build complexity
   - ❌ Larger bundle sizes
   - **Rejected**: Too complex for the use case

3. **Astro** (Multi-framework)
   - ✅ Modern, fast, minimal JavaScript
   - ✅ Component-based architecture
   - ❌ Newer ecosystem, less mature
   - ❌ Smaller community and theme selection
   - **Rejected**: Risk of ecosystem immaturity

4. **11ty** (JavaScript-based)
   - ✅ Flexible, JavaScript ecosystem
   - ✅ Good performance
   - ❌ Less opinionated (more decisions needed)
   - ❌ Fewer documentation themes
   - **Rejected**: Hugo's opinionated approach better for this use case

### Theme: Hextra

**Decision**: Use Hextra theme for Hugo

**Rationale**:
- **Purpose-Built**: Designed for documentation and project showcases
- **Modern Design**: Clean, professional, mobile-first
- **Feature-Rich**: Navigation, search, dark mode, syntax highlighting
- **Responsive**: Excellent mobile, tablet, desktop support
- **Performance**: Optimized CSS/JS, fast page loads
- **Active Maintenance**: Regular updates, responsive maintainer
- **Documentation**: Clear setup guides and customization docs

**Alternatives Considered**:

1. **Hugo Book Theme**
   - ✅ Documentation-focused
   - ❌ Less polished design
   - ❌ Fewer features out-of-box
   - **Rejected**: Hextra more feature-complete

2. **Docsy Theme**
   - ✅ Mature, well-documented
   - ❌ Enterprise-focused (too heavy)
   - ❌ Bootstrap-based (larger CSS)
   - **Rejected**: Overkill for small project showcase

3. **Hugo Clarity Theme**
   - ✅ Clean, modern design
   - ❌ Blog-focused (not documentation)
   - ❌ Less suitable for technical content
   - **Rejected**: Not optimized for quickstart guides

4. **Custom Theme**
   - ✅ Full control
   - ❌ Development time
   - ❌ Maintenance burden
   - ❌ Reinventing wheel
   - **Rejected**: Hextra provides all needed features

### Hosting: GitHub Pages with GitHub Actions

**Decision**: Deploy to GitHub Pages via GitHub Actions CI/CD

**Rationale**:
- **Zero Cost**: Free for public repositories
- **Custom Domain**: Supports custom domains with SSL
- **Version Control**: Deployment tied to git history
- **Full Control**: GitHub Actions allows custom Hugo version
- **Testing Integration**: Run tests before deployment
- **GitVersion Support**: Can integrate semantic versioning
- **Rollback**: Easy to revert via git

**Alternatives Considered**:

1. **GitHub Pages Native Jekyll Build**
   - ✅ Zero configuration
   - ❌ Jekyll-only (no Hugo)
   - ❌ Limited plugin support
   - **Rejected**: Hugo requirement

2. **Netlify**
   - ✅ Excellent Hugo support
   - ✅ Easy setup, good UI
   - ❌ External dependency
   - ❌ Free tier limits
   - **Rejected**: GitHub Actions provides equivalent functionality

3. **Vercel**
   - ✅ Fast deployments
   - ✅ Good Hugo support
   - ❌ External dependency
   - ❌ Overkill for static site
   - **Rejected**: GitHub Actions sufficient

4. **Cloudflare Pages**
   - ✅ Fast global CDN
   - ✅ Hugo support
   - ❌ External dependency
   - ❌ Another service to manage
   - **Rejected**: GitHub Pages simpler for GitHub-hosted repos

## Versioning: GitVersion

**Decision**: Use GitVersion for semantic versioning

**Rationale**:
- **Automated**: Calculates version from git history
- **Conventional**: Follows semantic versioning (SemVer)
- **CI/CD Integration**: Works seamlessly with GitHub Actions
- **Zero Maintenance**: No manual version bumping
- **Consistent**: Same versioning across all Festina Lente projects
- **Traceable**: Version tied to git commits

**Implementation**:
- GitVersion runs in GitHub Actions before Hugo build
- Version injected into Hugo build as environment variable
- Displayed in site footer and meta tags
- Branch-based versioning: main = releases, feature/* = pre-releases

**Alternatives Considered**:
1. **Manual versioning**: ❌ Error-prone, forgotten updates
2. **Package.json version**: ❌ Not applicable to Hugo/static site
3. **Git tags only**: ❌ Requires manual tagging, no automation

## Best Practices Research

### Hugo Static Site Best Practices

1. **Content Organization**:
   - Use Hugo's content organization (sections, taxonomies)
   - Front matter schema consistency
   - Logical directory structure mirroring site hierarchy

2. **Performance**:
   - Minify HTML/CSS/JS in production builds
   - Optimize images (WebP with fallbacks)
   - Lazy load images below the fold
   - Use Hugo's asset pipeline for CSS/JS

3. **SEO**:
   - Descriptive front matter (title, description)
   - Open Graph and Twitter Card meta tags
   - Sitemap.xml (Hugo generates automatically)
   - Robots.txt configuration
   - Semantic HTML structure

4. **Accessibility**:
   - Proper heading hierarchy (h1 → h6)
   - Alt text for all images
   - ARIA labels where needed
   - Keyboard navigation support
   - Color contrast ratios (WCAG AA minimum)

5. **Build Optimization**:
   - Use Hugo modules for theme management
   - Avoid deeply nested partials
   - Cache-bust assets via fingerprinting
   - Configure cache directories

### GitHub Pages with Custom Domain

**DNS Configuration**:
1. **Apex Domain (festina-lente.io)**:
   - A records pointing to GitHub Pages IPs:
     - 185.199.108.153
     - 185.199.109.153
     - 185.199.110.153
     - 185.199.111.153

2. **WWW Subdomain (www.festina-lente.io)**:
   - CNAME record: `www.festina-lente.io` → `festina-lente-io.github.io`

3. **CNAME File**:
   - Located at `/static/CNAME`
   - Contents: `www.festina-lente.io` (single line)
   - Hugo copies to `/public/CNAME` during build

4. **GitHub Repository Settings**:
   - Enable GitHub Pages
   - Source: GitHub Actions deployment
   - Custom domain: `www.festina-lente.io`
   - Enforce HTTPS: Enabled

### Hextra Theme Customization

**Configuration Options**:
- Navigation menu structure
- Color scheme customization
- Logo and favicon
- Footer content
- Social links
- Search functionality
- Dark mode toggle

**Custom Overrides**:
- Create `/layouts/` directory to override theme templates
- Custom CSS in `/assets/css/custom.css`
- Custom JavaScript in `/assets/js/custom.js`
- Override partials: `/layouts/partials/{partial-name}.html`

### Testing Strategy

1. **Link Validation**: htmltest
   - Checks internal and external links
   - Validates HTML structure
   - Detects broken images

2. **Accessibility**: pa11y
   - WCAG 2.1 AA compliance
   - Color contrast checking
   - Semantic HTML validation

3. **Performance**: Lighthouse CI
   - Performance score ≥90
   - Accessibility score ≥95
   - Best practices score ≥90
   - SEO score ≥95

4. **Visual Regression** (Optional for future):
   - Percy or BackstopJS
   - Screenshot comparison
   - Responsive design validation

## Integration Patterns

### Hugo + GitVersion Integration

```yaml
# .github/workflows/deploy.yml
- name: Install GitVersion
  uses: gittools/actions/gitversion/setup@v0.10.2
  with:
    versionSpec: '5.x'

- name: Determine Version
  uses: gittools/actions/gitversion/execute@v0.10.2
  id: gitversion

- name: Build Hugo Site
  env:
    HUGO_VERSION: ${{ steps.gitversion.outputs.semVer }}
  run: hugo --minify
```

### Hugo + Hextra Integration

```toml
# hugo.toml
[module]
  [[module.imports]]
    path = "github.com/imfing/hextra"
```

Or via git submodule:
```bash
git submodule add https://github.com/imfing/hextra.git themes/hextra
```

### GitHub Actions + GitHub Pages Integration

```yaml
- name: Deploy to GitHub Pages
  uses: peaceiris/actions-gh-pages@v3
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    publish_dir: ./public
    cname: www.festina-lente.io
```

## Unknowns Resolved

All technical unknowns from the specification phase have been resolved:

1. ✅ **Static site generator choice**: Hugo
2. ✅ **Theme selection**: Hextra
3. ✅ **Hosting approach**: GitHub Pages via GitHub Actions
4. ✅ **Versioning strategy**: GitVersion
5. ✅ **Custom domain setup**: DNS A + CNAME records, CNAME file
6. ✅ **Testing approach**: htmltest, Lighthouse CI, pa11y
7. ✅ **Build pipeline**: GitHub Actions with quality gates
8. ✅ **Content organization**: Hugo content directory structure
9. ✅ **Configuration management**: Single `hugo.toml` file
10. ✅ **Performance optimization**: Hugo minification, image processing

## Dependencies and Prerequisites

### Development Environment

- **Hugo Extended** v0.120.0+
  - Download from: https://github.com/gohugoio/hugo/releases
  - Windows: `winget install Hugo.Hugo.Extended` or Chocolatey
  - macOS: `brew install hugo`
  - Linux: `snap install hugo --channel=extended`

- **Git** v2.30+
  - For version control and submodules

- **Text Editor**
  - VS Code with Hugo syntax extension recommended
  - Or any Markdown-capable editor

### CI/CD Dependencies (GitHub Actions)

- GitVersion v5.12.0+
- htmltest v0.17.0+
- Lighthouse CI v0.12.0+
- pa11y v6.2.0+
- Hugo Extended v0.120.0+ (same as development)

### DNS Configuration (External)

- Access to domain registrar/DNS provider
- Ability to create A and CNAME records
- DNS propagation time (24-48 hours typically)

## Risk Mitigation

### Potential Risks and Mitigations

1. **Hugo Version Incompatibility**
   - Risk: Hugo updates break builds
   - Mitigation: Pin Hugo version in GitHub Actions
   - Mitigation: Test Hugo upgrades in feature branches

2. **Hextra Theme Breaking Changes**
   - Risk: Theme updates break customizations
   - Mitigation: Use Hugo modules with version pinning
   - Mitigation: Test theme updates before deploying
   - Mitigation: Document custom overrides

3. **GitHub Pages Downtime**
   - Risk: Hosting unavailable
   - Mitigation: GitHub Pages has 99.9% uptime SLA
   - Mitigation: Static content cached by CDN
   - Mitigation: Alternative: Netlify/Vercel migration possible

4. **DNS Configuration Errors**
   - Risk: Custom domain misconfigured
   - Mitigation: Document exact DNS records
   - Mitigation: Use GitHub's DNS check tool
   - Mitigation: Test with DNS propagation checker

5. **Build Time Increases**
   - Risk: Site grows, builds slow down
   - Mitigation: Hugo is fast (1000 pages < 10 seconds)
   - Mitigation: Optimize images, reduce asset processing
   - Mitigation: Use Hugo's incremental builds

## Conclusion

All research phases complete. Technology stack validated:
- **Hugo + Hextra**: Proven, performant, well-documented
- **GitHub Pages + Actions**: Zero-cost, reliable, integrated
- **GitVersion**: Automated versioning, zero maintenance
- **Testing Suite**: Comprehensive quality gates

Ready to proceed to Phase 1 (Design & Contracts).
