# TODO / Delivery Plan

This backlog is organized for a coding agent.

## Phase 0 — Monorepo scaffold

### Tasks
- [ ] Create Flutter/Dart monorepo with `melos`
- [ ] Add root analysis options and CI skeleton
- [ ] Create package skeletons from `REPO_STRUCTURE.md`
- [ ] Configure codegen for `freezed`, `json_serializable`, and `drift`

### Acceptance criteria
- repo bootstraps with one command
- all packages analyze cleanly
- placeholder tests run in CI

---

## Phase 1 — Protocol and domain

### Tasks
- [ ] Implement payload models
- [ ] Implement parameter schema models
- [ ] Implement operation manifest models
- [ ] Implement execution request/result/error models
- [ ] Implement recipe document models
- [ ] Implement recipe validation helpers
- [ ] Implement initial migration interfaces

### Acceptance criteria
- protocol models serialize/deserialize
- recipe example from `RECIPE_SCHEMA.md` round-trips
- structured errors and diagnostics are modeled

---

## Phase 2 — Registry and executors

### Tasks
- [ ] Implement pack manifest loader
- [ ] Implement operation registry
- [ ] Implement operation search index
- [ ] Implement executor broker
- [ ] Implement background isolate executor
- [ ] Add cancellation support
- [ ] Add preview-mode support

### Acceptance criteria
- registry loads at least one pack
- a recipe can execute through the broker
- heavy work can execute without blocking UI
- structured diagnostics flow back to the app

---

## Phase 3 — First packs

### `core.text`
- [ ] Base64 encode
- [ ] Base64 decode
- [ ] Hex encode
- [ ] Hex decode
- [ ] URL encode
- [ ] URL decode
- [ ] HTML entity encode/decode
- [ ] XOR
- [ ] Caesar / ROT13

### `core.hash`
- [ ] MD5
- [ ] SHA-1
- [ ] SHA-256
- [ ] CRC32

### `core.format`
- [ ] JSON pretty
- [ ] JSON minify
- [ ] JSON validate
- [ ] regex extract
- [ ] regex replace
- [ ] line split/join/filter
- [ ] JWT parse

### Acceptance criteria
- every operation has manifest, schema, tests, and examples
- packs are searchable
- learning refs exist for every shipped operation

---

## Phase 4 — Mobile shell and workbench

### Tasks
- [ ] Create app shell and routing
- [ ] Build Home screen
- [ ] Build Workbench screen
- [ ] Build Operation Browser
- [ ] Build generated parameter editor
- [ ] Build Output viewer with text/bytes modes
- [ ] Build step reordering and disable/remove actions
- [ ] Add import/export/copy actions

### Acceptance criteria
- users can run a multi-step recipe on mobile
- no desktop-style pane dependency
- workbench feels good in portrait mode

---

## Phase 5 — Persistence and library

### Tasks
- [ ] Implement `drift` database schema
- [ ] Save/load recipe documents
- [ ] Add favorites
- [ ] Add recent operations
- [ ] Build Library screen
- [ ] Add recipe duplication/rename/delete

### Acceptance criteria
- saved recipes survive restart
- migrations are tested
- library is searchable and stable

---

## Phase 6 — Learning layer

### Tasks
- [ ] Render operation explanations
- [ ] Render examples and “try this” CTA
- [ ] Show gotchas and related operations
- [ ] Add step-level “learn more” affordance
- [ ] Add starter templates/examples

### Acceptance criteria
- every v1 operation has usable explanatory content
- users can run examples directly into the workbench

---

## Phase 7 — Polish and hardening

### Tasks
- [ ] Accessibility pass
- [ ] dark/light theme validation
- [ ] loading/error/empty-state pass
- [ ] preview truncation and full-output handling
- [ ] performance profiling on representative devices
- [ ] license/provenance audit
- [ ] docs cleanup

### Acceptance criteria
- stable on iOS and Android
- responsive during normal workflows
- no high-severity accessibility gaps
- provenance notes exist for reused code

---

## Stretch backlog

- [ ] challenge mode
- [ ] guided labs
- [ ] YAML ↔ JSON
- [ ] gzip/deflate
- [ ] batch mode
- [ ] richer byte inspector
- [ ] optional FFI backend for selected operations
- [ ] optional desktop target later
