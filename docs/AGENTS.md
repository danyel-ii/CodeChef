# AGENTS.md

## Mission

Build a **slick, touch-first mobile recipe lab** inspired by CyberChef, using Flutter and a modular operation protocol.

The app must feel like a **native mobile product**, not a desktop website wrapped in a WebView.

## Primary outcome

A user can enter or import data, compose a recipe from operations, preview the output live, save the recipe, and learn what each step does.

## Non-negotiable rules

### 1) Recipe is the primary abstraction
Persist recipes as durable domain objects.
Do **not** persist view models or screen-specific layout state as the recipe format.

### 2) Engine and UI must remain separate
`packages/engine_*` and `packages/operation_*` must not depend on Flutter widgets.
Business logic must not live in UI widgets.

### 3) New operations must be metadata-driven
If adding an operation requires hardcoding a custom workbench screen, stop and redesign the schema/UI contract first.

### 4) Heavy work must not block the UI
Any medium/heavy transform must run off the main isolate.

### 5) Local-first by default
No remote execution in MVP.
No silent data upload.
No analytics events containing user input/output payloads.

### 6) Backward compatibility matters
Saved recipes must remain loadable across app upgrades whenever possible.
If a format changes, add migration logic.

### 7) Pack boundaries matter
Operations belong to packs.
Packs declare versions, dependencies, licenses, and learning content refs.

### 8) Learning content is first-class
Every shipped operation should expose:
- a plain-language explanation,
- at least one example,
- edge-case notes,
- related operations.

### 9) No desktop-first UI metaphors
Do not reproduce the classic multi-pane CyberChef layout.
Prefer bottom sheets, cards, segmented views, full-screen flows, and touch-safe controls.

### 10) Prefer explicitness
Use typed models, explicit diagnostics, explicit migrations, and explicit capabilities.

## Technology choices

- Flutter (current stable at implementation time)
- Dart (current stable paired with Flutter stable)
- Riverpod for app state and dependency injection
- `go_router` for navigation
- `freezed` + `json_serializable` for immutable models
- `drift` + SQLite for local persistence
- `melos` for monorepo management
- isolate-backed execution for non-trivial transforms
- optional FFI only for well-justified cases

## Initial package plan

- `apps/mobile`
- `packages/app_core`
- `packages/design_system`
- `packages/recipe_domain`
- `packages/execution_protocol`
- `packages/operation_registry`
- `packages/executor_broker`
- `packages/executor_isolate`
- `packages/pack_core_text`
- `packages/pack_core_hash`
- `packages/pack_core_format`
- `packages/pack_learning_content`

## Order of implementation

1. Set up monorepo and CI basics.
2. Implement immutable protocol/domain models.
3. Build the operation registry and pack manifest loader.
4. Build the executor broker and isolate executor.
5. Implement a minimal text payload pipeline.
6. Add `core.text` pack.
7. Build minimal workbench UI.
8. Add save/load recipe.
9. Add `core.hash` and `core.format` packs.
10. Add operation explanation cards and examples.
11. Polish mobile interactions and accessibility.

## Definition of done for any operation

A new operation is not done until it has:

- manifest metadata
- parameter schema
- engine implementation
- unit tests
- golden/example test vectors
- at least one learning example
- migration strategy if it replaces/deprecates another op
- documented reversibility and safety notes

## Definition of done for any feature

A feature is not done until it has:

- passing tests
- loading/error/empty states
- accessibility labels where relevant
- no UI jank under normal input sizes
- offline behavior defined
- telemetry decisions documented
- persistence/migration impact reviewed

## Dependency rules

- UI packages may depend on domain/protocol packages.
- Protocol/domain packages must not depend on Flutter UI packages.
- Operation packs may depend on pure Dart libraries only unless an exception is explicitly documented.
- Platform channels or FFI must be isolated behind a narrow interface.

## Security rules

- Treat user payloads as sensitive.
- Never log raw payloads in production.
- Do not silently keep secrets longer than necessary.
- Distinguish clearly between encoding, toy ciphers, and real cryptography.
- Prefer constant-time or audited primitives where security claims matter.

## Performance rules

- Use isolates for heavy transforms.
- Provide cancellation for long-running work.
- Truncate huge previews safely.
- Avoid repeated full-pipeline recomputation when only one step changes; design for incremental execution later.
- Keep startup fast by loading only required packs.

## UI rules

- Minimum touch target: 44x44 logical pixels
- One-handed reach and bottom-up interaction preferred
- Show bytes/text mode clearly
- Make recipe steps reorderable without requiring precise drag handles
- Use previews and examples generously
- Never hide errors behind generic “something went wrong”

## PR guidance for an agent

When opening a PR, include:

- what changed
- why it changed
- architecture impact
- migration impact
- tests added
- screenshots or recordings for UI changes
- follow-up work

## Things to avoid

- giant one-shot refactors
- cross-layer shortcuts
- JSON maps everywhere instead of typed models
- magic strings for operation ids
- engine logic inside widgets
- keeping runtime state in global singletons unless explicitly justified

## If you must choose

Prefer:
- simpler protocol over clever protocol
- safer persistence over premature optimization
- fewer polished operations over many shallow ones
- explicit versioning over hidden assumptions
