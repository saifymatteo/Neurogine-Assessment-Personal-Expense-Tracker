import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../lib.dart';

@RoutePage()
class NeurogineHomeTrackerPage extends StatelessWidget {
  const NeurogineHomeTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        leading: Builder(
          // New BuildContext to open drawer
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      drawer: _AppDrawer(),
      body: AutoRouter(),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  const _AppDrawer();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      width: 200,
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Text(
                  l10n.navigationHome,
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  context.router.replace(NeurogineHomeExpenseListRoute());
                },
              ),
              InkWell(
                child: Text(
                  l10n.navigationSummary,
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  context.router.replace(NeurogineHomeExpenseSummaryRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
