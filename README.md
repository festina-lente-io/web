# Festina Lente - Project Showcase Website

[![Deploy Hugo Site](https://github.com/festina-lente-io/web/actions/workflows/deploy.yml/badge.svg)](https://github.com/festina-lente-io/web/actions/workflows/deploy.yml)

**Festina Lente** (Latin: "make haste slowly") - A showcase of open source projects with comprehensive quickstart guides.

**Live Site**: [www.festina-lente.io](https://www.festina-lente.io)

## Tech Stack

- **Static Site Generator**: Hugo Extended v0.153.2+
- **Theme**: Hextra (modern documentation theme)
- **Hosting**: GitHub Pages
- **CI/CD**: GitHub Actions
- **Versioning**: GitVersion
- **Docker**: Local development environment

## Prerequisites

Choose **ONE** of the following development approaches:

### Option A: Docker (Recommended)

- Docker Desktop
- Docker Compose
- Git

### Option B: Native Hugo

- Hugo Extended v0.153.2 or higher ([install guide](https://gohugo.io/installation/))
- Git
- Go 1.21+ (optional, for Hugo modules)

## Quick Start

### Using Docker (Recommended)

1. **Clone the repository**:
   ```bash
   git clone https://github.com/festina-lente-io/web.git
   cd web
   git submodule update --init --recursive  # Download Hextra theme
   ```

2. **Start the development server**:
   ```bash
   docker-compose up
   ```

3. **Open your browser**:
   Navigate to [http://localhost:1313](http://localhost:1313)

4. **Stop the server**:
   ```bash
   docker-compose down
   ```

### Using Native Hugo

1. **Clone the repository**:
   ```bash
   git clone https://github.com/festina-lente-io/web.git
   cd web
   git submodule update --init --recursive  # Download Hextra theme
   ```

2. **Start the development server**:
   ```bash
   hugo server --buildDrafts --buildFuture
   ```

3. **Open your browser**:
   Navigate to [http://localhost:1313](http://localhost:1313)

### Using PowerShell Helper Script (Windows)

Run the interactive menu:

```powershell
.\run.ps1
```

Options:
- Start Hugo server (Docker)
- Build Docker image
- Start Hugo server (native)
- Build site
- Stop Docker container
- Clean build artifacts
- View logs
- Run tests

## Project Structure

```
web/
├── content/                 # Markdown content
│   ├── _index.md           # Homepage
│   └── projects/           # Project quickstart pages
│       ├── devtoys-mcp.md
│       └── code-standards.md
├── static/                  # Static assets
│   ├── CNAME               # Custom domain configuration
│   └── images/             # Image assets
├── themes/
│   └── hextra/             # Hextra theme (git submodule)
├── layouts/                 # Custom Hugo templates (optional)
├── assets/                  # Assets to be processed (images, SCSS)
├── data/                    # Data files
├── hugo.toml               # Hugo configuration
├── GitVersion.yml          # Semantic versioning config
├── Dockerfile              # Docker image definition
├── docker-compose.yml      # Docker Compose configuration
└── .github/
    └── workflows/
        └── deploy.yml      # GitHub Actions CI/CD pipeline
```

## Adding a New Project

1. **Create a new markdown file**:
   ```bash
   touch content/projects/new-project.md
   ```

2. **Add front matter and content**:
   ```markdown
   ---
   title: "Project Name"
   description: "Brief project description (50-150 words)"
   repo_url: "https://github.com/festina-lente-io/project-name"
   weight: 30  # Display order (lower numbers appear first)
   draft: false
   date: 2025-12-25
   type: "projects"
   ---

   ## Prerequisites
   [Your content here]

   ## Installation
   [Your content here]

   ## Quick Start
   [Your content here]

   ## Next Steps
   [Your content here]

   ## Troubleshooting
   [Your content here]

   ## FAQ
   [Your content here]

   ## Advanced Usage
   [Your content here]
   ```

3. **Preview locally**:
   - Docker: Changes auto-reload at http://localhost:1313
   - Native: Changes auto-reload with `hugo server`

4. **Commit and push**:
   ```bash
   git add content/projects/new-project.md
   git commit -m "feat: add new-project quickstart guide"
   git push origin main
   ```

5. **Automatic deployment**:
   GitHub Actions will build and deploy to [www.festina-lente.io](https://www.festina-lente.io)

## Development

### Building for Production

**Docker**:
```bash
docker run --rm -v ${PWD}:/src hugomods/hugo:exts --minify
```

**Native**:
```bash
hugo --minify
```

Output is generated in `./public/` directory.

### Testing

**HTML Validation**:
```bash
curl -s https://htmltest.wjdp.uk | bash
./bin/htmltest
```

**Lighthouse CI** (requires Node.js):
```bash
npm install -g @lhci/cli
lhci autorun
```

**Accessibility Testing** (requires Node.js):
```bash
npm install -g pa11y-ci
pa11y-ci
```

### Customization

**Hugo Configuration** (`hugo.toml`):
- Site metadata (title, description)
- Navigation menu
- Theme parameters
- Markdown rendering options

**Hextra Theme**:
- See [Hextra documentation](https://imfing.github.io/hextra/)
- Override templates in `layouts/` directory
- Customize styles in `assets/css/`

## Deployment

### Automatic Deployment (Recommended)

Pushes to the `main` branch trigger automatic deployment via GitHub Actions:

1. **Build**: Hugo generates static site with minification
2. **Version**: GitVersion calculates semantic version
3. **Test**: htmltest validates HTML and links
4. **Deploy**: Publish to GitHub Pages (`gh-pages` branch)
5. **Serve**: Available at [www.festina-lente.io](https://www.festina-lente.io)

### Manual Deployment

If needed, deploy manually:

```bash
# Build site
hugo --minify

# Deploy to GitHub Pages (requires gh-pages branch setup)
git subtree push --prefix public origin gh-pages
```

## Configuration

### Custom Domain

Custom domain is configured via:
- `static/CNAME` file (contains: `www.festina-lente.io`)
- GitHub repository settings: Settings → Pages → Custom domain
- DNS A records pointing to GitHub Pages IPs:
  - 185.199.108.153
  - 185.199.109.153
  - 185.199.110.153
  - 185.199.111.153

### GitHub Pages Settings

- **Source**: Deploy from branch (`gh-pages`)
- **Custom domain**: `www.festina-lente.io`
- **Enforce HTTPS**: Enabled

## Troubleshooting

### Docker Issues

**Problem**: Docker container won't start

**Solutions**:
- Verify Docker Desktop is running
- Check port 1313 is not in use: `docker ps`
- Rebuild image: `docker-compose build`
- Check logs: `docker logs festina-lente-hugo`

### Hugo Build Errors

**Problem**: Hugo build fails

**Solutions**:
- Check Hugo version: `hugo version` (must be Extended 0.153.2+)
- Verify theme submodule: `git submodule update --init --recursive`
- Check `hugo.toml` syntax
- Review error messages for specific file issues

### Theme Not Loading

**Problem**: Site renders without theme styles

**Solutions**:
- Verify theme submodule: `ls themes/hextra`
- Update submodule: `git submodule update --remote`
- Check `theme = "hextra"` in `hugo.toml`
- Clear Hugo cache: `rm -rf resources/`

### GitHub Actions Deployment Fails

**Problem**: Deployment workflow fails

**Solutions**:
- Check workflow logs in GitHub Actions tab
- Verify `gh-pages` branch exists
- Ensure GitHub Pages is enabled in repository settings
- Check CNAME file exists: `static/CNAME`

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

**Quick Contribution Steps**:
1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-project`
3. Make your changes
4. Test locally
5. Commit with descriptive messages
6. Push to your fork
7. Open a pull request

## License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

## Links

- **Website**: [www.festina-lente.io](https://www.festina-lente.io)
- **GitHub**: [festina-lente-io/web](https://github.com/festina-lente-io/web)
- **Hugo**: [gohugo.io](https://gohugo.io)
- **Hextra Theme**: [imfing.github.io/hextra](https://imfing.github.io/hextra)
- **GitHub Pages**: [docs.github.com/pages](https://docs.github.com/en/pages)

## Support

- **Issues**: [GitHub Issues](https://github.com/festina-lente-io/web/issues)
- **Discussions**: [GitHub Discussions](https://github.com/festina-lente-io/web/discussions)

---

**Made with ❤️ by the Festina Lente team**
