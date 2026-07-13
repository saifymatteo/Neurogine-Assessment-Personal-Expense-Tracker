# Personal Expense Tracker

Flutter app made for [Neurogine](https://www.neurogine.com/)'s technical assessment.

[Source](https://github.com/kt-neurogine/personal-expense-tracker)

## Stack

1. Provider with `ChangeNotifierProvider` - for simple approach
2. GetIt - for dependency injection
3. AutoRoute - for type-safe navigation

## Structure

Structure follow simple pattern where as everything user see will be in `lib/ui` folder. Each folder have prefix to determine the type of the file themselves.

Example:

- `ft_home` - Homepage folder
- `ft_home/page.dart` - Homepage UI
- `ft_home/state.dart` - Business logic for Homepage UI

### Note

This project make use of barrel file, example is `lib/lib.dart` where the file export commonly used file

### Tree Structure

```tree
├───lib
│   ├───main.dart // Flutter entry
│   ├───app.dart // App bootstrap
│   ├───routes // App routing configuration
│   └───ui

// Ignore the rest
```

## Localizations

Currently only support English language. To add new language, you can add copy current `lib/l10n/app_neurogine_en.arb` to new file with different suffix. Example: creating a Malay localizations will require a file called `lib/l10n/app_neurogine_ms.arb`, then change the values inside the files.

## Build

1. Ensure Flutter 3.44.0 or above is installed

## AI Usage

This project was assisted with autocomplete AI via VSCode Github Copilot (free tier). Everything else is solely written by hand.
