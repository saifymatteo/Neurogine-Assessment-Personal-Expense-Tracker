import 'package:flutter/material.dart';

import 'lib.dart';

class NeurogineApp extends StatefulWidget {
  const NeurogineApp({super.key});

  @override
  State<NeurogineApp> createState() => _NeurogineAppState();
}

class _NeurogineAppState extends State<NeurogineApp> {
  final router = NeurogineRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
    );
  }
}
