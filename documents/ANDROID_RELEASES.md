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
