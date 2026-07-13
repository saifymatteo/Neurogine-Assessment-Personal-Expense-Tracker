import 'package:flutter/material.dart';

import 'neurogine_localizations.dart';

export 'neurogine_localizations.dart';

extension NeurogineBuildContextExtension on BuildContext {
  NeurogineLocalizations get l10n => NeurogineLocalizations.of(this)!;
}
