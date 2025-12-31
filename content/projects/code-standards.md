---
title: "Code Standards"
description: "Comprehensive coding standards and best practices for modern software development. Includes style guides, linting configurations, and automated quality checks for JavaScript, TypeScript, Python, and more."
repo_url: "https://github.com/festina-lente-io/code-standards"
weight: 20
draft: false
date: 2025-12-25
type: "projects"
---

## Prerequisites

Before adopting these code standards, ensure you have:

- **Git** - Version control system ([git-scm.com](https://git-scm.com/))
- **Node.js 18+** - For JavaScript/TypeScript linting tools
- **Python 3.8+** - For Python linting tools (if using Python standards)
- **IDE/Editor** - VS Code, IntelliJ, or any modern code editor
- **Basic understanding** of:
  - Your programming language(s)
  - Linting and code formatting concepts
  - Version control with Git

## Installation

### For JavaScript/TypeScript Projects

Install ESLint and Prettier with our shared configuration:

```bash
npm install --save-dev @festina-lente/eslint-config
npm install --save-dev @festina-lente/prettier-config
```

Create `.eslintrc.json`:

```json
{
  "extends": "@festina-lente/eslint-config"
}
```

Create `.prettierrc.json`:

```json
"@festina-lente/prettier-config"
```

### For Python Projects

Install our Python linting tools:

```bash
pip install festina-lente-pylint
pip install festina-lente-black
```

Create `.pylintrc`:

```ini
[MASTER]
load-plugins=festina_lente_pylint

[festina-lente]
strict-mode=true
```

### For Multi-Language Projects

Clone the standards repository:

```bash
git clone https://github.com/festina-lente-io/code-standards.git
cd code-standards
```

Copy relevant configuration files to your project:

```bash
cp code-standards/configs/.eslintrc.json ./
cp code-standards/configs/.prettierrc.json ./
cp code-standards/configs/.pylintrc ./
cp code-standards/configs/.editorconfig ./
```

## Quick Start

### Step 1: Configure Your IDE

**VS Code**:
1. Install extensions: ESLint, Prettier, EditorConfig
2. Enable "Format on Save" in settings
3. Restart VS Code

**IntelliJ/WebStorm**:
1. Enable ESLint: Settings → Languages & Frameworks → JavaScript → Code Quality Tools → ESLint
2. Enable Prettier: Settings → Languages & Frameworks → JavaScript → Prettier
3. Configure "Reformat on Save"

### Step 2: Run Initial Formatting

Format all files to match standards:

```bash
# JavaScript/TypeScript
npx prettier --write "**/*.{js,ts,jsx,tsx,json,css,md}"
npx eslint --fix "**/*.{js,ts,jsx,tsx}"

# Python
black .
pylint --load-plugins=festina_lente_pylint .
```

### Step 3: Set Up Pre-Commit Hooks

Install Husky for automatic linting:

```bash
npm install --save-dev husky lint-staged
npx husky install
```

Add to `package.json`:

```json
{
  "lint-staged": {
    "*.{js,ts,jsx,tsx}": ["eslint --fix", "prettier --write"],
    "*.{json,css,md}": ["prettier --write"],
    "*.py": ["black", "pylint"]
  }
}
```

Create `.husky/pre-commit`:

```bash
#!/bin/sh
npx lint-staged
```

Now code is automatically formatted and linted before every commit!

## Next Steps

- **Review Style Guide**: Read the [full style guide](https://github.com/festina-lente-io/code-standards/blob/main/STYLE_GUIDE.md)
- **Customize Rules**: Override specific rules in your project's config files
- **Team Adoption**: Share these standards with your team
- **CI/CD Integration**: Add linting to your GitHub Actions or CI pipeline
- **Learn Best Practices**: Explore the [best practices documentation](https://github.com/festina-lente-io/code-standards/blob/main/BEST_PRACTICES.md)

## Troubleshooting

### Linting errors appear after installation

**Problem**: ESLint or Pylint shows hundreds of errors in existing code

**Solutions**:
1. Run auto-fix first: `npx eslint --fix` or `black .`
2. Gradually adopt standards: Start with critical rules only
3. Use `.eslintignore` to exclude legacy code temporarily
4. Review error output and fix high-priority issues first
5. Consider a "linting sprint" to address all issues

### Prettier and ESLint conflict

**Problem**: Prettier formats code, then ESLint reports style violations

**Solutions**:
1. Install `eslint-config-prettier` to disable conflicting rules:
   ```bash
   npm install --save-dev eslint-config-prettier
   ```
2. Update `.eslintrc.json`:
   ```json
   {
     "extends": ["@festina-lente/eslint-config", "prettier"]
   }
   ```
3. Run Prettier before ESLint in your workflow

### Pre-commit hooks are too slow

**Problem**: Husky pre-commit hooks take too long, blocking commits

**Solutions**:
- Use `lint-staged` to only lint changed files (already configured above)
- Disable specific slow rules temporarily
- Run full linting in CI instead of pre-commit
- Increase Node.js memory: `NODE_OPTIONS=--max-old-space-size=4096`

### IDE doesn't respect .editorconfig

**Problem**: Editor uses wrong indentation or line endings

**Solutions**:
1. Install EditorConfig plugin for your IDE
2. Restart IDE after installing plugin
3. Verify `.editorconfig` file exists in project root
4. Check IDE settings don't override EditorConfig

## FAQ

### Q: Can I customize the rules?

**A**: Yes! Our configurations are designed to be extended. Override specific rules in your project's config files:

```json
{
  "extends": "@festina-lente/eslint-config",
  "rules": {
    "no-console": "off",
    "indent": ["error", 2]
  }
}
```

### Q: Do these standards work with my framework?

**A**: Our standards are framework-agnostic but include optional plugins for popular frameworks:
- React: `@festina-lente/eslint-config/react`
- Vue: `@festina-lente/eslint-config/vue`
- Angular: `@festina-lente/eslint-config/angular`

### Q: How often are standards updated?

**A**: Standards are reviewed quarterly and updated as needed. Breaking changes follow semantic versioning. Subscribe to [GitHub releases](https://github.com/festina-lente-io/code-standards/releases) for notifications.

### Q: Can I use only parts of the standards?

**A**: Yes! Standards are modular:
- Core rules: `@festina-lente/eslint-config/core`
- TypeScript rules: `@festina-lente/eslint-config/typescript`
- React rules: `@festina-lente/eslint-config/react`

Mix and match as needed.

### Q: What if my team disagrees with a rule?

**A**: Code standards are meant to reduce bikeshedding, not create it. If your team has strong preferences:
1. Override the rule in your config
2. Document why in comments
3. Consider proposing a change upstream via GitHub issue

### Q: Are these standards opinionated?

**A**: Yes, intentionally! We've made decisions based on:
- Industry best practices
- Performance considerations
- Security implications
- Developer experience

This reduces decision fatigue and ensures consistency.

### Q: How do I migrate legacy code?

**A**: We recommend a phased approach:
1. **Phase 1**: Apply standards to new files only
2. **Phase 2**: Fix critical issues (security, bugs) in old code
3. **Phase 3**: Gradually refactor modules to meet standards
4. **Phase 4**: Full codebase compliance

Use `.eslintignore` to exempt legacy code during migration.

## Advanced Usage

### Custom Rule Sets

Create organization-specific standards that extend ours:

```javascript
// @your-org/eslint-config
module.exports = {
  extends: '@festina-lente/eslint-config',
  rules: {
    // Your custom rules
    '@your-org/custom-rule': 'error'
  }
};
```

### CI/CD Integration

#### GitHub Actions

```yaml
name: Lint Code

on: [push, pull_request]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '18'
      - run: npm ci
      - run: npm run lint
      - run: npm run format:check
```

#### GitLab CI

```yaml
lint:
  image: node:18
  script:
    - npm ci
    - npm run lint
    - npm run format:check
  only:
    - merge_requests
```

### Automated Fix PRs

Set up a bot to automatically create PRs with linting fixes:

```yaml
# .github/workflows/auto-lint.yml
name: Auto Lint

on:
  schedule:
    - cron: '0 0 * * 0'  # Weekly on Sunday

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npx eslint --fix .
      - run: npx prettier --write .
      - uses: peter-evans/create-pull-request@v5
        with:
          title: 'chore: Auto-fix linting issues'
          branch: auto-lint
```

### IDE Integration Tips

**VS Code Settings** (`.vscode/settings.json`):

```json
{
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  },
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  ]
}
```

**JetBrains IDEs**:
- Enable "Prettier on save" in Settings
- Enable "ESLint automatic fix" in Settings
- Configure "Optimize imports on save"

### Measuring Code Quality

Track improvement over time:

```bash
# Generate quality reports
npx eslint . --format html --output-file eslint-report.html

# Count violations
npx eslint . --format json | jq '.[] | .messages | length'

# Track over time in CI
echo "LINTING_ERRORS=$(npx eslint . --format json | jq '[.[] | .messages | length] | add')" >> $GITHUB_ENV
```

### Example Enforcement Policies

**Strict Mode** (fail CI on any warning):
```json
{
  "rules": {
    "no-warning-comments": ["error", { "terms": ["TODO", "FIXME"] }]
  }
}
```

**Gradual Adoption** (warnings only, errors halt CI):
```json
{
  "rules": {
    "no-console": "warn",
    "no-unused-vars": "error"
  }
}
```

**Security-First** (enforce security rules strictly):
```json
{
  "extends": ["@festina-lente/eslint-config/security"],
  "rules": {
    "no-eval": "error",
    "no-implied-eval": "error"
  }
}
```
