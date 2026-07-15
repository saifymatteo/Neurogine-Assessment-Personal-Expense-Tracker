import 'package:flutter/material.dart';

import 'lib.dart';

enum NeurogineLocale {
  en,
  ms;

  String getUiString() {
    return switch (this) {
      NeurogineLocale.en => 'English',
      NeurogineLocale.ms => 'Malay',
    };
  }
}

class NeurogineAppRepository extends ChangeNotifier {
  final router = NeurogineRouter();

  NeurogineLocale _locale = NeurogineLocale.en;
  Locale get locale => localesMap[_locale]!;
  void setLocale(NeurogineLocale newLocale) {
    if (newLocale != _locale) {
      _locale = newLocale;
      notifyListeners();
    }
  }

  final localesMap = {
    NeurogineLocale.en: Locale('en'),
    NeurogineLocale.ms: Locale('ms'),
  };
}
