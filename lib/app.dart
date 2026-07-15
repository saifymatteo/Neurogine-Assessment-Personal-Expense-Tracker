import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lib.dart';

class NeurogineApp extends StatelessWidget {
  const NeurogineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NeurogineAppRepository(),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Consumer<NeurogineAppRepository>(
      builder: (context, repository, _) {
        return MaterialApp.router(
          routerConfig: repository.router.config(),
          locale: repository.locale,
          localizationsDelegates: NeurogineLocalizations.localizationsDelegates,
          supportedLocales: NeurogineLocalizations.supportedLocales,
        );
      },
    );
  }
}
