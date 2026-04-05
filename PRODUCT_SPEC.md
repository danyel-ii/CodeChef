# Product Spec — Mobile Recipe Lab

## 1. Vision

Create a **mobile-first recipe lab** that lets users transform data, understand the transformations, and save reusable workflows.

The app should feel:
- fast,
- trustworthy,
- educational,
- modern,
- and comfortable on a phone.

## 2. Product statement

Mobile Recipe Lab is a local-first Flutter app for assembling step-based transformation recipes over text and bytes, with modular operation packs and embedded learning content.

## 3. Problem

Users often need to:
- decode or transform payloads,
- inspect text vs bytes,
- format JSON or extract data,
- parse tokens or hashes,
- repeat multi-step workflows,
- and understand *why* an operation helps.

Desktop tools are powerful, but on phones they often feel cramped, dense, or non-native.

## 4. Product principles

### Mobile-first, not desktop-shrunk
Every primary flow must work cleanly on a phone in portrait mode.

### Tool + teacher
The app is a practical workbench and a guided learning surface.

### Local-first
Normal use should require no network.

### Recipes over one-offs
The app should encourage repeatable workflows rather than throwaway single-step transforms.

### Modular growth
Operations, learning content, and packs must be addable over time.

## 5. Target users

### Primary
- security learners
- CTF learners
- junior analysts
- developers who need quick data transforms
- students learning encoding/crypto/data formats

### Secondary
- practitioners who want quick utility workflows on mobile
- educators who want demoable examples
- incident responders doing lightweight field transforms

## 6. Key jobs to be done

1. “I pasted a weird string. Help me decode it.”
2. “I need to repeat a set of transforms reliably.”
3. “I want to learn what this operation does.”
4. “I want to compare text view, bytes view, and output.”
5. “I want to save and share a recipe.”

## 7. Goals

### MVP goals
- Build a stable workbench for text/byte transforms.
- Support versioned saved recipes.
- Ship a high-value curated operation core.
- Keep the UI responsive during heavy work.
- Add an explanation layer for each shipped operation.

### Phase-2 goals
- challenge mode
- guided labs
- import/export enhancements
- richer byte inspection
- batch mode for selected operations

## 8. Explicit non-goals

- full operation parity with CyberChef
- desktop or web-first layout
- cloud sync in MVP
- collaborative editing
- remote recipe execution
- arbitrary plugin code downloads at runtime
- advanced enterprise admin features in MVP

## 9. Feature set

## 9.1 Core workbench

- input editor
- output viewer
- operation browser
- recipe step list
- step reordering
- parameter editing
- live preview
- warnings and diagnostics
- bytes/text/structured view switching
- import from clipboard and local files
- export/copy output
- save/load recipes

## 9.2 Learning layer

- plain-language operation explanations
- examples
- edge cases
- related operations
- glossary terms
- “try this example” action
- step-by-step recipe walkthrough mode

## 9.3 Library

- saved recipes
- recent recipes
- pinned recipes
- imported snippets history (optional, opt-in)
- favorite operations

## 9.4 Platform integrations

- share sheet import
- share/copy export
- file picker
- camera scan is optional later, not MVP

## 10. MVP operation packs

### `core.text`
- Base64 encode/decode
- Hex encode/decode
- URL encode/decode
- HTML entity encode/decode
- XOR
- ROT13 / Caesar

### `core.format`
- JSON pretty/minify/validate
- regex extract
- regex replace
- split/join/trim/filter lines
- JWT parse

### `core.hash`
- MD5
- SHA-1
- SHA-256
- CRC32

### Optional in MVP if low-risk
- gzip/deflate
- YAML ↔ JSON

## 11. User flows

### Flow A — quick decode
1. Open app
2. Paste text
3. Search operation
4. Add “From Base64”
5. View output
6. Save recipe if helpful

### Flow B — learning
1. Open operation browser
2. Tap operation
3. Read explanation and example
4. Try example in workbench
5. Modify parameters
6. Save to favorites

### Flow C — repeat workflow
1. Open saved recipe
2. Replace input
3. Re-run
4. Export output

## 12. UX requirements

- Works well in portrait on a standard phone
- Primary actions reachable with thumb
- Clear distinction between input and output
- Clear error states
- Fast operation search
- Parameter editing should use generated UI where possible
- No tiny drag handles required for normal use

## 13. Quality requirements

- app remains responsive under normal payload sizes
- isolate-backed execution for medium/heavy tasks
- recipe persistence survives upgrade
- deterministic outputs where promised
- input/output data is never sent off-device in normal use
- shipped operations have tests and examples

## 14. Success metrics

### Product quality
- crash-free sessions
- low workbench abandonment after adding first step
- saved recipe reuse rate
- example-run completion rate

### UX quality
- time to first successful transform
- operation-search-to-add conversion
- error recovery rate after invalid input

### Engineering quality
- recipe compatibility retention across releases
- test coverage of shipped operations
- median execution latency for common transforms

## 15. Release criteria for v1

- curated operation core shipped
- workbench stable
- recipe save/load stable
- learning content present for all v1 operations
- no required network dependency
- polished mobile UI on both iOS and Android
