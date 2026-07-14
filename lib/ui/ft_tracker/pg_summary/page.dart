import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../lib.dart';
import 'repository.dart';
import 'state.dart';

@RoutePage()
class NeurogineHomeExpenseSummaryPage extends StatelessWidget {
  const NeurogineHomeExpenseSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NeurogineHomeExpenseSummaryRepository(),
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
      final state = context.read<NeurogineHomeExpenseSummaryRepository>();
      await state.initialise();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NeurogineHomeExpenseSummaryRepository>(
      builder: (context, repository, _) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: switch (repository.state) {
            NeurogineHomeExpenseSummaryStateLoading() => Center(
              child: CircularProgressIndicator(),
            ),
            NeurogineHomeExpenseSummaryStateError(:final message) => Text(
              message,
            ),
            NeurogineHomeExpenseSummaryStateData(:final expenses) =>
              expenses.isEmpty
                  ? Text(
                      'No expenses found',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )
                  : _SummariesList(expenses: expenses),
          },
        );
      },
    );
  }
}

class _SummariesList extends StatelessWidget {
  const _SummariesList({required this.expenses});

  final List<NeurogineExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final amountSpent = expenses.fold(0, (prev, e) => prev + e.amount);
    final totalTransaction = expenses.length.toString();
    final earliestTransaction = expenses.reduce(
      (v, e) => v.date.isBefore(e.date) ? v : e,
    );
    final latestTransaction = expenses.reduce(
      (v, e) => v.date.isAfter(e.date) ? v : e,
    );

    return Column(
      spacing: 14,
      children: [
        _SummaryItem(
          title: l10n.summaryAmountSpent,
          content: amountSpent.toCurrency(),
        ),
        _SummaryItem(
          title: l10n.summaryTotalTransaction,
          content: totalTransaction,
        ),
        _SummaryItem(
          title: l10n.summaryEarliestTransaction,
          content: earliestTransaction.name,
        ),
        _SummaryItem(
          title: l10n.summaryLatestTransaction,
          content: latestTransaction.name,
        ),
      ],
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text(
          content,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
