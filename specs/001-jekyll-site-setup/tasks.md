# Tasks: Jekyll Website with Project Showcase

**Branch**: `001-jekyll-site-setup`  
**Date**: 2025-12-25  
**Input**: Design documents from `/specs/001-jekyll-site-setup/`

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic Jekyll structure

- [ ] T001 Create Gemfile with GitHub Pages dependencies and Minimal Mistakes theme
- [ ] T002 Create .gitignore to exclude _site/, .jekyll-cache/, .sass-cache/, Gemfile.lock (until first successful build)
- [ ] T003 [P] Create CNAME file with content "www.festina-lente.io"
- [ ] T004 [P] Create README.md with project overview, setup instructions, and contribution guidelines

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

- [ ] T005 Configure _config.yml with site metadata (title, description, url, repository) per contracts/config-schema.yml
- [ ] T006 Configure _config.yml with Minimal Mistakes theme settings (remote_theme, minimal_mistakes_skin: "contrast") per contracts/config-schema.yml
- [ ] T007 Configure _config.yml with Jekyll plugins (jekyll-feed, jekyll-seo-tag, jekyll-sitemap, jekyll-include-cache) per contracts/config-schema.yml
- [ ] T008 Configure _config.yml with collections settings (projects: output: true, permalink: /projects/:name/) per contracts/config-schema.yml
- [ ] T009 Configure _config.yml with front matter defaults for projects collection per contracts/config-schema.yml
- [ ] T010 Configure _config.yml with markdown settings (kramdown, GFM input) per contracts/config-schema.yml
- [ ] T011 [P] Create _data/navigation.yml with initial structure per contracts/navigation-schema.yml
- [ ] T012 [P] Create assets/images/ directory for image assets
- [ ] T013 Test local build with bundle install and bundle exec jekyll serve

**Checkpoint**: Foundation ready - content and feature implementation can now begin in parallel

---

## Phase 3: User Story 1 - View Project Portfolio (Priority: P1) 🎯 MVP

**Goal**: Visitors can land on homepage and see all projects with descriptions and navigation links

**Independent Test**: Navigate to homepage, verify all projects are listed with descriptions and clickable links. Deliverable value: project portfolio is visible.

### Implementation for User Story 1

- [ ] T014 [P] [US1] Create index.md homepage with splash layout per contracts/homepage-schema.md
- [ ] T015 [P] [US1] Configure homepage front matter (layout: splash, title, excerpt, permalink: /) in index.md
- [ ] T016 [US1] Add header section to index.md (overlay_color, overlay_filter, optional overlay_image)
- [ ] T017 [US1] Add intro section to index.md with site description
- [ ] T018 [US1] Create feature_row in index.md for displaying projects (using Liquid to iterate _projects collection)
- [ ] T019 [US1] Add Liquid template code to dynamically generate feature rows from site.projects sorted by order field
- [ ] T020 [US1] Update _data/navigation.yml with "Home" link (title: "Home", url: "/")
- [ ] T021 [US1] Test homepage locally - verify splash layout renders, projects listed (even if empty), responsive design
- [ ] T022 [US1] Verify homepage meets Lighthouse scores locally (Performance ≥90, Accessibility ≥95, Best Practices ≥90, SEO ≥95)

