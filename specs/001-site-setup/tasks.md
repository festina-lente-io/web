# Tasks: Project Showcase Website

**Feature**: Project Showcase Website with Hugo + Hextra + GitHub Pages
**Input**: Design documents from `/specs/001-site-setup/`
**Prerequisites**: plan.md ✅, spec.md ✅, research.md ✅, data-model.md ✅, contracts/ ✅

**Tests**: Not explicitly requested in specification - focusing on implementation tasks with quality validation steps

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `- [ ] [ID] [P?] [Story?] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (US1, US2, US3)
- Include exact file paths in descriptions

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and Hugo setup

- [X] T001 Initialize Hugo site structure with `hugo new site .` command
- [X] T002 [P] Create `hugo.toml` configuration file with base settings (baseURL, title, languageCode)
- [X] T003 [P] Initialize Hugo modules with `hugo mod init github.com/festina-lente-io/web`
- [X] T004 [P] Add Hextra theme as Hugo module: `hugo mod get github.com/imfing/hextra`
- [X] T005 [P] Create `.gitignore` file (ignore: public/, resources/, .hugo_build.lock)
- [X] T006 [P] Create `static/` directory for static assets
- [X] T007 [P] Create `content/` directory structure: `content/`, `content/projects/`
- [X] T008 Verify Hugo build works: `hugo` command succeeds
- [X] T009 Verify local server works: `hugo server` runs without errors
- [X] T010 [P] Create `Dockerfile` with Hugo Extended base image for local development
- [X] T011 [P] Create `docker-compose.yml` for easy local server startup
- [X] T012 [P] Create `.dockerignore` file (ignore: public/, resources/, .hugo_build.lock, node_modules/)
- [X] T013 Verify Docker build works: `docker-compose build` succeeds
- [X] T014 Verify Docker server works: `docker-compose up` runs site at localhost:1313

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- [X] T015 Configure Hextra theme parameters in `hugo.toml` ([module.imports] section)
- [X] T016 [P] Configure site metadata in `hugo.toml` (title, description, author)
- [X] T017 [P] Configure baseURL in `hugo.toml` as `https://www.festina-lente.io/`
- [X] T018 [P] Configure markdown rendering in `hugo.toml` ([markup.goldmark.renderer] unsafe = true)
- [X] T019 [P] Create `static/CNAME` file with content: `www.festina-lente.io`
- [X] T020 [P] Create `GitVersion.yml` with Mainline mode configuration
- [X] T021 Create `.github/workflows/` directory
- [X] T022 Create `.github/workflows/deploy.yml` with Hugo build and deployment pipeline (see contracts/github-actions-workflow.md for specification)
- [X] T023 Configure GitHub Actions workflow: checkout with submodules and fetch-depth: 0
- [X] T024 Configure GitHub Actions workflow: Hugo Extended setup (v0.120.0)
- [X] T025 Configure GitHub Actions workflow: GitVersion setup and execution
- [X] T026 Configure GitHub Actions workflow: Hugo build with --minify flag
- [X] T027 Configure GitHub Actions workflow: Deploy to GitHub Pages (peaceiris/actions-gh-pages)
- [X] T028 [P] Create README.md with project overview, prerequisites, and quickstart
- [X] T029 Test local Hugo build: `hugo` generates public/ directory successfully
- [X] T030 Test local Hugo server: `hugo server` renders site at localhost:1313

**Checkpoint**: Foundation ready - content and feature implementation can now begin in parallel

---

## Phase 3: User Story 1 - View Project Portfolio (Priority: P1) 🎯 MVP

**Goal**: Visitor lands on homepage and sees clear overview of devtoys-mcp and code-standards projects with descriptions and links

**Independent Test**: Navigate to homepage, verify both projects listed with title, description, and link to quickstart. Homepage is responsive on mobile/desktop.

### Implementation for User Story 1

- [X] T031 [P] [US1] Create `content/_index.md` with homepage front matter (title, description)
- [X] T032 [US1] Write homepage content: hero section introducing Festina Lente
- [X] T033 [US1] Write homepage content: "Featured Projects" section header
- [X] T034 [US1] Configure navigation menu in `hugo.toml` ([params.navbar.menu] for Home link)
- [ ] T035 [US1] Verify Hextra theme renders homepage with project portfolio layout
- [ ] T036 [US1] Test homepage renders correctly: `hugo server` and check localhost:1313
- [ ] T037 [US1] Test responsive design on mobile viewport (320px minimum width)
- [ ] T038 [US1] Test responsive design on tablet viewport (768px)
- [ ] T039 [US1] Test responsive design on desktop viewport (1024px, 1920px)
- [ ] T040 [US1] Verify external links (GitHub repos) open in new tabs (test with browser)
- [ ] T041 [US1] Verify semantic HTML structure (headings hierarchy, proper tags)
- [ ] T042 [US1] Verify keyboard navigation works (Tab key navigation)

