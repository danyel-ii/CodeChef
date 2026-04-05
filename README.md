# CodeChef

CodeChef is a touch-first Flutter app for building transformation recipes on mobile.

Users can enter text, compose multi-step recipes, preview results live, save recipes locally, review what each operation does, and export a Markdown report of a full transformation run.

## Install

Android APKs are published to [GitHub Releases](https://github.com/danyel-ii/CodeChef/releases).

1. Open the [Releases page](https://github.com/danyel-ii/CodeChef/releases) on your Android device.
2. Download `app-release.apk` from the latest release.
3. Open the downloaded file and follow the on-screen prompts to install it.
4. If Android asks you to allow installation from unknown sources, grant the permission and proceed.

For full details see [Android Releases](documents/ANDROID_RELEASES.md).

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

- [apps/mobile](apps/mobile): Flutter application
- [packages](packages): domain, execution, persistence, and pack packages
- [documents](documents): product-facing documentation

## Key user flows

1. Enter input on the Workbench.
2. Add one or more operations from the registry-backed picker.
3. Edit operation parameters from generated controls.
4. Review live output and errors.
5. Save the recipe to the local Library.
6. Learn how each operation works from the Learn surface.
7. Export a Markdown report or recipe JSON when needed.

## Documentation

- [Project Overview](documents/PROJECT_OVERVIEW.md)
- [Learning App Review](documents/LEARNING_APP_REVIEW.md)
- [Android Releases](documents/ANDROID_RELEASES.md)

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
