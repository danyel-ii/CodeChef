# Architecture — Mobile Recipe Lab

## 1. Architectural goal

Separate the product into replaceable layers so the app can:
- add operations without changing the core UI,
- evolve storage and execution independently,
- stay responsive on mobile,
- and preserve saved recipe compatibility over time.

## 2. Top-level layers

```text
┌──────────────────────────────────────────────────────────────┐
│                         apps/mobile                          │
│    navigation · screens · widgets · generated parameter UI  │
└──────────────────────────────────────────────────────────────┘
┌──────────────────────────────────────────────────────────────┐
│                         app_core                             │
│   use cases · orchestration · view models · policies        │
└──────────────────────────────────────────────────────────────┘
┌──────────────────────────────────────────────────────────────┐
│ recipe_domain · execution_protocol · operation_registry      │
│ stable types · manifests · recipes · diagnostics · packs     │
└──────────────────────────────────────────────────────────────┘
┌──────────────────────────────────────────────────────────────┐
│ executor_broker                                              │
│ routes work to dart, isolate, ffi, or future backends        │
└──────────────────────────────────────────────────────────────┘
┌──────────────────────────────────────────────────────────────┐
│ executor_isolate · engine adapters                           │
│ background execution · cancellation · preview execution      │
└──────────────────────────────────────────────────────────────┘
┌──────────────────────────────────────────────────────────────┐
│ operation packs                                              │
│ core.text · core.hash · core.format · future packs           │
└──────────────────────────────────────────────────────────────┘
┌──────────────────────────────────────────────────────────────┐
│ drift/sqlite · secure storage · file system                  │
│ recipes · history · favorites · settings                     │
└──────────────────────────────────────────────────────────────┘
```

## 3. Architectural principles

### 3.1 Keep UI thin
Widgets should render state and dispatch intents.
They should not implement transforms, migrations, or pack loading rules.

### 3.2 Keep domain durable
Recipe and operation types must outlive UI redesigns.

### 3.3 Use manifests, not ad hoc wiring
Operations are discovered and rendered from metadata.

### 3.4 Isolate heavy work
Mobile smoothness is a feature, not a nice-to-have.

### 3.5 Assume future expansion
The protocol should support:
- more packs,
- more payload kinds,
- streaming later,
- optional native/FFI backends later.

## 4. Core packages

## 4.1 `packages/execution_protocol`
Purpose:
- immutable shared contracts used by engine, packs, registry, and UI

Contains:
- payload models
- parameter schema models
- operation manifest types
- execution request/result types
- diagnostics and errors
- capability flags
- migration descriptors

Must not depend on Flutter UI code.

## 4.2 `packages/recipe_domain`
Purpose:
- durable recipe models and compatibility logic

Contains:
- recipe document
- step references
- version compatibility helpers
- recipe validation
- recipe migration registry

## 4.3 `packages/operation_registry`
Purpose:
- load operation packs
- validate manifests
- expose searchable operation catalog
- resolve operation by id + version range

Contains:
- pack loader
- operation index
- category index
- search tags
- deprecation mapping

## 4.4 `packages/executor_broker`
Purpose:
- choose the correct runtime path for an operation

Responsibilities:
- route to lightweight in-process execution
- spawn or reuse background isolates
- pass cancellation tokens
- gather metrics
- normalize results/errors

## 4.5 `packages/executor_isolate`
Purpose:
- execute requests in background isolates
- maintain worker pool if needed later
- support cancellation and preview mode

## 4.6 operation packs
Each pack:
- declares a manifest
- registers operations
- ships tests and learning content
- has an explicit version

## 4.7 `packages/app_core`
Purpose:
- orchestrate product use cases

Examples:
- run recipe
- add step
- duplicate step
- validate params
- save recipe
- export recipe
- import recipe
- fetch operation explanations
- open example into workbench

## 4.8 `apps/mobile`
Purpose:
- app shell, navigation, interaction design, platform integration

Contains:
- Home
- Workbench
- Operation Browser
- Learn
- Library
- Settings/Debug

