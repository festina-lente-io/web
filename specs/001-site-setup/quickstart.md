# Developer Quickstart: Project Showcase Website

**Feature**: Project Showcase Website
**Technology Stack**: Hugo + Hextra + GitHub Pages
**Last Updated**: 2025-12-25

## Prerequisites

### Option 1: Docker (Recommended - No Hugo Installation Required)

- **Docker Desktop** 20.10+
  - Download: https://www.docker.com/products/docker-desktop
  - Windows: Install Docker Desktop for Windows
  - macOS: Install Docker Desktop for Mac
  - Linux: Install Docker Engine
  - Verify: `docker --version` and `docker-compose --version`

- **Git** v2.30+
  - For version control and GitHub integration

- **Text Editor**
  - VS Code recommended
  - Or any Markdown-capable editor

### Option 2: Native Hugo

- **Hugo Extended** v0.120.0 or higher
  - Download: https://github.com/gohugoio/hugo/releases
  - Windows: `winget install Hugo.Hugo.Extended`
  - macOS: `brew install hugo`
  - Linux: `snap install hugo --channel=extended`
  - Verify: `hugo version` (must say "extended")

- **Git** v2.30+
  - For version control and GitHub integration

- **Text Editor**
  - VS Code recommended with extensions:
    - Hugo Language and Syntax Support
    - Markdown All in One
  - Or any Markdown-capable editor

- **GitHub Account**
  - For CI/CD and GitHub Pages hosting
  - Write access to `festina-lente-io/web` repository

## Installation

### 1. Clone Repository

```bash
git clone https://github.com/festina-lente-io/web.git
cd web
```

### 2. Checkout Feature Branch

```bash
git checkout 001-site-setup
```

### 3. Initialize Hugo Module (Hextra Theme)

**Option A: Hugo Modules** (Recommended)
```bash
hugo mod init github.com/festina-lente-io/web
hugo mod get github.com/imfing/hextra
```

**Option B: Git Submodule** (Alternative)
```bash
git submodule add https://github.com/imfing/hextra.git themes/hextra
git submodule update --init --recursive
```

### 4. Verify Installation

```bash
hugo version
# Should show: hugo v0.120.0+ extended ...

hugo mod graph
# Should show: github.com/imfing/hextra
```

## Quick Start

### Option 1: Docker (No Hugo Installation Required)

**Windows PowerShell Helper:**
```powershell
.\run.ps1
# Select option 1 to start server
```

**Manual Docker Commands:**
```bash
# Build Docker image
docker-compose build

# Start Hugo server (available at http://localhost:1313)
docker-compose up

# Stop server
docker-compose down
```

The Docker container:
- Uses Hugo Extended v0.120.4
- Mounts current directory as /src
- Exposes port 1313
- Auto-rebuilds on file changes
- No local Hugo installation needed

### Option 2: Native Hugo

**Windows PowerShell Helper:**
```powershell
.\run.ps1
# Select option 3 to start native server
```

**Manual Hugo Command:**
```bash
hugo server --buildDrafts
```

- Open browser: http://localhost:1313
- Live reload enabled (auto-refresh on file changes)
- Drafts visible in development mode

### Project Structure Overview

```
web/
├── content/
│   ├── _index.md              # Homepage
│   └── projects/              # Project showcase pages
│       ├── devtoys-mcp.md     # DevToys MCP quickstart
│       └── code-standards.md  # Code Standards quickstart
├── static/
│   ├── CNAME                  # Custom domain: www.festina-lente.io
│   └── images/                # Static assets
├── hugo.toml                  # Site configuration
├── GitVersion.yml             # Semantic versioning config
└── .github/
    └── workflows/
        └── deploy.yml         # CI/CD pipeline
```

### Create New Project Page

1. **Create markdown file**:
```bash
hugo new content/projects/my-new-project.md
```

2. **Edit front matter**:
```markdown
---
title: "My New Project"
description: "Brief description of the project (50-150 words)"
repo_url: "https://github.com/festina-lente-io/my-new-project"
weight: 30
draft: false
date: 2025-12-25
type: "projects"
---
```

3. **Add content sections**:
```markdown
## Prerequisites

List of requirements...

## Installation

Step-by-step installation...

## Quick Start

Getting started guide...

## Next Steps

What to do after installation...

## Troubleshooting

Common issues and solutions...

## FAQ

Frequently asked questions...

## Advanced Usage

Advanced features and examples...
```

4. **Preview locally**:
```bash
hugo server
```

5. **Commit and push**:
```bash
git add content/projects/my-new-project.md
git commit -m "Add quickstart for my-new-project"
git push origin 001-site-setup
```

### Build for Production

```bash
hugo --minify
```

Output: `public/` directory (git-ignored)

## Configuration

### Site Configuration (`hugo.toml`)

