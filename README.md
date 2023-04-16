# Flutter Starter with Flavors ❤️

## Welcome

Welcome to our Flutter starter repo! This repo includes a variety of core features to help you get started building a top-quality mobile app.

## Flavor builds

Need to create different versions of your app for different markets or audiences? No problem! This starter repo includes support for flavor builds, so you can easily create unique versions of your app with their own branding, assets, and configurations.

## GetX

GetX is a powerful and lightweight state management library for Flutter apps. We've included it in this starter repo to help you manage the state of your app in a consistent and efficient manner.

Get started building your dream app today with this Flutter starter repo!

<img width="1604"  src="appimages/banner1.png?raw=true">

##

<img width="1604"  src="appimages/banner2.png?raw=true">

## Run Locally

Clone the project

```bash
  git clone https://github.com/girish54321/Flutter-Starter.git
```

```bash
  flutter build apk --release -t lib/main-reqres_dev.dart --flavor reqres_dev
```

## Flutter Doctor for the Repo

```bash
[✓] Flutter (Channel stable, 3.7.0, on macOS 13.2 22D49 darwin-x64, locale
    en-IN)
[!] Android toolchain - develop for Android devices (Android SDK version 33.0.1)
    ✗ cmdline-tools component is missing
      Run `path/to/sdkmanager --install "cmdline-tools;latest"`
      See https://developer.android.com/studio/command-line for more details.
    ✗ Android license status unknown.
      Run `flutter doctor --android-licenses` to accept the SDK licenses.
      See https://flutter.dev/docs/get-started/install/macos#android-setup for
      more details.
[✓] Xcode - develop for iOS and macOS (Xcode 14.2)
[✓] Chrome - develop for the web
[!] Android Studio (version 2022.1)
    ✗ Unable to find bundled Java version.
[✓] VS Code (version 1.77.3)
[✓] Connected device (3 available)
[✓] HTTP Host Availability

! Doctor found issues in 2 categories.
```

## Create APK

```bash
  flutter build apk --release -t lib/main-reqres.dart --flavor reqres
```