**Checkpoint**: Homepage is functional with splash layout. Project portfolio display mechanism ready (will show projects once they're created in US2).

---

## Phase 4: User Story 2 - Access Project Quickstart Guides (Priority: P2)

**Goal**: Visitors can navigate to project quickstart pages and read setup instructions

**Independent Test**: Click through to any project page, verify content is accessible and properly formatted. Deliverable value: project onboarding documentation.

### Implementation for User Story 2

- [ ] T023 [P] [US2] Create _projects directory at repository root
- [ ] T024 [P] [US2] Create _projects/devtoys-mcp.md with complete front matter per contracts/project-schema.md
- [ ] T025 [P] [US2] Create _projects/code-standards.md with complete front matter per contracts/project-schema.md
- [ ] T026 [US2] Add Prerequisites section to _projects/devtoys-mcp.md (Node.js 18+, Claude Desktop, CLI familiarity)
- [ ] T027 [US2] Add Installation section to _projects/devtoys-mcp.md (clone, npm install, build steps)
- [ ] T028 [US2] Add Quick Start section to _projects/devtoys-mcp.md (Claude Desktop config, restart, test command)
- [ ] T029 [US2] Add Next Steps section to _projects/devtoys-mcp.md (explore tools, advanced config, GitHub link)
- [ ] T030 [US2] Add Troubleshooting section to _projects/devtoys-mcp.md (common problems and solutions)
- [ ] T031 [US2] Add FAQ section to _projects/devtoys-mcp.md (What is MCP?, compatibility, open source)
- [ ] T032 [US2] Add Advanced Usage section to _projects/devtoys-mcp.md (custom tools, CI/CD, performance tuning)
- [ ] T033 [P] [US2] Add Prerequisites section to _projects/code-standards.md
- [ ] T034 [P] [US2] Add Installation section to _projects/code-standards.md
- [ ] T035 [P] [US2] Add Quick Start section to _projects/code-standards.md
- [ ] T036 [P] [US2] Add Next Steps section to _projects/code-standards.md
- [ ] T037 [P] [US2] Add Troubleshooting section to _projects/code-standards.md
- [ ] T038 [P] [US2] Add FAQ section to _projects/code-standards.md
- [ ] T039 [P] [US2] Add Advanced Usage section to _projects/code-standards.md
- [ ] T040 [US2] Verify both project pages build successfully and content renders properly with TOC
- [ ] T041 [US2] Test project page accessibility (keyboard navigation, heading hierarchy, link text)
- [ ] T042 [US2] Verify external repo_url links open in new tabs
- [ ] T043 [US2] Test homepage now displays both projects in feature rows with correct order

**Checkpoint**: Both project quickstart pages are complete and accessible. Homepage displays project portfolio. Users can navigate from homepage to project details.

---

## Phase 5: User Story 3 - Navigate Site Structure (Priority: P3)

**Goal**: Visitors can easily move between sections using consistent navigation menu

**Independent Test**: Navigate through all pages, verify navigation menu appears and links work correctly. Deliverable value: improved usability.

### Implementation for User Story 3

- [ ] T044 [US3] Update _data/navigation.yml to add DevToys MCP link (title: "DevToys MCP", url: "/projects/devtoys-mcp/")
- [ ] T045 [US3] Update _data/navigation.yml to add Code Standards link (title: "Code Standards", url: "/projects/code-standards/")
- [ ] T046 [US3] Verify navigation menu appears on all pages (homepage, both project pages)
- [ ] T047 [US3] Test navigation links work correctly (click each link, verify correct page loads)
- [ ] T048 [US3] Test mobile navigation (hamburger menu appears on small screens, expands correctly)
- [ ] T049 [US3] Verify current page indicator in navigation (if supported by theme)
- [ ] T050 [US3] Test keyboard navigation through menu items (Tab key, Enter to activate)
- [ ] T051 [US3] Verify breadcrumbs display correctly (if enabled in theme for project pages)

**Checkpoint**: All navigation is functional across all pages. Site usability is polished.

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories and final deployment preparation

- [ ] T052 [P] Optimize placeholder/sample images in assets/images/ (compress to <50KB for teasers, <200KB for headers)
- [ ] T053 [P] Ensure all images have descriptive alt text per accessibility requirements
- [ ] T054 [P] Add custom CSS overrides in assets/css/main.scss if needed (only if default theme insufficient)
- [ ] T055 Run HTML-Proofer to validate all internal links: bundle exec htmlproofer ./_site --disable-external
- [ ] T056 Run full Lighthouse audit on all pages (homepage, both project pages) and verify scores meet SC-003
- [ ] T057 Test responsive design on mobile (320px), tablet (768px), and desktop (1920px+) viewports
- [ ] T058 Verify site builds successfully without warnings: bundle exec jekyll build
- [ ] T059 Review _config.yml for inline documentation completeness (Constitution Principle II)
- [ ] T060 Verify all front matter follows documented schemas in contracts/
- [ ] T061 Test site with JavaScript disabled (should still be functional for static content)
- [ ] T062 [P] Update README.md with deployment instructions and custom domain configuration
- [ ] T063 Verify CNAME file is present and correct for GitHub Pages custom domain
- [ ] T064 Final review of quickstart.md validation procedures

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup (Phase 1) completion - BLOCKS all user stories
- **User Story 1 (Phase 3)**: Depends on Foundational (Phase 2) completion
- **User Story 2 (Phase 4)**: Depends on Foundational (Phase 2) completion - Can run parallel with US1 except T043 needs T018-T019
- **User Story 3 (Phase 5)**: Depends on US2 completion (needs project pages to exist for navigation)
- **Polish (Phase 6)**: Depends on all user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Independent after Foundational - Creates homepage with project display mechanism
- **User Story 2 (P2)**: Independent after Foundational - Creates project content (T043 integrates with US1's feature rows)
- **User Story 3 (P3)**: Depends on US2 - Navigation links need project pages to exist

### Within Each User Story

**User Story 1**:
- T014-T017 can be done in parallel (different sections of same file, resolve conflicts)
- T018-T019 must be sequential (feature rows depend on Liquid logic)
- T020-T022 sequential after content complete

**User Story 2**:
- T023 must be first (directory creation)
- T024-T025 parallel (different files)
- T026-T032 sequential for devtoys-mcp (same file sections)
- T033-T039 parallel with T026-T032 (different file: code-standards)
- T040-T043 sequential after content complete (testing)

**User Story 3**:
- All tasks sequential (editing same file, testing navigation)

### Parallel Opportunities

**Phase 1** (all parallel):
- T001, T003, T004 (different files)

**Phase 2** (partial parallel):
- T005-T010 sequential (same file: _config.yml)
- T011-T012 parallel with each other and after T010 (different locations)
- T013 must be last (testing)

**User Story 1**:
- T014-T015 parallel (can work on different sections)

**User Story 2**:
- T024-T025 parallel (different project files)
- T026-T032 (devtoys-mcp) parallel with T033-T039 (code-standards) - different files

**Phase 6**:
- T052-T054 parallel (different concerns)
- T062-T063 parallel (different files)

---

## Parallel Example: User Story 2

```bash
# Create both project files simultaneously:
Task T024: "Create _projects/devtoys-mcp.md with front matter"
Task T025: "Create _projects/code-standards.md with front matter"

# Add content to both projects in parallel:
Task T026-T032: "Add all sections to devtoys-mcp.md"
Task T033-T039: "Add all sections to code-standards.md"
```

---

## Implementation Strategy

### MVP First (User Story 1 + User Story 2 Core)

1. Complete Phase 1: Setup → Basic project structure exists
2. Complete Phase 2: Foundational → Jekyll configured, ready for content
3. Complete Phase 3: User Story 1 → Homepage with splash layout ready
4. Complete Phase 4: User Story 2 → Both project pages with quickstart content
5. **STOP and VALIDATE**: Test homepage shows projects, project pages accessible
6. This is a deployable MVP - users can view portfolio and read quickstart guides

### Incremental Delivery

1. **MVP** (US1 + US2): Homepage + Project quickstart pages → Deploy/Demo
2. **Enhanced** (+US3): Add navigation menu → Deploy/Demo
3. **Polished** (+Phase 6): Optimized images, full testing → Final Deploy

### Parallel Team Strategy

With multiple developers:

1. **Together**: Complete Phase 1 + Phase 2 (foundation)
2. **Parallel** (after Phase 2):
   - Developer A: User Story 1 (T014-T022)
   - Developer B: User Story 2 devtoys-mcp (T023-T032, T040-T042)
   - Developer C: User Story 2 code-standards (T033-T039)
3. **Sequential**: Developer A integrates T043 after US1 feature rows ready
4. **Together**: User Story 3 (small, can be one developer)
5. **Parallel**: Polish tasks T052-T054, T062-T063

---

## Suggested MVP Scope

**Minimum Viable Product** = Phase 1 + Phase 2 + Phase 3 (US1) + Phase 4 (US2)

This delivers:
- ✅ Functioning Jekyll website with Minimal Mistakes theme
- ✅ Homepage displaying project portfolio (SC-001: identify projects in <10 seconds)
- ✅ Two project quickstart pages with complete documentation (SC-002: navigate to quickstart in one click)
- ✅ Responsive design (SC-004)
- ✅ GitHub Pages deployment ready (SC-005)

**Can defer to v2**:
- Navigation menu (User Story 3) - Homepage feature rows provide basic navigation
- Image optimization (Phase 6) - Can use placeholder images initially
- Advanced polish items

---

## Notes

- **Tests NOT included**: Specification does not explicitly request TDD or automated tests. Testing is manual verification via browser and Lighthouse.
- **[P] tasks**: Different files or independent sections, no conflicts
- **[Story] label**: Maps task to specific user story for traceability
- Each user story independently completable and testable
- Commit after completing each task or logical group
- Stop at checkpoints to validate story independently
- Constitution compliance verified in plan.md Phase 1 re-evaluation

---

## Task Summary

- **Total Tasks**: 64
- **Setup (Phase 1)**: 4 tasks
- **Foundational (Phase 2)**: 9 tasks (BLOCKING)
- **User Story 1 (Phase 3)**: 9 tasks
- **User Story 2 (Phase 4)**: 21 tasks
- **User Story 3 (Phase 5)**: 8 tasks
- **Polish (Phase 6)**: 13 tasks
- **Parallel Opportunities**: 15+ tasks can run in parallel across different phases
- **MVP Task Count**: 43 tasks (Phase 1 + 2 + 3 + 4)
