# Contributing to Festina Lente

Thank you for your interest in contributing to the Festina Lente project showcase website! We welcome contributions of all kinds.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
- [Adding a New Project](#adding-a-new-project)
- [Updating Existing Content](#updating-existing-content)
- [Development Setup](#development-setup)
- [Style Guide](#style-guide)
- [Pull Request Process](#pull-request-process)
- [Reporting Issues](#reporting-issues)

## Code of Conduct

This project adheres to a code of conduct. By participating, you are expected to uphold this code. Please be respectful and constructive in all interactions.

## How to Contribute

There are many ways to contribute:

- **Add new projects**: Showcase your Festina Lente projects
- **Improve documentation**: Fix typos, clarify instructions, add examples
- **Update content**: Keep project information current
- **Report issues**: Identify bugs, broken links, or accessibility problems
- **Suggest features**: Propose improvements to the site

## Adding a New Project

To add a new project to the showcase:

### Step 1: Fork and Clone

```bash
# Fork the repository on GitHub
# Then clone your fork
git clone https://github.com/YOUR-USERNAME/web.git
cd web

# Add upstream remote
git remote add upstream https://github.com/festina-lente-io/web.git

# Initialize theme submodule
git submodule update --init --recursive
```

### Step 2: Create Project Page

```bash
# Create a new branch
git checkout -b feature/add-my-project

# Copy the template
cp content/projects/_template.md content/projects/my-project.md
```

### Step 3: Write Content

Edit `content/projects/my-project.md`:

1. **Update front matter**:
   - Set accurate title and description
   - Add your GitHub repository URL
   - Set appropriate weight (10, 20, 30, etc.)
   - Update date to current date

2. **Complete all 7 sections**:
   - Prerequisites
   - Installation
   - Quick Start
   - Next Steps
   - Troubleshooting
   - FAQ
   - Advanced Usage

3. **Follow the style guide** (see below)

### Step 4: Test Locally

**Using Docker**:
```bash
docker-compose up
```

**Using native Hugo**:
```bash
hugo server --buildDrafts
```

Open [http://localhost:1313](http://localhost:1313) and verify:
- Project appears on homepage
- All sections render correctly
- Links work (especially GitHub repository link)
- Code blocks have proper syntax highlighting
- Responsive design works on mobile/desktop

### Step 5: Submit Pull Request

```bash
# Commit your changes
git add content/projects/my-project.md
git commit -m "feat: add my-project quickstart guide"

# Push to your fork
git push origin feature/add-my-project
```

Then open a pull request on GitHub with:
- Clear title: "feat: add [project-name] quickstart"
- Description of the project
- Link to the project repository
- Screenshots of the rendered page

## Updating Existing Content

To update existing content:

```bash
# Create a branch
git checkout -b fix/update-devtoys-mcp

# Make your changes
# Edit content/projects/devtoys-mcp.md

# Test locally
docker-compose up

# Commit and push
git add content/projects/devtoys-mcp.md
git commit -m "docs: update devtoys-mcp installation instructions"
git push origin fix/update-devtoys-mcp
```

## Development Setup

### Prerequisites

Choose one:

**Option A: Docker** (recommended)
- Docker Desktop
- Git

**Option B: Native Hugo**
- Hugo Extended v0.153.2+
- Git
- Go 1.21+ (optional)

### Setup Steps

1. **Clone repository**:
   ```bash
   git clone https://github.com/festina-lente-io/web.git
   cd web
   git submodule update --init --recursive
   ```

2. **Choose your workflow**:

   **Docker**:
   ```bash
   docker-compose up
   ```

   **Native**:
   ```bash
   hugo server --buildDrafts --buildFuture
   ```

3. **View site**: Open [http://localhost:1313](http://localhost:1313)

### Project Structure

```
web/
├── content/           # Markdown content
│   ├── _index.md     # Homepage
│   └── projects/     # Project pages
├── static/           # Static assets
├── themes/hextra/    # Theme (git submodule)
├── hugo.toml         # Configuration
└── .github/
    └── workflows/
        └── deploy.yml # CI/CD pipeline
```

## Style Guide

### Front Matter

Always include all required fields:

```yaml
---
title: "Clear, Descriptive Title"
description: "Brief description in 50-150 words explaining what the project does and key features."
repo_url: "https://github.com/festina-lente-io/project-name"
weight: 30
draft: false
date: 2025-12-25
type: "projects"
---
```

### Content Guidelines

**Headings**:
- Use ## for main sections (h2)
- Use ### for subsections (h3)
- Don't skip heading levels
- Keep headings clear and descriptive

**Code Blocks**:
- Always specify language: ` ```bash `, ` ```javascript `, ` ```json `
- Include comments for complex code
- Show expected output when helpful
- Test all commands before publishing

**Links**:
- Use descriptive link text (not "click here")
- External links open in new tabs automatically
- Internal links use relative paths: `/projects/other-project`

**Writing Style**:
- Use active voice
- Be concise and clear
- Write for beginners but don't oversimplify
- Include examples for complex concepts
- Use consistent terminology

### Formatting Standards

**Lists**:
- Use `-` for unordered lists
- Use `1.` for ordered lists
- Indent nested lists with 2 spaces

**Emphasis**:
- **Bold** for UI elements, filenames, important terms
- *Italic* for first use of technical terms
- `Code` for commands, variables, short code snippets

**Sections**:
- Always include all 7 required sections
- Add additional sections if needed
- Keep section order consistent

## Pull Request Process

### Before Submitting

- [ ] Content follows the template structure
- [ ] All 7 sections are complete
- [ ] Front matter is valid YAML
- [ ] Code blocks have language specifiers
- [ ] Links work correctly
- [ ] Tested locally (Docker or native Hugo)
- [ ] No broken links or images
- [ ] Responsive design works on mobile
- [ ] Commit messages follow conventions

### Commit Message Format

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types**:
- `feat:` New feature or project
- `fix:` Bug fix or correction
- `docs:` Documentation update
- `style:` Formatting, typos (no code change)
- `refactor:` Code/content restructuring
- `test:` Adding or updating tests
- `chore:` Build, config, or maintenance

**Examples**:
```
feat(projects): add devtoys-mcp quickstart guide

Add comprehensive quickstart documentation for DevToys MCP project
including installation, usage, troubleshooting, and advanced scenarios.

Closes #15
```

```
docs(projects): update code-standards installation steps

Simplify installation instructions and add troubleshooting section
for common npm permission errors.
```

### Review Process

1. **Automated checks**: GitHub Actions runs tests
2. **Review**: Maintainers review your PR
3. **Feedback**: Address any requested changes
4. **Approval**: PR is approved by maintainer
5. **Merge**: Changes are merged to main
6. **Deploy**: Site automatically deploys to production

### What Reviewers Look For

- Content accuracy and clarity
- Proper formatting and structure
- Working links and code examples
- Responsive design
- Accessibility (alt text, semantic HTML)
- Consistency with existing content
- Grammar and spelling

## Reporting Issues

Found a problem? Open an issue on GitHub:

**Bug Report**:
- Describe the problem
- Steps to reproduce
- Expected vs actual behavior
- Screenshots if applicable
- Browser/device information

**Content Issues**:
- Which page has the problem
- What needs to be fixed
- Suggested correction (if known)

**Feature Requests**:
- Describe the feature
- Why it's useful
- How it should work
- Examples from other sites (optional)

## Questions?

- **General questions**: Open a [Discussion](https://github.com/festina-lente-io/web/discussions)
- **Bugs or issues**: Open an [Issue](https://github.com/festina-lente-io/web/issues)
- **Security concerns**: Email security@festina-lente.io

## Recognition

Contributors will be:
- Listed in the repository contributors
- Acknowledged in release notes
- Appreciated by the community!

Thank you for contributing to Festina Lente! 🎉

---

**License**: By contributing, you agree that your contributions will be licensed under the MIT License.