**Checkpoint**: At this point, homepage exists and renders properly, ready for project content in US2

---

## Phase 4: User Story 2 - Access Project Quickstart Guides (Priority: P2)

**Goal**: Visitor clicks project link from homepage and navigates to dedicated quickstart page with all 7 standardized sections for each project

**Independent Test**: Click devtoys-mcp link from homepage, verify quickstart page loads with all 7 sections. Click code-standards link, verify same. Both pages properly formatted and accessible.

### Implementation for User Story 2

- [X] T043 [P] [US2] Create `content/projects/devtoys-mcp.md` with front matter (title, description, repo_url, weight: 10)
- [X] T044 [P] [US2] Write devtoys-mcp quickstart: Prerequisites section
- [X] T045 [P] [US2] Write devtoys-mcp quickstart: Installation section
- [X] T046 [P] [US2] Write devtoys-mcp quickstart: Quick Start section
- [X] T047 [P] [US2] Write devtoys-mcp quickstart: Next Steps section
- [X] T048 [P] [US2] Write devtoys-mcp quickstart: Troubleshooting section
- [X] T049 [P] [US2] Write devtoys-mcp quickstart: FAQ section
- [X] T050 [P] [US2] Write devtoys-mcp quickstart: Advanced Usage section
- [X] T051 [P] [US2] Create `content/projects/code-standards.md` with front matter (title, description, repo_url, weight: 20)
- [X] T052 [P] [US2] Write code-standards quickstart: Prerequisites section
- [X] T053 [P] [US2] Write code-standards quickstart: Installation section
- [X] T054 [P] [US2] Write code-standards quickstart: Quick Start section
- [X] T055 [P] [US2] Write code-standards quickstart: Next Steps section
- [X] T056 [P] [US2] Write code-standards quickstart: Troubleshooting section
- [X] T057 [P] [US2] Write code-standards quickstart: FAQ section
- [X] T058 [P] [US2] Write code-standards quickstart: Advanced Usage section
- [ ] T059 [US2] Verify devtoys-mcp page renders correctly: check localhost:1313/projects/devtoys-mcp/
- [ ] T060 [US2] Verify code-standards page renders correctly: check localhost:1313/projects/code-standards/
- [ ] T061 [US2] Verify all 7 sections present and properly formatted on both pages
- [ ] T062 [US2] Verify links from homepage to project pages work correctly
- [ ] T063 [US2] Verify GitHub repository links open in new tabs
- [ ] T064 [US2] Test responsive design on project pages (320px, 768px, 1024px, 1920px)
- [ ] T065 [US2] Verify heading hierarchy is correct (h1 → h2 for sections)
- [ ] T066 [US2] Verify keyboard navigation works on project pages

**Checkpoint**: At this point, both projects have complete quickstart guides accessible from homepage

---

## Phase 5: User Story 3 - Navigate Site Structure (Priority: P3)

**Goal**: Visitor can easily navigate between homepage and project pages using consistent navigation menu, with current page indicated and mobile-friendly hamburger menu

**Independent Test**: Navigate through all pages, verify navigation menu appears consistently, links work, current page highlighted, mobile menu collapses properly

### Implementation for User Story 3

- [ ] T067 [US3] Configure Projects navigation link in `hugo.toml` ([params.navbar.menu] for /projects/)
- [ ] T068 [US3] Configure individual project links in navigation (devtoys-mcp, code-standards)
- [ ] T069 [US3] Verify navigation menu renders on homepage with all links
- [ ] T070 [US3] Verify navigation menu renders on project pages with all links
- [ ] T071 [US3] Verify current page indicator works (active state in nav)
- [ ] T072 [US3] Test navigation: click Home from project page, verify homepage loads
- [ ] T073 [US3] Test navigation: click devtoys-mcp from homepage, verify page loads
- [ ] T074 [US3] Test navigation: click code-standards from homepage, verify page loads
- [ ] T075 [US3] Test navigation: switch between project pages directly via nav
- [ ] T076 [US3] Verify breadcrumbs show site hierarchy (if Hextra provides)
- [ ] T077 [US3] Test mobile navigation: verify hamburger menu appears on small screens
- [ ] T078 [US3] Test mobile navigation: click hamburger, verify menu expands
- [ ] T079 [US3] Test mobile navigation: select item from expanded menu, verify navigation works
- [ ] T080 [US3] Verify keyboard navigation through menu (Tab, Enter keys)

