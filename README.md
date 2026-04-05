# CodeChef

CodeChef is a touch-first Flutter app for building transformation recipes on mobile.

Users can enter text, compose multi-step recipes, preview results live, save recipes locally, review what each operation does, and export a Markdown report of a full transformation run.

## Current product scope

- Mobile-first workbench for text payload transformation
- Local recipe library with save, load, favorite, duplicate, import, and export
- Learn surface with explanations, examples, and related operations
- Modular operation packs for:
  - `core.text`
  - `core.hash`
  - `core.format`
  - `core.cipher`
- Android release pipeline for GitHub Releases

## Repository layout

- [apps/mobile](/Users/danyel-ii/CodeChef/apps/mobile): Flutter application
- [packages](/Users/danyel-ii/CodeChef/packages): domain, execution, persistence, and pack packages
- [documents](/Users/danyel-ii/CodeChef/documents): product-facing documentation

## Key user flows

1. Enter input on the Workbench.
2. Add one or more operations from the registry-backed picker.
3. Edit operation parameters from generated controls.
4. Review live output and errors.
5. Save the recipe to the local Library.
6. Learn how each operation works from the Learn surface.
7. Export a Markdown report or recipe JSON when needed.

## Documentation

- [Project Overview](/Users/danyel-ii/CodeChef/documents/PROJECT_OVERVIEW.md)
- [Learning App Review](/Users/danyel-ii/CodeChef/documents/LEARNING_APP_REVIEW.md)
- [Android Releases](/Users/danyel-ii/CodeChef/documents/ANDROID_RELEASES.md)

## Development

```bash
dart run melos bootstrap
cd apps/mobile
flutter run
```

## Validation

```bash
cd apps/mobile
flutter analyze
flutter test
```
