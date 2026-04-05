# Repository Structure

## 1. Monorepo choice

Use a Flutter/Dart monorepo managed with `melos`.

Why:
- multiple packages with clean boundaries
- shared protocol/domain types
- isolated testing
- pack-by-pack development
- easier CI and code generation

## 2. Proposed tree

```text
mobile-recipe-lab/
  melos.yaml
  pubspec.yaml
  analysis_options.yaml
  README.md
  AGENTS.md

  apps/
    mobile/
      lib/
      test/
      integration_test/
      pubspec.yaml

  packages/
    app_core/
      lib/
      test/
      pubspec.yaml

    design_system/
      lib/
      test/
      pubspec.yaml

    execution_protocol/
      lib/
      test/
      pubspec.yaml

    recipe_domain/
      lib/
      test/
      pubspec.yaml

    operation_registry/
      lib/
      test/
      pubspec.yaml

    executor_broker/
      lib/
      test/
      pubspec.yaml

    executor_isolate/
      lib/
      test/
      pubspec.yaml

    persistence_drift/
      lib/
      test/
      pubspec.yaml

    pack_core_text/
      lib/
      assets/
      test/
      pubspec.yaml

    pack_core_hash/
      lib/
      assets/
      test/
      pubspec.yaml

    pack_core_format/
      lib/
      assets/
      test/
      pubspec.yaml

    pack_learning_content/
      lib/
      assets/
      test/
      pubspec.yaml

  tooling/
    scripts/
    ci/
    licenses/

  docs/
    PRODUCT_SPEC.md
    ARCHITECTURE.md
    EXECUTION_PROTOCOL.md
    RECIPE_SCHEMA.md
    PACK_SCHEMA.md
```

## 3. Package responsibilities

## `apps/mobile`
Flutter app shell, screens, navigation, platform integrations.

## `packages/design_system`
Theme tokens, shared components, spacing, typography, icon wrappers, cards, bottom sheets, generated form widgets.

## `packages/app_core`
Application use cases and orchestration:
- run recipe
- save recipe
- import recipe
- build operation-search model
- open example into workbench

## `packages/execution_protocol`
Shared immutable contracts.

## `packages/recipe_domain`
Recipe models, validation, migrations.

## `packages/operation_registry`
Pack loading, manifest validation, search indexing, operation resolution.

## `packages/executor_broker`
Routes requests to the correct runtime.

## `packages/executor_isolate`
Background execution service.

## `packages/persistence_drift`
Database schema, DAOs, migration code.

## `packages/pack_*`
Shippable operation bundles and learning assets.

## 4. Dependency rules

### Allowed
- `apps/mobile` → `app_core`, `design_system`, `recipe_domain`, `operation_registry`, `persistence_drift`
- `app_core` → `recipe_domain`, `execution_protocol`, `operation_registry`, `executor_broker`, `persistence_drift`
- `operation_registry` → `execution_protocol`
- `executor_broker` → `execution_protocol`, `recipe_domain`
- `executor_isolate` → `execution_protocol`, `recipe_domain`
- `pack_*` → `execution_protocol`

### Forbidden
- `execution_protocol` → any Flutter UI package
- `recipe_domain` → `apps/mobile`
- `pack_*` → `apps/mobile`
- `pack_*` → `persistence_drift`
- `executor_*` → widget code

## 5. Code generation

Use codegen for:
- freezed models
- json serialization
- drift database models
- maybe generated operation-search indexes later

Keep generated files out of hand-written business logic.

## 6. Recommended tooling

- `melos`
- `build_runner`
- `dart format`
- `flutter test`
- `dart test`
- CI lint + test matrix
- optional `very_good_analysis` or custom strict analysis profile

## 7. Suggested module boundaries inside app

Inside `apps/mobile/lib/`:

```text
lib/
  app/
    bootstrap/
    router/
    theme/
  features/
    home/
    workbench/
    operation_browser/
    learn/
    library/
    settings/
  shared/
    widgets/
    state/
    utils/
```

## 8. Workbench substructure

```text
features/workbench/
  application/
  presentation/
  widgets/
  state/
  models/
```

Keep:
- domain models in packages
- screen-only models local to the feature

## 9. Testing layout

- package-local unit tests
- app integration tests under `apps/mobile/integration_test`
- pack example vector tests near the pack
- optional performance smoke tests near executor packages

## 10. Future expansion

Reserve space for later:
- `executor_ffi`
- `pack_core_crypto_basic`
- `pack_network_parsers`
- `pack_ctf`
- `desktop` or `web` app targets
