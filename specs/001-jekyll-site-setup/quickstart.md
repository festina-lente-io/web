# Developer Quickstart: Jekyll Site Setup

**Feature**: Jekyll Website with Project Showcase  
**Branch**: `001-jekyll-site-setup`  
**Last Updated**: 2025-12-25

## Overview

This guide helps developers set up a local development environment for the Festina Lente Jekyll website, make changes, and deploy to GitHub Pages.

## Prerequisites

Before you begin, ensure you have:

- **Ruby**: Version 2.7.4 or compatible with GitHub Pages
  - Check: `ruby --version`
  - Install via [rbenv](https://github.com/rbenv/rbenv) (recommended) or [RVM](https://rvm.io/)
- **Bundler**: Ruby gem manager
  - Install: `gem install bundler`
- **Git**: Version control
  - Check: `git --version`
- **Text Editor**: VS Code, Sublime, vim, etc.
- **GitHub Account**: With access to festina-lente-io organization

### Optional (Recommended):
- **Node.js** 18+: For testing tools (html-proofer alternatives)
- **rbenv** or **RVM**: For managing Ruby versions

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/festina-lente-io/web.git
cd web
```

### 2. Switch to Feature Branch

```bash
git checkout 001-jekyll-site-setup
```

Or create a new feature branch:

```bash
git checkout -b 002-your-feature-name
```

### 3. Install Ruby Dependencies

```bash
bundle install
```

This reads `Gemfile` and installs:
- Jekyll (GitHub Pages version)
- Minimal Mistakes theme
- Required plugins (jekyll-feed, jekyll-seo-tag, etc.)

**Troubleshooting**:
- If `bundle install` fails, ensure Ruby 2.7.4 is active: `ruby --version`
- On macOS, may need Xcode command line tools: `xcode-select --install`
- On Linux, may need Ruby dev headers: `sudo apt-get install ruby-dev`

### 4. Verify Installation

```bash
bundle exec jekyll --version
```

Expected output: `jekyll 3.9.5` (or GitHub Pages default version)

## Quick Start

### Start Local Development Server

```bash
bundle exec jekyll serve
```

**What this does**:
- Builds the site to `_site/` directory
- Starts local web server on http://localhost:4000
- Watches for file changes and rebuilds automatically
- Live reload enabled (browser auto-refreshes on changes)

**Options**:
```bash
# Custom port
bundle exec jekyll serve --port 4001

# Don't watch for changes
bundle exec jekyll serve --no-watch

# Show future-dated posts
bundle exec jekyll serve --future

# Include drafts
bundle exec jekyll serve --drafts

# Incremental build (faster for large sites)
bundle exec jekyll serve --incremental
```

### View the Site

Open browser to: http://localhost:4000

You should see:
- Homepage with splash layout
- Project feature rows (if projects exist in `_projects/`)
- Navigation menu
- Minimal Mistakes "contrast" theme

### Make Your First Change

1. **Edit homepage**:
   ```bash
   # Open in your editor
   code index.md
   ```

2. **Modify title or content**:
   ```yaml
   ---
   title: "My New Title"
   ---
   ```

3. **Save file** → Jekyll automatically rebuilds → Browser refreshes

4. **View changes** at http://localhost:4000

## Project Structure

```
web/
├── _config.yml          # Site configuration (see contracts/config-schema.yml)
├── _data/
│   └── navigation.yml   # Navigation menu (see contracts/navigation-schema.yml)
├── _projects/           # Project collection items
│   ├── devtoys-mcp.md   # Example project
│   └── code-standards.md
├── assets/
│   ├── css/             # Custom stylesheets (if needed)
│   ├── js/              # Custom JavaScript (if needed)
│   └── images/          # Image assets
├── index.md             # Homepage (splash layout)
├── CNAME                # Custom domain config
├── Gemfile              # Ruby dependencies
├── Gemfile.lock         # Locked versions
├── specs/               # Feature specifications (not built to site)
└── _site/               # Generated site (git-ignored)
```

## Common Tasks

### Add a New Project

1. **Create project file**:
   ```bash
   touch _projects/my-new-project.md
   ```

2. **Add front matter** (see `contracts/project-schema.md`):
   ```yaml
   ---
   title: "My New Project"
   description: "Brief description of what this project does."
   repo_url: "https://github.com/festina-lente-io/my-new-project"
   order: 3
   ---
   
   ## Prerequisites
   
   [Project prerequisites here]
   
   ## Installation
   
   [Installation steps here]
   
   ## Quick Start
   
   [Quick start guide here]
   
   ## Next Steps
   
   [Next steps here]
   
   ## Troubleshooting
   
   [Common issues here]
   
   ## FAQ
   
   [Frequently asked questions here]
   
   ## Advanced Usage
   
   [Advanced topics here]
   ```

3. **Add to navigation** (`_data/navigation.yml`):
   ```yaml
   main:
     - title: "Home"
       url: "/"
     - title: "My New Project"
       url: "/projects/my-new-project/"
   ```

4. **Test locally**:
   ```bash
   bundle exec jekyll serve
   ```

5. **Verify**:
   - Homepage shows new project in feature rows
   - Navigation includes new link
   - Project page accessible at `/projects/my-new-project/`

### Update Site Configuration

1. **Edit `_config.yml`**:
   ```bash
   code _config.yml
   ```

2. **Make changes** (add inline comments per Constitution):
   ```yaml
   title: "New Site Title"
     # Site title displayed in header
   ```

3. **Restart Jekyll** (config changes require restart):
   ```bash
   # Ctrl+C to stop
   bundle exec jekyll serve
   ```

4. **Verify changes** at http://localhost:4000

### Add Images

1. **Place images** in `assets/images/`:
   ```bash
   cp ~/my-image.jpg assets/images/project-teaser.jpg
   ```

2. **Optimize images** (recommended):
   - Resize: 400x300px for teasers, 1920x1080px for headers
   - Compress: Use tools like ImageOptim, TinyPNG
   - Target: <50KB for teasers, <200KB for headers

3. **Reference in front matter**:
   ```yaml
   header:
     teaser: /assets/images/project-teaser.jpg
   ```

4. **Include alt text** (accessibility requirement):
   ```yaml
   feature_row:
     - image_path: /assets/images/project-teaser.jpg
       alt: "Descriptive text for screen readers"
   ```

### Test Before Committing

1. **Build site**:
   ```bash
   bundle exec jekyll build
   ```
   - Checks for build errors
   - Generates site to `_site/`

2. **Check for broken links** (optional, requires html-proofer):
   ```bash
   gem install html-proofer
   bundle exec htmlproofer ./_site --disable-external
   ```

3. **Verify Lighthouse scores** (in Chrome DevTools):
   - Open http://localhost:4000
   - Open DevTools (F12)
   - Lighthouse tab → Generate report
   - Check: Performance ≥90, Accessibility ≥95, Best Practices ≥90, SEO ≥95

## Testing

### Local Build Test

```bash
# Clean build
rm -rf _site .jekyll-cache
bundle exec jekyll build

# Check for warnings/errors in output
# Exit code 0 = success
```

### Link Checking (HTML-Proofer)

```bash
# Install (if not already)
gem install html-proofer

# Check internal links only
bundle exec htmlproofer ./_site --disable-external --allow-hash-href

# Check all links (slower, may have false positives)
bundle exec htmlproofer ./_site
```

### Accessibility Testing (pa11y)

```bash
# Install (requires Node.js)
npm install -g pa11y

# Start local server
bundle exec jekyll serve &

# Test homepage
pa11y http://localhost:4000

# Test project page
pa11y http://localhost:4000/projects/devtoys-mcp/
```

## Deployment

### GitHub Pages Automatic Deployment

1. **Commit changes**:
   ```bash
   git add .
   git commit -m "Add new project: My New Project"
   ```

2. **Push to GitHub**:
   ```bash
   git push origin 001-jekyll-site-setup
   ```

3. **Create Pull Request**:
   - Go to https://github.com/festina-lente-io/web
   - Click "Compare & pull request"
   - Fill in PR description
   - Request review

4. **Merge to main**:
   - After approval, merge PR
   - GitHub Pages automatically builds and deploys
   - Wait 2-5 minutes for deployment

5. **Verify production**:
   - Visit https://www.festina-lente.io
   - Check new content is live

### Manual Build (GitHub Actions)

If custom GitHub Actions workflow is used:

1. Check workflow status:
   - Go to repository → Actions tab
   - View workflow runs

2. Debugging failed builds:
   - Click failed workflow
   - Expand failing step
   - Check error messages

### Custom Domain Setup

If setting up custom domain for first time:

1. **Create CNAME file**:
   ```bash
   echo "www.festina-lente.io" > CNAME
   git add CNAME
   git commit -m "Add custom domain configuration"
   git push
   ```

2. **Configure DNS** (at domain registrar):
   - CNAME record: `www.festina-lente.io` → `festina-lente-io.github.io`
   - A records for apex domain:
     - `festina-lente.io` → `185.199.108.153`
     - `festina-lente.io` → `185.199.109.153`
     - `festina-lente.io` → `185.199.110.153`
     - `festina-lente.io` → `185.199.111.153`

3. **Enable HTTPS** (GitHub Pages settings):
   - Repository Settings → Pages
   - Check "Enforce HTTPS"

4. **Wait for DNS propagation** (up to 24 hours):
   ```bash
   # Check DNS
   nslookup www.festina-lente.io
   ```

## Troubleshooting

### Jekyll Build Fails

**Problem**: `bundle exec jekyll build` returns errors

**Solutions**:
- Check YAML syntax: Ensure front matter has matching `---` delimiters
- Validate Liquid syntax: Look for unmatched `{% %}` or `{{ }}`
- Check for invalid characters in filenames (no spaces, special chars)
- Review error message for specific file/line number

### Changes Not Appearing

**Problem**: Edited files but site hasn't updated

**Solutions**:
- Restart Jekyll server (Ctrl+C, then `bundle exec jekyll serve`)
- Clear cache: `rm -rf _site .jekyll-cache`
- Hard refresh browser: Ctrl+Shift+R (Windows/Linux) or Cmd+Shift+R (Mac)
- Check file is in correct directory (not accidentally in specs/)

### Port Already in Use

**Problem**: `Address already in use` error when starting server

**Solutions**:
- Kill existing Jekyll process: `pkill -f jekyll`
- Use different port: `bundle exec jekyll serve --port 4001`
- Find and kill process on port 4000:
  ```bash
  # macOS/Linux
  lsof -ti:4000 | xargs kill
  
  # Windows PowerShell
  Get-Process -Id (Get-NetTCPConnection -LocalPort 4000).OwningProcess | Stop-Process
  ```

### Ruby Version Mismatch

**Problem**: `Your Ruby version is X, but your Gemfile specified Y`

**Solutions**:
- Use rbenv to switch Ruby version:
  ```bash
  rbenv install 2.7.4
  rbenv local 2.7.4
  ```
- Or update Gemfile to match your Ruby version (not recommended)

### Bundler Errors

**Problem**: `Could not find gem` errors

**Solutions**:
- Update Bundler: `gem install bundler`
- Clean install: `rm Gemfile.lock && bundle install`
- Update gems: `bundle update`

### Images Not Loading

**Problem**: Images show broken icon in browser

**Solutions**:
- Check path is correct (case-sensitive on Linux)
- Ensure image is in `assets/images/`
- Use relative URL: `/assets/images/file.jpg` (starts with `/`)
- Verify image file actually exists in repo

### Theme Not Applied

**Problem**: Site looks unstyled or broken

**Solutions**:
- Verify `remote_theme` is set in `_config.yml`:
  ```yaml
  remote_theme: mmistakes/minimal-mistakes
  ```
- Check internet connection (remote theme requires download)
- Restart Jekyll server after config changes

## Next Steps

After completing this quickstart:

1. **Read specification**: `specs/001-jekyll-site-setup/spec.md`
2. **Review data model**: `specs/001-jekyll-site-setup/data-model.md`
3. **Check contracts**: `specs/001-jekyll-site-setup/contracts/`
4. **Follow constitution**: `.specify/memory/constitution.md`
5. **Contribute**: See contributing guidelines in repository

## Resources

### Official Documentation
- [Jekyll Docs](https://jekyllrb.com/docs/)
- [Minimal Mistakes Docs](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/)
- [GitHub Pages Docs](https://docs.github.com/en/pages)

### Theme Resources
- [Minimal Mistakes Demo](https://mmistakes.github.io/minimal-mistakes/)
- [Layouts Guide](https://mmistakes.github.io/minimal-mistakes/docs/layouts/)
- [Configuration Guide](https://mmistakes.github.io/minimal-mistakes/docs/configuration/)

### Jekyll Plugins
- [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag)
- [jekyll-feed](https://github.com/jekyll/jekyll-feed)
- [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap)

### Testing Tools
- [HTML-Proofer](https://github.com/gjtorikian/html-proofer)
- [pa11y](https://pa11y.org/)
- [Lighthouse](https://developers.google.com/web/tools/lighthouse)

### Ruby/Bundler
- [rbenv](https://github.com/rbenv/rbenv)
- [Bundler Docs](https://bundler.io/docs.html)

## Support

Need help?
- **Issues**: Open issue on [GitHub](https://github.com/festina-lente-io/web/issues)
- **Discussions**: Use GitHub Discussions for questions
- **Constitution**: Review `.specify/memory/constitution.md` for standards
- **Specs**: Check `specs/` directory for feature documentation
