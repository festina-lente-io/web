# GitHub Actions Workflow Contract

**File**: `.github/workflows/deploy.yml`
**Purpose**: CI/CD pipeline for Hugo site deployment to GitHub Pages
**Triggers**: Push to main, pull requests

## Workflow Schema

```yaml
name: string
  # Workflow name
  # Example: "Deploy Hugo Site"

on:
  # Trigger events
  push:
    branches: [main]
  pull_request:
    branches: [main]

env:
  # Environment variables
  HUGO_VERSION: string
    # Hugo version to use
    # Example: "0.120.0"

jobs:
  # Job definitions
  build-and-deploy:
    runs-on: string
      # Runner OS
      # Value: "ubuntu-latest" (recommended)
    
    steps:
      # Array of steps
```

## Complete Example

```yaml
name: Deploy Hugo Site

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
  workflow_dispatch:  # Manual trigger

env:
  HUGO_VERSION: "0.120.0"

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    permissions:
      contents: write  # Required for gh-pages deployment
    
    steps:
      # 1. Checkout code
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: true  # Fetch Hugo themes (if git submodule)
          fetch-depth: 0    # Required for GitVersion
      
      # 2. Setup Hugo
      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: ${{ env.HUGO_VERSION }}
          extended: true  # Required for SCSS
      
      # 3. Setup GitVersion
      - name: Install GitVersion
        uses: gittools/actions/gitversion/setup@v0.10.2
        with:
          versionSpec: '5.x'
      
      # 4. Calculate version
      - name: Determine Version
        id: gitversion
        uses: gittools/actions/gitversion/execute@v0.10.2
      
      # 5. Build Hugo site
      - name: Build Hugo Site
        env:
          HUGO_VERSION_TAG: ${{ steps.gitversion.outputs.semVer }}
        run: hugo --minify
      
      # 6. Install and run htmltest
      - name: Test HTML
        run: |
          curl -s https://htmltest.wjdp.uk | bash
          ./bin/htmltest
      
      # 7. Deploy to GitHub Pages (main branch only)
      - name: Deploy to GitHub Pages
        if: github.ref == 'refs/heads/main' && github.event_name == 'push'
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
          cname: www.festina-lente.io
          force_orphan: true  # Clean gh-pages branch history
```

## Step-by-Step Breakdown

### Step 1: Checkout

```yaml
- name: Checkout
  uses: actions/checkout@v4
  with:
    submodules: true  # Required if theme is git submodule
    fetch-depth: 0    # Full git history for GitVersion
```

**Purpose**: Clone repository with full history
**Required Parameters**:
- `submodules: true` - If theme is git submodule
- `fetch-depth: 0` - For GitVersion to work correctly

### Step 2: Setup Hugo

```yaml
- name: Setup Hugo
  uses: peaceiris/actions-hugo@v2
  with:
    hugo-version: ${{ env.HUGO_VERSION }}
    extended: true
```

**Purpose**: Install Hugo Extended
**Required Parameters**:
- `hugo-version`: Must match `env.HUGO_VERSION`
- `extended: true` - Required for SCSS processing (Hextra theme)

### Step 3: Install GitVersion

```yaml
- name: Install GitVersion
  uses: gittools/actions/gitversion/setup@v0.10.2
  with:
    versionSpec: '5.x'
```

**Purpose**: Install GitVersion tool
**Parameters**:
- `versionSpec`: GitVersion major version (5.x recommended)

### Step 4: Calculate Version

```yaml
- name: Determine Version
  id: gitversion
  uses: gittools/actions/gitversion/execute@v0.10.2
```

**Purpose**: Calculate semantic version from git history
**Outputs** (accessible via `steps.gitversion.outputs`):
- `semVer`: Full semantic version (e.g., "1.2.3")
- `major`, `minor`, `patch`: Version components
- `preReleaseTag`: Pre-release tag (if any)

### Step 5: Build Hugo Site

```yaml
- name: Build Hugo Site
  env:
    HUGO_VERSION_TAG: ${{ steps.gitversion.outputs.semVer }}
  run: hugo --minify
```