**Checkpoint**: All user stories complete - site fully functional with navigation

---

## Phase 6: Testing & Quality Assurance

**Purpose**: Validate all success criteria and quality standards

- [ ] T081 [P] Install htmltest: `curl -s https://htmltest.wjdp.uk | bash`
- [ ] T082 Create `.htmltest.yml` configuration (set external timeout, ignore patterns if needed)
- [ ] T083 Run htmltest: `./bin/htmltest` - verify no broken links
- [ ] T084 Fix any broken links identified by htmltest
- [ ] T085 [P] Install Lighthouse CI: `npm install -g @lhci/cli`
- [ ] T086 Run Lighthouse audit on homepage: verify Performance ≥90
- [ ] T087 Run Lighthouse audit on homepage: verify Accessibility ≥95
- [ ] T088 Run Lighthouse audit on homepage: verify Best Practices ≥90
- [ ] T089 Run Lighthouse audit on homepage: verify SEO ≥95
- [ ] T090 Run Lighthouse audit on devtoys-mcp page: verify all scores ≥ thresholds
- [ ] T091 Run Lighthouse audit on code-standards page: verify all scores ≥ thresholds
- [ ] T092 [P] Install pa11y: `npm install -g pa11y-ci`
- [ ] T093 Create `.pa11yci.json` configuration with page URLs
- [ ] T094 Run pa11y accessibility tests: verify WCAG 2.1 AA compliance
- [ ] T095 Fix any accessibility issues identified
- [ ] T096 Verify SC-001: Project identification within 10 seconds (manual test)
- [ ] T097 Verify SC-002: One-click navigation to any project (manual test)
- [ ] T098 Verify SC-004: Renders correctly on 320px, 768px, 1024px, 4K
- [ ] T099 Verify SC-006: All pages load in <2 seconds (test with throttling)
- [ ] T100 Verify all images have alt text
- [ ] T101 Verify all code blocks have language specifiers
- [ ] T102 Verify front matter YAML is valid on all content files

---

## Phase 7: Deployment & Custom Domain

**Purpose**: Deploy to GitHub Pages with custom domain configuration

- [ ] T103 Create GitHub repository (if not exists): festina-lente-io/web
- [ ] T104 Push code to GitHub: `git push origin 001-site-setup`
- [ ] T105 Create pull request to main branch
- [ ] T106 Verify GitHub Actions workflow runs successfully on PR
- [ ] T107 Merge PR to main after review
- [ ] T108 Verify GitHub Actions deploys to gh-pages branch
- [ ] T109 Configure GitHub Pages: Settings → Pages → Source: Deploy from branch (gh-pages)
- [ ] T110 Configure GitHub Pages: Custom domain: www.festina-lente.io
- [ ] T111 Verify GitHub Pages: Enforce HTTPS enabled
- [ ] T112 Wait for DNS propagation (check CNAME file deployed)
- [ ] T113 Configure DNS A records pointing to GitHub Pages IPs (185.199.108-111.153)
- [ ] T114 Configure DNS CNAME record: www.festina-lente.io → festina-lente-io.github.io
- [ ] T115 Test site loads at https://www.festina-lente.io
- [ ] T116 Verify SC-008: Site accessible via custom domain with HTTPS
- [ ] T117 Test apex domain redirect: festina-lente.io redirects to www.festina-lente.io
- [ ] T118 Verify SC-009: Apex domain redirect works
- [ ] T119 Test all pages load correctly on production domain
- [ ] T120 Test all navigation works on production domain
- [ ] T121 Run Lighthouse audit on production site

---

## Phase 8: Polish & Documentation

**Purpose**: Finalize documentation and ensure maintainability

