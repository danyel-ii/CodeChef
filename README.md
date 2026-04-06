# CodeChef

CodeChef is a touch-first Flutter app for building transformation recipes on mobile.

Users can enter text, compose multi-step recipes, preview results live, save recipes locally, review what each operation does, open bundled learning slide decks, and export a Markdown report of a full transformation run.

## Install

Android APKs are published to [GitHub Releases](https://github.com/danyel-ii/CodeChef/releases).

1. Open the [Releases page](https://github.com/danyel-ii/CodeChef/releases) on your Android device.
2. Download `app-release.apk` from the latest release.
3. Open the downloaded file and follow the on-screen prompts to install it.
4. If Android asks you to allow installation from unknown sources, grant the permission and proceed.

For full details see [Android Releases](documents/ANDROID_RELEASES.md).

## Bundled slide decks

- [CodeChef Blueprint](apps/mobile/assets/pdfs/about/codechef_blueprint.pdf)
- [Base64 Deconstructed](apps/mobile/assets/pdfs/operations/base64_deconstructed.pdf)
- [Hexadecimal Encoding Mechanics](apps/mobile/assets/pdfs/operations/hexadecimal_encoding_mechanics.pdf)
- [Inside Hex Decode](apps/mobile/assets/pdfs/operations/inside_hex_decode.pdf)
- [The XOR Transform](apps/mobile/assets/pdfs/operations/the_xor_transform.pdf)

In the app:

1. Open `Settings` and tap `Open Blueprint PDF` for the about/blueprint deck.
2. Open `Learn`, choose a supported operation, and tap `Open PDF` for its linked slide deck.

The maintained deck folder is:

- [apps/mobile/assets/pdfs](apps/mobile/assets/pdfs)

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
- [Slide Decks](documents/SLIDE_DECKS.md)

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