```toml
baseURL = "https://www.festina-lente.io/"
title = "Festina Lente"
theme = "hextra"
languageCode = "en-us"
enableRobotsTXT = true
enableGitInfo = true

[params]
  description = "Open source projects for developers"
  author = "Festina Lente"

[params.navbar]
  [[params.navbar.menu]]
    name = "Home"
    url = "/"
    weight = 1
    
  [[params.navbar.menu]]
    name = "Projects"
    url = "/projects/"
    weight = 2

[params.footer]
  copyright = "© 2025 Festina Lente"

[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true  # Allow raw HTML in markdown

[module]
  [[module.imports]]
    path = "github.com/imfing/hextra"
```

### GitVersion Configuration (`GitVersion.yml`)

```yaml
mode: Mainline
branches:
  main:
    tag: ''
    increment: Patch
  feature:
    tag: 'feature'
    increment: Minor
    is-mainline: false
```

### GitHub Actions Workflow (`.github/workflows/deploy.yml`)

```yaml
name: Deploy Hugo Site

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

env:
  HUGO_VERSION: "0.120.0"

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          submodules: true
          fetch-depth: 0  # Required for GitVersion
          
      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: ${{ env.HUGO_VERSION }}
          extended: true
          
      - name: Install GitVersion
        uses: gittools/actions/gitversion/setup@v0.10.2
        with:
          versionSpec: '5.x'
          
      - name: Determine Version
        id: gitversion
        uses: gittools/actions/gitversion/execute@v0.10.2
        
      - name: Build Hugo Site
        env:
          HUGO_VERSION_TAG: ${{ steps.gitversion.outputs.semVer }}
        run: hugo --minify
        
      - name: Test HTML
        run: |
          curl -s https://htmltest.wjdp.uk | bash
          ./bin/htmltest
          
      - name: Deploy to GitHub Pages
        if: github.ref == 'refs/heads/main'
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
          cname: www.festina-lente.io
```

## Testing

### Local Testing

```bash
# Build site
hugo --minify

# Validate links (install htmltest first)
htmltest
```

### Run Tests in CI/CD

Tests run automatically on:
- Push to `main` branch
- Pull requests to `main` branch

**Test Suite**:
1. HTML validation (htmltest)
2. Link checking (htmltest)
3. Performance audit (Lighthouse CI)
4. Accessibility testing (pa11y)

### Manual Testing Checklist

Before pushing changes:

- [ ] Local build succeeds: `hugo`
- [ ] Local preview looks correct: `hugo server`
- [ ] All project pages render
- [ ] Navigation menu works
- [ ] External links open in new tabs
- [ ] Images load and have alt text
- [ ] Mobile responsive (test in browser DevTools)
- [ ] No console errors
- [ ] Front matter valid YAML
- [ ] All 7 sections present in quickstart pages

## Deployment

### Automatic Deployment (Recommended)

1. Push to `main` branch:
```bash
git push origin main
```

2. GitHub Actions automatically:
   - Builds site with Hugo
   - Runs tests
   - Deploys to GitHub Pages
   - Updates www.festina-lente.io

3. Check deployment status:
   - Go to repository → Actions tab
   - View workflow run logs

### Manual Deployment (Not Recommended)

Only if GitHub Actions unavailable:

```bash
# Build site
hugo --minify

# Deploy to gh-pages branch
git checkout gh-pages
cp -r public/* .
git add .
git commit -m "Deploy site"
git push origin gh-pages
git checkout main
```

## Troubleshooting

### Issue: "hugo: command not found"

**Solution**: Install Hugo Extended
```bash
# Windows
winget install Hugo.Hugo.Extended

# macOS
brew install hugo

# Linux
snap install hugo --channel=extended
```

### Issue: "Theme not found: hextra"

**Solution**: Initialize Hugo modules
```bash
hugo mod init github.com/festina-lente-io/web
hugo mod get github.com/imfing/hextra
hugo mod tidy
```

### Issue: Build fails with "extended version required"

**Solution**: Install Hugo Extended (not regular Hugo)
```bash
hugo version
# Should show "extended"
```

### Issue: Local server doesn't show changes

**Solution**: Hard refresh browser (Ctrl+Shift+R or Cmd+Shift+R)
Or restart server:
```bash
hugo server --disableFastRender
```

### Issue: GitHub Pages shows 404

**Solutions**:
1. Check CNAME file exists: `static/CNAME`
2. Verify GitHub Pages settings:
   - Repository → Settings → Pages
   - Source: Deploy from a branch (gh-pages)
   - Custom domain: www.festina-lente.io
3. Check DNS configuration (may take 24-48 hours)
4. Verify GitHub Actions deployment succeeded

### Issue: CSS/styling broken on GitHub Pages

**Solution**: Check `baseURL` in `hugo.toml`
```toml
baseURL = "https://www.festina-lente.io/"
# Must end with /
```

