# Android Releases

This project ships Android builds as signed APKs attached to GitHub Releases.

## Local release signing

1. Generate a keystore:

```bash
keytool -genkeypair \
  -v \
  -keystore ~/upload-keystore.jks \
  -alias upload \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000
```

2. Copy [key.properties.example](/Users/danyel-ii/CodeChef/apps/mobile/android/key.properties.example) to `apps/mobile/android/key.properties`.

3. Fill in:
   - `storePassword`
   - `keyPassword`
   - `keyAlias`
   - `storeFile`

4. Build a release APK:

```bash
cd /Users/danyel-ii/CodeChef/apps/mobile
flutter build apk --release
```

The signed APK will be written to:

[app-release.apk](/Users/danyel-ii/CodeChef/apps/mobile/build/app/outputs/flutter-apk/app-release.apk)

## GitHub Actions secrets

To publish installable APKs from GitHub Releases, add these repository secrets:

- `ANDROID_KEYSTORE_BASE64`
- `ANDROID_KEYSTORE_PASSWORD`
- `ANDROID_KEY_ALIAS`
- `ANDROID_KEY_PASSWORD`

Create the Base64 secret like this:

```bash
base64 -i ~/upload-keystore.jks | pbcopy
```

Then paste that value into `ANDROID_KEYSTORE_BASE64`.

## Release workflow

The workflow lives at:

[android-release.yml](/Users/danyel-ii/CodeChef/.github/workflows/android-release.yml)

It will:

1. bootstrap the workspace
2. restore the signing files from secrets
3. run app analysis and tests
4. build a signed `app-release.apk`
5. upload the APK and checksum to the workflow artifacts
6. attach them to the matching GitHub Release

## Publishing from GitHub

Push a version tag:

```bash
git tag v0.1.0
git push origin v0.1.0
```

The workflow will publish an installable APK to:

`https://github.com/<owner>/<repo>/releases/tag/v0.1.0`

## Installing on Android from GitHub

1. Open the repo's `Releases` page on the phone.
2. Download `app-release.apk`.
3. Open the downloaded file.
4. Allow installation from that source if Android prompts for it.
5. Install the app.

## Notes

- If no signing secrets are configured, the GitHub release job fails by design.
- Local builds still fall back to debug signing until `key.properties` is configured.
- Keep the keystore private. Losing it prevents seamless updates to the same installed app.
