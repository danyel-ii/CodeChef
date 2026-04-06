# Project Overview

## What Code Chef is

Code Chef is a local-first mobile recipe lab for data transformation and learning.

The app combines two goals:

1. help users build reusable transformation recipes
2. help users understand what each transformation step actually does

It is built as a Flutter app backed by modular Dart packages for domain models, operation protocols, execution, persistence, and operation packs.

## What users can do today

### Workbench

- Type or paste input text
- Add operations from installed packs
- Edit parameters from schema-driven controls
- Reorder, remove, and rerun steps
- See live output and structured execution errors
- Export a Markdown report of the input, each transformation step, and the final output

### Learn

- Browse installed operations by pack
- Search learning content
- Open explanations, examples, related operations, and step-by-step "how it works" sections
- Open bundled PDF slide decks for the blueprint/about surface and selected operation lessons
- Load learning examples directly into the Workbench

### Library

- Save recipes locally
- Reload saved recipes into the Workbench
- Favorite recipes
- Duplicate recipes
- Import recipe JSON
- Export recipe JSON
- Delete recipes

### Settings

- View app-facing product context and current package scope
- Open the bundled Code Chef blueprint PDF

## Installed packs

### `core.text`

- Base64 encode/decode
- Hex encode/decode
- URL encode/decode

### `core.hash`

- MD5
- SHA-1
- SHA-256
- CRC32

### `core.format`

- JSON pretty
- JSON minify
- JSON validate
- Line trim
- Line join
- Filter empty lines

### `core.cipher`

- XOR
- XOR Brute Force
- ROT13
- ROT47
- Caesar
- Caesar Box
- Atbash
- Rail Fence
- Affine
- Bacon
- Vigenere
- RC4
- AES
- DES

## Product characteristics

- Local-first by default
- No remote execution path in normal app use
- Recipe-oriented rather than screen-state-oriented
- Metadata-driven operation editing
- Pack-based extensibility
- Learning content treated as a first-class product surface

## Current release target

Android is the practical release target today. The repository includes Android signing and GitHub release workflow support.
