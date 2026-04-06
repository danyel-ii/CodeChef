# App Icon

This folder contains the current app icon master asset:

- [app_icon_master.png](app_icon_master.png)
- [app_icon_source_square.png](app_icon_source_square.png)

The launcher assets in Android and web are resized from this master icon.

Android now uses adaptive launcher icons:

- `@mipmap/ic_launcher`
- `@mipmap/ic_launcher_round`

with:

- foreground: [ic_launcher_foreground.png](../../android/app/src/main/res/drawable-nodpi/ic_launcher_foreground.png)
- background color: [ic_launcher_background.xml](../../android/app/src/main/res/values/ic_launcher_background.xml)

This lets Android apply the platform-standard rounded masking on install instead of baking the corner shape into the bitmap.

Source note:

- The source art used by the app has been copied into this repo as `app_icon_master.png`
- The master is a square 1024x1024 PNG with transparency, so it is used directly for the adaptive foreground and resized launcher outputs
