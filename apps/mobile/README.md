# Code Chef Mobile App

This package contains the Android-first Flutter application for Code Chef.

## Responsibilities

- app shell, routing, and feature screens
- schema-driven workbench editing
- local recipe library flows
- in-app learning and PDF deck viewing
- Android packaging, icons, and release output

## Key folders

- `lib/src/app`
  - app bootstrap, routing, and installed pack wiring
- `lib/src/features`
  - user-facing feature areas such as Workbench, Learn, Library, Settings, and Documents
- `assets/icon`
  - source-of-truth app icon assets
- `assets/pdfs`
  - bundled PDF slide decks shipped in the Android app
- `android`
  - Android manifest, adaptive icons, and release config

## Run locally

```bash
flutter run -d android
```

## Validate

```bash
flutter analyze
flutter test
```
