# Personal Expense Tracker

Flutter app made for [Neurogine's technical assessment](https://github.com/kt-neurogine/personal-expense-tracker).

## Release

See the [web demo](https://neurogine.saifulmashuri.com/) here. Or download [latest APK/Appbundle](https://github.com/saifymatteo/Neurogine-Assessment-Personal-Expense-Tracker/releases/latest)

## Stack

1. [Provider](https://pub.dev/packages/provider) with `ChangeNotifierProvider` - for simple approach
2. [AutoRoute](https://pub.dev/packages/auto_route) - for type-safe navigation
3. [Hive CE](https://pub.dev/packages/hive_ce) - for persistent storage
4. [Freezed](https://pub.dev/packages/freezed) - for object model generator

## Architecture

Project structure was adapted from Ukuya Sdn. Bhd.'s architectural pattern where they mainly use `page.dart` as UI and `state.dart` as business logic with data storage.

This project made a change by utilising `sealed class` to hold UI's state and `repository.dart` to handle the business logic, thus separating data and business logic.

### Structure

Structure follow simple pattern where as everything user see will be in `lib/ui` folder. Each folder have prefix to determine the type of the file themselves.

Example:

- `ft_tracker` - Tracker feature folder
- `ft_tracker/**/page.dart` - Tracker subset page UI
- `ft_tracker/**/repository.dart` - Business logic + data storage for the page UI
- `ft_tracker/**/state.dart` - State for the page (hold data or error message)

Prefix:

- `ft_*` - feature
- `pg_*` - page
- `dg_*` - dialog

#### Note

This project make use of barrel file, example is `lib/lib.dart` where the file export commonly used files

#### Tree Structure

```tree
├───lib
│   ├───main.dart // Flutter entry
│   ├───app.dart // App bootstrap
│   ├───lib.dart // Barrel file for commonly used files
│   ├───l10n // App localizations
│   ├───models // App models used in this project only
│   ├───extensions // App commonly used utilities
│   └────ui
│       ├───routes // App routing configuration
│       ├───components // Commonly used components across in lib/ui
│       └───ft_** // Feature set, contains all UI that user see paired with business logic and individual pages

// Ignore the rest
```

## Localizations

Currently only support limited languages:

- English (en)
- Malay (ms) - AI translated with Gemma4

To add new language, you can made a copy current `lib/l10n/app_neurogine_en.arb` to new file with different suffix.

Example: creating a Malay localizations will require a file called `lib/l10n/app_neurogine_ms.arb`, then you can proceed to change the values inside the file.

## Build

1. Ensure Flutter 3.44.0 or above is installed
2. To run locally, use `flutter run`. Or build instead with `flutter build` (see CLI help for platform)

## AI Usage

This project was assisted with autocomplete AI via VSCode Github Copilot (free tier). Everything else is solely written by hand (excluding Localizations) with the helps of Microsoft's Bing.
