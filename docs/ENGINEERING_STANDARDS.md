# Engineering Standards

## 1. Language and tooling

- Use the current stable Flutter + Dart toolchain at implementation time.
- Enable strict static analysis.
- Prefer immutable models.
- Format all code automatically.
- Keep CI green before merging.

## 2. State management

Use Riverpod.

Rules:
- providers define dependencies clearly
- avoid global mutable singletons
- keep widget-local UI state local
- keep domain/application state in app-core-facing providers

## 3. Navigation

Use `go_router`.

Rules:
- route names must be stable
- deep links are optional later, not required for MVP
- navigation state must not leak into recipe persistence

## 4. Modeling

Use `freezed` + `json_serializable` for:
- protocol models
- recipe documents
- persistence DTOs where sensible

Avoid loose `Map<String, dynamic>` plumbing except at clear serialization boundaries.

## 5. Persistence

Use `drift` + SQLite.

Rules:
- version the database carefully
- migrate with tested scripts
- store recipe documents as normalized JSON plus indexed fields
- do not store raw payload history by default
- use secure storage only for actual secrets/settings

## 6. Testing

### Minimum test pyramid
- unit tests for protocol/domain/operations
- widget tests for important generated forms and workbench interactions
- integration tests for core user flows
- migration tests for recipe and database changes
- example vector tests for each shipped operation

### Required test cases for operations
- happy path
- invalid input
- invalid params
- preview behavior
- reversibility where claimed
- diagnostics content where relevant

## 7. Performance

- anything medium/heavy runs off the main isolate
- avoid unnecessary object churn in tight loops
- cap preview sizes
- instrument execution timing in debug/dev
- benchmark representative operations before optimization work

## 8. Security and privacy

- never log raw payloads in production
- redact secret params in errors and debug output
- distinguish educational crypto from security-grade claims
- review third-party algorithm code provenance and licensing
- do not add remote execution without a new threat model review

## 9. Dependencies

Rules:
- every new dependency needs a reason
- prefer pure Dart packages in packs
- isolate platform-specific code behind interfaces
- keep transitive dependency footprint modest

## 10. Code structure

- widgets render; use cases orchestrate; packages own domain logic
- keep files focused
- favor composition over inheritance
- hide implementation detail behind clear interfaces

## 11. Error handling

- use structured errors, not just thrown strings
- convert exceptions at layer boundaries
- surface recovery hints in user-safe form
- preserve developer detail for debug/test only

## 12. Logging

Allowed in debug/dev:
- timings
- operation ids
- pack ids
- error codes

Not allowed in production logs by default:
- raw input/output payload
- secret params
- copied/imported user content

## 13. Analytics

If analytics are added later:
- event names only
- no payload capture
- no recipe contents by default
- explicit user controls if any learning/progress telemetry is stored

## 14. Accessibility and quality

UI work is incomplete without:
- semantic labels
- dynamic text testing
- contrast checks
- empty/loading/error states
- small-screen validation

## 15. CI recommendations

- static analysis
- unit tests
- widget tests
- integration smoke tests
- codegen check
- format check
- optional license/provenance audit script

## 16. Documentation standards

Every package should include:
- purpose
- public API surface
- dependency expectations
- testing notes

Every operation pack should document:
- operation list
- provenance/license notes
- learning bundle contents
