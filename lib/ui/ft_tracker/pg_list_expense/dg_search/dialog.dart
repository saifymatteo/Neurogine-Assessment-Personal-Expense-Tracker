import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/lib.dart';
import 'package:provider/provider.dart';

import 'repository.dart';

class NeurogineSearchExpenseDialog extends StatelessWidget {
  const NeurogineSearchExpenseDialog({super.key, this.currentSearch});

  final String? currentSearch;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          NeurogineSearchExpenseRepository(currentSearch: currentSearch),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Consumer<NeurogineSearchExpenseRepository>(
      builder: (context, repository, _) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.dialogSearchExpenses,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                NeurogineInputField(
                  errorText: repository.searchErrorText,
                  child: TextField(
                    autofocus: true,
                    controller: repository.searchTextController,
                    focusNode: repository.searchNode,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: 'Search'),
                    onChanged: repository.searchOnChanged,
                    onSubmitted: (value) => _submitExpense(context),
                  ),
                ),
                const SizedBox(height: 40),
                NeurogineSubmitButton(
                  focusNode: repository.submitButtonNode,
                  onTap: () => _submitExpense(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _submitExpense(BuildContext context) async {
    final router = context.router;
    final repository = context.read<NeurogineSearchExpenseRepository>();

    await router.maybePop<String>(repository.searchTextController.text);
  }
}
