# Mobile Recipe Lab — Codex Pack

This folder is a **codex-ready handoff** for building a **mobile-first, Flutter-based recipe lab** inspired by CyberChef.

The product is **not** a desktop-port-in-a-phone-shell. It is a **touch-first recipe workbench** with a modular execution engine, versioned operation packs, saved recipes, and an embedded learning layer.

## What this pack contains

- `AGENTS.md` — rules and workflow for a coding agent
- `PRODUCT_SPEC.md` — vision, goals, users, features, release criteria
- `ARCHITECTURE.md` — layered architecture, runtime flows, package boundaries
- `EXECUTION_PROTOCOL.md` — protocol for operations, params, execution, results, diagnostics
- `RECIPE_SCHEMA.md` — durable recipe format and examples
- `PACK_SCHEMA.md` — operation-pack manifest format and examples
- `OPERATION_MODULE_TEMPLATE.md` — template and checklist for adding a new algorithm
- `REPO_STRUCTURE.md` — monorepo structure and dependency rules
- `UI_UX_GUIDELINES.md` — mobile interaction model and design rules
- `ENGINEERING_STANDARDS.md` — coding, testing, security, performance, analytics
- `TODO.md` — phased implementation backlog with acceptance criteria
- `OPEN_SOURCE_REUSE.md` — approach for selective CyberChef-inspired engine reuse
- `REFERENCES.md` — grounding links and architectural references

## Product thesis

Build a **local-first mobile recipe lab** that helps users:
1. transform data,
2. understand what each operation does,
3. save reusable recipes,
4. add algorithms over time without destabilizing the app.

## Core decisions already made

- **Client platform:** Flutter mobile app first
- **State management:** Riverpod
- **Routing:** `go_router`
- **Persistence:** SQLite via `drift`
- **Serialization/modeling:** `freezed` + `json_serializable`
- **Monorepo tooling:** `melos`
- **Execution model:** Dart-native first, isolate-backed for anything medium/heavy
- **Plugin/extensibility model:** versioned operation packs with strict manifests
- **Trust model:** local-first, offline-first, no remote execution in MVP
- **Primary abstraction:** recipe, not screen state

## Build order

1. Set up monorepo and packages.
2. Implement protocol and domain models.
3. Build registry and executor broker.
4. Add core text/encoding operations.
5. Build workbench UI.
6. Add persistence and saved recipes.
7. Add learning overlays and examples.
8. Harden compatibility, performance, and test coverage.

## MVP scope

Start with a high-value core pack:

- Base64 encode/decode
- Hex encode/decode
- URL encode/decode
- HTML entity encode/decode
- XOR
- ROT13 / Caesar
- JSON pretty/minify/validate
- Regex extract/replace
- MD5 / SHA-1 / SHA-256
- CRC32
- Gzip / Deflate if feasible in pure Dart
- JWT parse

## Explicit non-goals for v1

- Full CyberChef operation parity
- Desktop-style multi-pane UI
- Remote recipe execution
- Multi-user collaboration
- Cloud sync
- Arbitrary third-party runtime code loading
- Unbounded plugin execution privileges

## Release bar for v1

- Feels native on iOS and Android
- All heavy operations keep the UI responsive
- Recipes survive app upgrades
- New operations can be added without editing the core workbench screen
- Every shipped operation has examples and test vectors
- No network required for normal operation

## Suggested first tasks for an agent

1. Read `AGENTS.md`
2. Scaffold the monorepo in `REPO_STRUCTURE.md`
3. Implement the interfaces in `EXECUTION_PROTOCOL.md`
4. Add the example recipe and pack formats from `RECIPE_SCHEMA.md` and `PACK_SCHEMA.md`
5. Build the `core.text` and `core.hash` packs using `OPERATION_MODULE_TEMPLATE.md`
6. Wire a minimal workbench with input → recipe steps → output preview

## Working style for an agent

- Make small, reviewable changes.
- Protect backward compatibility for saved recipes.
- Keep UI concerns out of engine packages.
- Keep operation packages declarative and well-tested.
- Prefer clarity over cleverness.

## Naming convention

The working name used in these docs is **Mobile Recipe Lab**. Replace it later with the final product name without changing the architecture.

## References

See `REFERENCES.md` for source grounding and architecture notes.

## Android release path

Android installation from GitHub Releases is documented in [ANDROID_RELEASES.md](/Users/danyel-ii/CodeChef/docs/ANDROID_RELEASES.md).