**Purpose**: Build static site
**Environment Variables**:
- `HUGO_VERSION_TAG`: Injected version for display in site

**Command**: `hugo --minify`
- `--minify`: Minify HTML, CSS, JS output

### Step 6: Test HTML

```yaml
- name: Test HTML
  run: |
    curl -s https://htmltest.wjdp.uk | bash
    ./bin/htmltest
```

**Purpose**: Validate HTML and check links
**Actions**:
1. Download htmltest binary
2. Run htmltest on `public/` directory

**Failure**: Workflow fails if broken links or invalid HTML

### Step 7: Deploy

```yaml
- name: Deploy to GitHub Pages
  if: github.ref == 'refs/heads/main' && github.event_name == 'push'
  uses: peaceiris/actions-gh-pages@v3
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    publish_dir: ./public
    cname: www.festina-lente.io
    force_orphan: true
```

**Purpose**: Deploy to GitHub Pages
**Condition**: Only on push to main branch
**Parameters**:
- `github_token`: Auto-provided secret
- `publish_dir`: Hugo output directory
- `cname`: Custom domain
- `force_orphan`: Clean deployment history

## Extended Example with Testing

```yaml
name: Deploy Hugo Site with Full Testing

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

env:
  HUGO_VERSION: "0.120.0"
  NODE_VERSION: "18"

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    
    steps:
      - uses: actions/checkout@v4
        with:
          submodules: true
          fetch-depth: 0
      
      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: ${{ env.HUGO_VERSION }}
          extended: true
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
      
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
      
      - name: Install Testing Tools
        run: |
          npm install -g htmltest
          npm install -g @lhci/cli
          npm install -g pa11y-ci
      
      - name: Test HTML
        run: htmltest
      
      - name: Accessibility Testing
        run: |
          echo '{ "urls": ["public/index.html"] }' > .pa11yci.json
          pa11y-ci
      
      - name: Lighthouse CI
        run: |
          lhci autorun --collect.staticDistDir=./public
        env:
          LHCI_GITHUB_APP_TOKEN: ${{ secrets.LHCI_GITHUB_APP_TOKEN }}
      
      - name: Deploy to GitHub Pages
        if: github.ref == 'refs/heads/main' && github.event_name == 'push'
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
          cname: www.festina-lente.io
          force_orphan: true
```

## Validation Rules

### Required Elements

- Workflow must have `name`
- Must trigger on `push` to `main`
- Must use Hugo Extended
- Must deploy only from `main` branch
- Must include `cname` parameter for custom domain

### Conditional Deployment

```yaml
if: github.ref == 'refs/heads/main' && github.event_name == 'push'
```

This ensures:
- Deployment only from main branch
- No deployment on pull requests (only testing)

### Permissions

```yaml
permissions:
  contents: write  # Required for gh-pages deployment
```

## Environment Variables Available

- `${{ secrets.GITHUB_TOKEN }}`: Auto-provided GitHub token
- `${{ github.ref }}`: Git reference (e.g., refs/heads/main)
- `${{ github.event_name }}`: Event type (push, pull_request)
- `${{ steps.gitversion.outputs.semVer }}`: Calculated version

## Artifacts

Workflow produces:
- `public/` directory: Static site files
- `gh-pages` branch: Deployed site
- Workflow logs: Build and test results

## Troubleshooting

### Build Fails: "extended version required"

**Solution**: Ensure `extended: true` in Hugo setup step

### Deployment Fails: Permission denied

**Solution**: Check repository settings → Actions → General → Workflow permissions → Read and write permissions

### htmltest Fails: External links broken

**Solution**: Configure `.htmltest.yml` to ignore external links or set timeout

```yaml
# .htmltest.yml
IgnoreExternalBrokenLinks: true
ExternalTimeout: 30
```

### GitVersion Fails: Not a git repository

**Solution**: Ensure `fetch-depth: 0` in checkout step

## Migration Notes

When updating workflow:
1. Test changes in feature branch first
2. Verify deployment on staging (if available)
3. Monitor first main branch deployment
4. Check GitHub Pages deployment logs
5. Verify site loads at custom domain