- [ ] T122 [P] Update README.md with complete setup instructions
- [ ] T123 [P] Document Hugo version requirement in README (v0.120.0+)
- [ ] T124 [P] Document Docker setup in README (alternative to local Hugo installation)
- [ ] T125 [P] Document how to add new projects (create markdown file, follow template)
- [ ] T126 [P] Create CONTRIBUTING.md with contribution guidelines
- [ ] T127 [P] Document local development workflow in README (native Hugo and Docker options)
- [ ] T128 [P] Document deployment process in README
- [ ] T129 [P] Add troubleshooting section to README
- [ ] T130 [P] Document front matter schema in README or docs/
- [ ] T131 Create project template: `content/projects/_template.md` for new projects
- [ ] T132 Verify SC-007: New project can be added by creating markdown file
- [ ] T133 Test adding new project using template (create test-project.md)
- [ ] T134 Verify test project appears on homepage and renders correctly
- [ ] T135 Remove test project file
- [ ] T136 [P] Add code comments to `hugo.toml` explaining all configuration
- [ ] T137 [P] Add code comments to `.github/workflows/deploy.yml` explaining pipeline steps
- [ ] T138 [P] Add code comments to `GitVersion.yml` explaining versioning strategy
- [ ] T139 [P] Add code comments to `Dockerfile` explaining Hugo Extended setup
- [ ] T140 Verify all constitution principles documented in agent context
- [ ] T141 Run final hugo build: `hugo --minify` - verify no errors
- [ ] T142 Verify SC-005: Site builds successfully without errors or warnings

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - start immediately
- **Foundational (Phase 2)**: Depends on Setup (Phase 1) - BLOCKS all user stories
- **User Stories (Phase 3-5)**: All depend on Foundational (Phase 2) completion
  - US1 can start after Phase 2
  - US2 can start after Phase 2 (but logically after US1 for context)
  - US3 can start after Phase 2 (but requires content from US1/US2 to test navigation)
- **Testing (Phase 6)**: Depends on all user stories (Phase 3-5) being complete
- **Deployment (Phase 7)**: Depends on Testing (Phase 6) passing
- **Polish (Phase 8)**: Depends on Deployment (Phase 7) working

### User Story Dependencies

- **User Story 1 (P1)**: Independent - can start after Foundational (Phase 2)
- **User Story 2 (P2)**: Logically depends on US1 (homepage needs to exist to link to projects), but can be developed in parallel
- **User Story 3 (P3)**: Depends on US1 and US2 (needs pages to navigate between)

### Within Each Phase

**Setup (Phase 1)**:
- T001 must run first (creates site structure)
- T002-T007 can run in parallel [P] after T001
- T008-T009 must run after all previous tasks (Hugo validation)
- T010-T012 can run in parallel [P] (Docker setup)
- T013-T014 must run after T010-T012 (Docker validation)

**Foundational (Phase 2)**:
- T015-T020 can run in parallel [P] (config files)
- T021 must run before T022 (creates directory)
- T022-T027 must run sequentially (building workflow file)
- T028 can run in parallel [P]
- T029-T030 must run after all previous tasks (validation)

**User Story 1 (Phase 3)**:
- T026-T029 can run in parallel [P] (creating content files)
- T030-T037 must run sequentially (testing and validation)

**User Story 2 (Phase 4)**:
- T038-T045 can run in parallel [P] (devtoys-mcp sections)
- T046-T053 can run in parallel [P] (code-standards sections)
- Both sets can run in parallel with each other
- T054-T061 must run after content creation (validation)

**User Story 3 (Phase 5)**:
- T062-T063 can run in parallel [P] (config changes)
- T064-T075 must run sequentially (testing)

**Testing (Phase 6)**:
- T076-T077 can run in parallel [P] with T080 (install tools)
- T078-T079 sequential (test then fix)
- T081-T086 can run in parallel [P] (Lighthouse audits)
- T087-T090 sequential (install, config, test, fix)
- T091-T097 can run in parallel [P] (manual verification)

**Deployment (Phase 7)**:
- T098-T116 must run sequentially (deployment process)

**Polish (Phase 8)**:
- T117-T124 can run in parallel [P] (documentation)
- T125-T129 sequential (template testing)
- T130-T132 can run in parallel [P] (code comments)
- T133-T135 sequential (final validation)

### Parallel Opportunities

**Maximum parallelization strategy**:

1. **Phase 1**: T002-T007 (6 tasks) in parallel after T001, then T010-T012 (3 tasks) in parallel
2. **Phase 2**: T015-T020, T028 (7 tasks) in parallel, then T022-T027 sequential, then validation
3. **Phase 3**: T031-T034 (4 tasks) in parallel, then sequential validation
4. **Phase 4**: T043-T058 (16 tasks) in parallel (both projects simultaneously), then validation
5. **Phase 6**: T081-T082, T085 in parallel, then tests, then T092 in parallel, then T096-T102 (7 tasks) in parallel
6. **Phase 8**: T122-T130 (9 tasks) in parallel, then T136-T139 (4 tasks) in parallel

