import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../lib.dart';

@RoutePage()
class NeurogineHomeTrackerPage extends StatelessWidget {
  const NeurogineHomeTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.appTitle)),
      body: AutoRouter(),
    );
  }
}