### Issue: GitVersion fails in CI/CD

**Solution**: Ensure full git history
```yaml
- uses: actions/checkout@v4
  with:
    fetch-depth: 0  # Required for GitVersion
```

## FAQ

### Q: How do I add a new project?

**A**: Create a new markdown file in `content/projects/` with proper front matter and 7 required sections. See "Create New Project Page" above.

### Q: How do I change the site title or description?

**A**: Edit `hugo.toml`:
```toml
title = "New Site Title"
[params]
  description = "New site description"
```

### Q: How do I customize the theme colors?

**A**: Create `/assets/css/custom.css` and override Hextra CSS variables. See Hextra documentation for available variables.

### Q: Can I preview drafts?

**A**: Yes, run `hugo server --buildDrafts` or set `draft: false` in front matter.

### Q: How do I update the Hextra theme?

**A**:
```bash
hugo mod get -u github.com/imfing/hextra
hugo mod tidy
```

### Q: Where do I put images?

**A**: Place in `static/images/` directory. Reference in markdown as `/images/filename.jpg`.

### Q: How do I check the site version?

**A**: Version displayed in site footer (injected by GitVersion during build).

### Q: Docker container won't start?

**A**: 
```bash
# Check Docker is running
docker --version

# Rebuild container
docker-compose down
docker-compose build --no-cache
docker-compose up

# View logs
docker-compose logs
```

### Q: Port 1313 already in use?

**A**: 
```bash
# Windows - find and kill process on port 1313
netstat -ano | findstr :1313
taskkill /PID <pid> /F

# Or change port in docker-compose.yml
ports:
  - "3000:1313"  # Use http://localhost:3000 instead
```

### Q: Files not updating in Docker?

**A**: File watching works automatically. If not:
- Ensure volume mount is correct in docker-compose.yml
- Try adding `--disableFastRender` flag to CMD in Dockerfile
- Rebuild: `docker-compose down && docker-compose up --build`

### Q: Should I use Docker or native Hugo?

**A**: 
- **Docker**: Consistent environment, no Hugo installation, easier for Windows
- **Native Hugo**: Faster builds, lower resource usage, better for development
- Both work identically - choose based on your preference

## Advanced Usage

### Custom Layouts

Override Hextra templates by creating matching files in `/layouts/`:

```
layouts/
├── partials/
│   ├── head-custom.html      # Custom <head> content
│   └── footer-custom.html    # Custom footer
└── _default/
    └── baseof.html           # Base template override
```

### Custom CSS

Create `/assets/css/custom.css`:
```css
:root {
  --primary-color: #1a1a1a;
  --accent-color: #0066cc;
}

.custom-class {
  /* Your styles */
}
```

Reference in custom head partial.

### Custom JavaScript

Create `/assets/js/custom.js`:
```javascript
// Custom JavaScript
console.log('Custom script loaded');
```

Enqueue in custom head partial.

### Environment-Specific Configuration

Create environment configs:
- `hugo.toml` (default)
- `hugo.production.toml` (production overrides)
- `hugo.development.toml` (dev overrides)

Build with environment:
```bash
hugo --environment production
```

### Content Organization

For larger sites, organize projects by category:
```
content/
└── projects/
    ├── tools/
    │   ├── _index.md
    │   └── devtoys-mcp.md
    └── standards/
        ├── _index.md
        └── code-standards.md
```

### Shortcodes

Create reusable content snippets:

`/layouts/shortcodes/github-button.html`:
```html
<a href="{{ .Get "url" }}" target="_blank" class="github-button">
  View on GitHub
</a>
```

Usage in markdown:
```markdown
{{< github-button url="https://github.com/festina-lente-io/repo" >}}
```

## Next Steps

After completing initial setup:

1. **Content Creation**: Write comprehensive quickstart guides for devtoys-mcp and code-standards
2. **Customization**: Adjust Hextra theme colors, fonts, and layout
3. **DNS Configuration**: Set up custom domain DNS records
4. **Monitoring**: Add analytics (Google Analytics, Plausible, etc.)
5. **Optimization**: Optimize images, add lazy loading
6. **SEO**: Enhance meta tags, add structured data
7. **Accessibility**: Run pa11y audits, fix issues

## Resources

- **Hugo Documentation**: https://gohugo.io/documentation/
- **Hextra Theme Docs**: https://imfing.github.io/hextra/
- **GitHub Pages Docs**: https://docs.github.com/en/pages
- **GitVersion Docs**: https://gitversion.net/docs/
- **Markdown Guide**: https://www.markdownguide.org/

## Support

- **Issues**: https://github.com/festina-lente-io/web/issues
- **Discussions**: https://github.com/festina-lente-io/web/discussions
- **Hextra Issues**: https://github.com/imfing/hextra/issues
