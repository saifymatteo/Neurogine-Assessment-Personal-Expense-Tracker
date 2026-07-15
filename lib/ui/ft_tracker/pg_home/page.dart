import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              InkWell(
                child: Text(
                  l10n.buttonLanguage,
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () => _onTapLanguage(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTapLanguage(BuildContext context) async {
    final appRepo = context.read<NeurogineAppRepository>();

    final result = await showDialog<NeurogineLocale>(
      context: context,
      builder: (context) => Dialog(
        child: ListView.separated(
          padding: EdgeInsets.all(16),
          shrinkWrap: true,
          itemCount: appRepo.localesMap.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            final item = appRepo.localesMap.keys.elementAt(index);
            return ListTile(
              title: Text(item.getUiString()),
              enabled: appRepo.localesMap[item] != appRepo.locale,
              onTap: () => context.router.maybePop<NeurogineLocale>(item),
            );
          },
        ),
      ),
    );

    if (result != null) {
      appRepo.setLocale(result);
    }
  }
}