## 5. Data flow

## 5.1 Interactive recipe execution

```text
User input
  ↓
Workbench state
  ↓
Recipe document
  ↓
Execution request
  ↓
Executor broker
  ↓
Isolate/native backend
  ↓
Execution result + diagnostics
  ↓
Workbench render
```

## 5.2 Operation discovery

```text
Pack manifests
  ↓
Registry validation
  ↓
Searchable catalog
  ↓
Generated parameter UI + docs
```

## 5.3 Save/load flow

```text
Recipe document
  ↓
Recipe validator
  ↓
Recipe migrator if needed
  ↓
Persistence store (drift/sqlite)
  ↓
Load + revalidate on open
```

## 6. Runtime models

## 6.1 Payload
A payload is a typed envelope around the data flowing through a recipe.
Initial kinds:
- `text`
- `bytes`
- `json`
- `lines`

The engine may normalize intermediate results while preserving the user-facing view mode.

## 6.2 Recipe
A recipe is an ordered list of steps plus metadata and compatibility constraints.

## 6.3 Step
A step references:
- operation id
- requested version range
- parameters
- enabled state

## 6.4 Execution request
Contains:
- input payload
- recipe
- preview mode flag
- cancellation token
- execution options

## 6.5 Execution result
Contains:
- output payload
- diagnostics
- step traces
- metrics
- warnings
- normalized error if failed

## 7. Execution backends

## 7.1 Dart-native
Use for:
- lightweight string/bytes transforms
- formatting
- basic hashing
- regex

Benefits:
- simple
- portable
- easy to test

## 7.2 Isolate-backed Dart
Use for:
- medium/heavy transforms
- large payload handling
- compression
- crypto with meaningful latency

This is the default non-trivial path.

## 7.3 Optional FFI backend
Reserve for later if:
- a transform needs native performance
- an audited native implementation is clearly better
- platform-specific APIs are necessary

FFI must be hidden behind the same execution protocol.

## 7.4 No remote execution in MVP
Remote backends are out of scope.

## 8. Search architecture

Operation discovery should be powered by metadata:
- title
- aliases
- tags
- category
- learning keywords
- examples

Search must return sensible results even for novice wording.

## 9. Persistence architecture

Use SQLite through `drift`.

Tables likely needed:
- recipes
- recipe_revisions
- favorites
- recent_operations
- installed_pack_versions
- settings
- optional example completion progress

Do not store raw user payload history by default.
If a history feature is added, make it explicit and local-only.

## 10. Error model

Errors must be structured, not just strings.

Categories:
- invalid params
- invalid input format
- unsupported payload kind
- cancelled
- migration required
- backend unavailable
- execution failure
- output too large
- internal bug

Every error should include:
- code
- user-safe message
- developer detail
- step context when relevant

## 11. Compatibility strategy

### Operation compatibility
- operations have stable ids
- versions use semver
- deprecations declare replacements
- packs may ship migration rules

### Recipe compatibility
- recipe document includes schema version
- app migrates old recipes on load
- operations may provide parameter migration hooks

## 12. Learning content architecture

Learning content must be separate from operation logic.

Each operation can attach:
- explanation markdown
- example vectors
- misconceptions
- related operations
- difficulty level
- challenge prompts later

This separation lets education content evolve faster than engine code.

## 13. Security model

- local-first processing
- no silent network use
- avoid logging raw payloads
- secure storage only for actual secrets/settings
- clearly label toy ciphers vs security-sensitive operations
- preserve license/provenance for reused code

## 14. Performance model

- keep the main isolate free for rendering
- debounce live preview intelligently
- cap preview size
- allow explicit full-output expansion
- prepare for incremental execution later
- instrument per-step timing in debug builds

## 15. Observability

Minimum in MVP:
- crash reporting hook point
- debug execution metrics
- no payload-content analytics
- event names only around navigation and generic interaction

## 16. Future-proofing

The architecture should support:
- batch mode
- streaming payloads
- side-by-side diffing
- operation packs beyond core security/dev transforms
- optional desktop/web targets later