**Team parallelization**:
- Developer A: US1 (homepage)
- Developer B: US2 Project 1 (devtoys-mcp)
- Developer C: US2 Project 2 (code-standards)
- Developer D: US3 (navigation) - waits for US1/US2 content
- All developers: Can work on Phase 1 and Phase 2 together

---

## Parallel Example: User Story 2

If working on US2 alone, maximum parallel work:

**Wave 1** (16 tasks in parallel):
```
T043: devtoys-mcp front matter
T044: devtoys-mcp Prerequisites
T045: devtoys-mcp Installation
T046: devtoys-mcp Quick Start
T047: devtoys-mcp Next Steps
T048: devtoys-mcp Troubleshooting
T049: devtoys-mcp FAQ
T050: devtoys-mcp Advanced Usage
T051: code-standards front matter
T052: code-standards Prerequisites
T053: code-standards Installation
T054: code-standards Quick Start
T055: code-standards Next Steps
T056: code-standards Troubleshooting
T057: code-standards FAQ
T058: code-standards Advanced Usage
```

**Wave 2** (sequential validation):
```
T059 → T060 → T061 → T062 → T063 → T064 → T065 → T066
```

---

## Implementation Strategy

**MVP First (Minimum Viable Product)**:
- Phase 1 (Setup) + Phase 2 (Foundational) + Phase 3 (US1) = Basic homepage
- This delivers SC-001: Visitors can identify projects
- Estimated: 9 setup + 16 foundational + 12 US1 = 37 tasks

**Incremental Delivery**:
- Add Phase 4 (US2): Project quickstart guides → Full MVP
- Delivers SC-002: One-click navigation to quickstarts
- Estimated: +24 tasks (total: 61 tasks)

**Polish MVP**:
- Add Phase 5 (US3): Enhanced navigation
- Add Phase 6 (Testing): Quality validation
- Estimated: +14 US3 + 22 testing = +36 tasks (total: 97 tasks)

**Production Ready**:
- Add Phase 7 (Deployment): Live site with custom domain
- Add Phase 8 (Polish): Documentation and maintainability
- Estimated: +19 deployment + 19 polish = +38 tasks (total: 135 tasks)

---

## Task Summary

- **Total Tasks**: 142
- **Setup Tasks**: 14 (Phase 1) - includes Docker setup
- **Foundational Tasks**: 16 (Phase 2)
- **User Story 1 Tasks**: 12 (Phase 3) - P1 MVP
- **User Story 2 Tasks**: 24 (Phase 4) - P2 Core Feature
- **User Story 3 Tasks**: 14 (Phase 5) - P3 Polish
- **Testing Tasks**: 22 (Phase 6)
- **Deployment Tasks**: 19 (Phase 7)
- **Polish Tasks**: 21 (Phase 8) - includes Docker documentation

**Parallelizable Tasks**: 56 tasks marked [P] (39.4% of total)

**Estimated Timeline** (single developer):
- MVP (US1 only): 42 tasks → ~5-7 days
- Full MVP (US1+US2): 66 tasks → ~9-11 days
- Production Ready (all phases): 142 tasks → ~16-21 days

**With Team** (3-4 developers):
- MVP: ~2-3 days
- Full MVP: ~4-5 days
- Production Ready: ~7-10 days

---

## Validation Checkpoints

After each phase, verify:

✅ **Phase 1**: Hugo site initialized, modules configured, Docker setup complete, builds succeed (both native and Docker)
✅ **Phase 2**: Configuration complete, GitHub Actions workflow created, local preview works
✅ **Phase 3**: Homepage renders with project list, responsive design works
✅ **Phase 4**: Both project quickstart pages complete with all 7 sections, accessible from homepage
✅ **Phase 5**: Navigation menu works on all pages, mobile menu functions
✅ **Phase 6**: All tests pass (htmltest, Lighthouse, pa11y), all success criteria met
✅ **Phase 7**: Site deployed to www.festina-lente.io with HTTPS, apex redirect works
✅ **Phase 8**: Documentation complete, template available, maintainability validated

---

**Generated**: 2025-12-25
**Path**: `specs/001-site-setup/tasks.md`
**Feature**: Project Showcase Website
**Technology Stack**: Hugo + Hextra + GitHub Pages + GitVersion
