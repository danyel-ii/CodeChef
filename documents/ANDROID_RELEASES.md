# Android Releases

## Install from GitHub Releases

Android builds are distributed through GitHub Releases.

When a version tag is pushed, the release workflow builds a signed APK and attaches it to the matching GitHub Release.

Example release page:

`https://github.com/danyel-ii/CodeChef/releases`

## Install on Android

1. Open the repository's Releases page on the phone.
2. Download `app-release.apk`.
3. Open the downloaded file.
4. Allow installation from that source if Android prompts for it.
5. Install the app.
6. Confirm the installed app uses the current [CodeChef icon](/Users/danyel-ii/CodeChef/apps/mobile/assets/icon/app_icon_master.png).
7. After install, bundled PDF decks are available in-app:
   - `Settings > Open Blueprint PDF`
   - `Learn > Base64 Encode / Hex Encode / Hex Decode / XOR > Open PDF`

## Release workflow

The workflow is defined in:

[android-release.yml](../.github/workflows/android-release.yml)

It:

1. checks out the tagged ref
2. restores Android signing material from GitHub secrets
3. runs app analysis and tests
4. builds a signed release APK
5. uploads the APK and checksum to the release

## Local release build

If you have a local keystore configured in `apps/mobile/android/key.properties`, you can build a release APK with:

```bash
cd apps/mobile
flutter build apk --release
```

The output file is at:

`apps/mobile/build/app/outputs/flutter-apk/app-release.apk`

## App icon

The current launcher icon source is:

- [app_icon_master.png](/Users/danyel-ii/CodeChef/apps/mobile/assets/icon/app_icon_master.png)

Android launcher icons and web icons are generated from that master asset.

## Bundled PDF documents

The shipped APK includes these bundled decks:

- [CodeChef Blueprint](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/about/codechef_blueprint.pdf)
- [Base64 Deconstructed](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations/base64_deconstructed.pdf)
- [Hexadecimal Encoding Mechanics](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations/hexadecimal_encoding_mechanics.pdf)
- [Inside Hex Decode](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations/inside_hex_decode.pdf)
- [The XOR Transform](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations/the_xor_transform.pdf)

The app copies each PDF into app-local storage on first open and launches it through the device PDF handler.
