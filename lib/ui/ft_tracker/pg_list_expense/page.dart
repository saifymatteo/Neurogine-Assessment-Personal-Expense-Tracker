import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../lib.dart';
import 'dg_add_expense/dialog.dart';
import 'dg_search/dialog.dart';
import 'repository.dart';
import 'state.dart';

@RoutePage()
class NeurogineHomeExpenseListPage extends StatelessWidget {
  const NeurogineHomeExpenseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NeurogineHomeExpenseListRepository(),
      child: const _Content(),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final state = context.read<NeurogineHomeExpenseListRepository>();
      await state.initialise();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NeurogineHomeExpenseListRepository>(
      builder: (context, repository, _) {
        return Stack(
          children: [
            Positioned.fill(
              child: switch (repository.state) {
                NeurogineHomeExpenseListStateLoading() => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                ),
                NeurogineHomeExpenseListStateError(:final message) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(message),
                ),
                NeurogineHomeExpenseListStateData(:final expenses) =>
                  expenses.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'No expenses found',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        )
                      : CustomScrollView(
                          slivers: [
                            SliverPadding(
                              padding: const EdgeInsets.all(16),
                              sliver: SliverList.separated(
                                itemCount: expenses.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemBuilder: (context, index) {
                                  final expense = expenses[index];
                                  return _ExpenseItem(item: expense);
                                },
                              ),
                            ),
                            // Spacing to show end of line
                            SliverToBoxAdapter(child: SizedBox(height: 102)),
                          ],
                        ),
              },
            ),
            Positioned(bottom: 32, right: 32, child: _FloatingActions()),
          ],
        );
      },
    );
  }
}

class _ExpenseItem extends StatelessWidget {
  const _ExpenseItem({required this.item});

  final NeurogineExpenseModel item;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name, style: TextStyle(fontSize: 18)),
              Text('${l10n.inputFieldAmount}: ${item.amount.toCurrency()}'),
              Text('${l10n.inputFieldDate}: ${item.date.toDisplayFull()}'),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => _onTapEditExpense(context, item),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async => _onTapDeleteExpense(context, item),
        ),
      ],
    );
  }

  Future<void> _onTapEditExpense(
    BuildContext context,
    NeurogineExpenseModel expense,
  ) async {
    final state = context.read<NeurogineHomeExpenseListRepository>();

    final result = await showDialog<NeurogineExpenseModel>(
      context: context,
      builder: (context) => NeurogineAddExpenseDialog(expense: expense),
    );
    if (result != null) {
      await state.updateExpense(result);
    }
  }

  Future<void> _onTapDeleteExpense(
    BuildContext context,
    NeurogineExpenseModel expense,
  ) async {
    final state = context.read<NeurogineHomeExpenseListRepository>();

    await state.deleteExpense(expense);
  }
}

class _FloatingActions extends StatelessWidget {
  const _FloatingActions();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      spacing: 24,
      children: [
        FloatingActionButton(
          tooltip: l10n.tooltipAddNewExpense,
          child: Icon(Icons.add),
          onPressed: () => _onTapAddExpense(context),
        ),
        FloatingActionButton(
          tooltip: l10n.tooltipSearchExpense,
          child: Icon(Icons.search),
          onPressed: () => _onTapSearchExpense(context),
        ),
        FloatingActionButton(
          tooltip: l10n.tooltipGenerateExpenses,
          child: Icon(Icons.download),
          onPressed: () => _onTapGenerateExpenses(context),
        ),
        FloatingActionButton(
          tooltip: l10n.tooltipDeleteAllExpenses,
          child: Icon(Icons.delete),
          onPressed: () => _onTapDeleteAllExpenses(context),
        ),
      ],
    );
  }

  Future<void> _onTapAddExpense(BuildContext context) async {
    final state = context.read<NeurogineHomeExpenseListRepository>();

    final result = await showDialog<NeurogineExpenseModel>(
      context: context,
      builder: (context) => const NeurogineAddExpenseDialog(),
    );
    if (result != null) {
      await state.addExpense(result);
    }
  }

  Future<void> _onTapSearchExpense(BuildContext context) async {
    final state = context.read<NeurogineHomeExpenseListRepository>();

    final result = await showDialog<String>(
      context: context,
      builder: (context) =>
          NeurogineSearchExpenseDialog(currentSearch: state.currentSearch),
    );
    if (result != null) {
      await state.searchExpense(result);
    }
  }

  Future<void> _onTapGenerateExpenses(BuildContext context) async {
    final state = context.read<NeurogineHomeExpenseListRepository>();

    final repoState = state.state;
    if (repoState is NeurogineHomeExpenseListStateData) {
      final curLen = repoState.expenses.length;
      for (int i = curLen; i < curLen + 20; i++) {
        final expense = NeurogineExpenseModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: 'Expense $i',
          amount: (i + 1) * 1000,
          date: DateTime.now(),
        );
        await state.addExpense(expense);
      }
    }
  }

  Future<void> _onTapDeleteAllExpenses(BuildContext context) async {
    final state = context.read<NeurogineHomeExpenseListRepository>();

    final repoState = state.state;
    if (repoState is NeurogineHomeExpenseListStateData) {
      final expenses = repoState.expenses;
      for (final expense in expenses) {
        await state.deleteExpense(expense);
      }
    }
  }
}
