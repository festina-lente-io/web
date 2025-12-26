# web Development Guidelines

Auto-generated from all feature plans. Last updated: 2025-12-25

## Active Technologies

- **Static Site Generator**: Jekyll 3.9.5 (GitHub Pages version)
- **Theme**: Minimal Mistakes (remote theme via jekyll-remote-theme)
- **Theme Skin**: contrast
- **Ruby**: 2.7.4 (GitHub Pages compatible)
- **Build Tool**: Bundler
- **Hosting**: GitHub Pages
- **Plugins**: jekyll-feed, jekyll-seo-tag, jekyll-sitemap, jekyll-include-cache
- **Content Format**: Markdown with YAML front matter
- **Template Language**: Liquid
- **Markdown Processor**: kramdown (GFM mode)

## Project Structure

```text
_projects/               # Project collection items (Jekyll collection)
_pages/                  # Standalone pages
_data/
└── navigation.yml       # Site navigation configuration
_config.yml              # Site-wide Jekyll configuration
assets/
├── css/                 # Custom stylesheets (optional theme overrides)
├── js/                  # Custom JavaScript
└── images/              # Image assets
index.md                 # Homepage with splash layout
CNAME                    # Custom domain (www.festina-lente.io)
Gemfile                  # Ruby dependencies
Gemfile.lock             # Locked dependency versions
specs/                   # Feature specifications (excluded from build)
_site/                   # Generated site (git-ignored)
.jekyll-cache/           # Jekyll build cache (git-ignored)
```

## Commands

# Development
bundle exec jekyll serve              # Start local dev server (http://localhost:4000)
bundle exec jekyll serve --drafts     # Include draft content
bundle exec jekyll serve --port 4001  # Use custom port

# Build
bundle exec jekyll build              # Build site to _site/
bundle exec jekyll build --trace      # Build with verbose error messages

# Testing
bundle exec htmlproofer ./_site --disable-external  # Check internal links
pa11y http://localhost:4000           # Accessibility testing (requires Node.js pa11y)

# Dependencies
bundle install                        # Install Ruby gems from Gemfile
bundle update                         # Update gems

## Code Style

**Markdown**:
- Use consistent heading hierarchy (# → ## → ###)
- Include blank lines between sections
- Use fenced code blocks with language specifiers
- Follow Minimal Mistakes front matter conventions

**YAML/Front Matter**:
- Consistent indentation (2 spaces)
- Quote strings with special characters
- Document all non-obvious fields with inline comments
- Follow schemas in specs/*/contracts/

**Jekyll Collections**:
- Project files in `_projects/` must include: title, description, repo_url, order
- All project quickstart guides must have seven standardized sections (Prerequisites, Installation, Quick Start, Next Steps, Troubleshooting, FAQ, Advanced Usage)
- Use descriptive permalinks following pattern `/projects/:name/`

**Configuration**:
- All `_config.yml` changes require inline comments (Constitution Principle II)
- Test locally before committing
- Restart Jekyll server after config changes

**Images**:
- Optimize before committing (<50KB for teasers, <200KB for headers)
- Always include alt text for accessibility
- Store in `assets/images/`
- Use relative paths starting with `/`

**Navigation**:
- Maintain logical order (Home first)
- Update `_data/navigation.yml` when adding projects
- Keep titles concise (1-30 characters)

## Recent Changes

**2025-12-25**: Initial Jekyll site setup
- Added Minimal Mistakes theme with contrast skin
- Configured collections for project portfolio
- Established content structure with standardized quickstart guides
- Custom domain setup: www.festina-lente.io

<!-- MANUAL ADDITIONS START -->
<!-- MANUAL ADDITIONS END -->
