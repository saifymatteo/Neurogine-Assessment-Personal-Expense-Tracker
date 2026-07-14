import 'package:auto_route/auto_route.dart';
import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../lib.dart';
import 'repository.dart';

class NeurogineAddExpenseDialog extends StatelessWidget {
  const NeurogineAddExpenseDialog({super.key, this.expense});

  final NeurogineExpenseModel? expense;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NeurogineAddExpenseRepository(expense: expense),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Consumer<NeurogineAddExpenseRepository>(
      builder: (context, repository, _) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  repository.expense != null
                      ? l10n.dialogEditExpense
                      : l10n.dialogAddNewExpense,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                NeurogineInputField(
                  errorText: repository.nameErrorText,
                  child: TextField(
                    autofocus: true,
                    controller: repository.nameTextController,
                    focusNode: repository.nameNode,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: l10n.inputFieldName),
                    onChanged: repository.nameOnChanged,
                  ),
                ),
                const SizedBox(height: 12),
                NeurogineInputField(
                  errorText: repository.amountErrorText,
                  child: TextField(
                    controller: repository.amountTextController,
                    focusNode: repository.amountNode,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(
                      labelText: l10n.inputFieldAmount,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}'),
                      ),
                    ],
                    onChanged: repository.amountOnChanged,
                  ),
                ),
                const SizedBox(height: 12),
                NeurogineInputField(
                  errorText: repository.dateTimeErrorText,
                  child: InkWell(
                    focusNode: repository.dateNode,
                    onTap: () => _onTapDate(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        spacing: 8,
                        children: [
                          Text('${l10n.inputFieldDate}:'),
                          const Icon(Icons.calendar_today),
                          if (repository.dateTime != null)
                            Text(repository.dateTime!.toDisplay()),
                        ],
                      ),
                    ),
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

  Future<void> _onTapDate(BuildContext context) async {
    final repository = context.read<NeurogineAddExpenseRepository>();

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: clock.now(),
      firstDate: clock.yearsAgo(20),
      lastDate: clock.now(),
    );

    if (selectedDate != null) {
      repository.dateTimeOnChanged(selectedDate);
    }
  }

  Future<void> _submitExpense(BuildContext context) async {
    final router = context.router;
    final repository = context.read<NeurogineAddExpenseRepository>();

    final validate = repository.validateAll();

    if (!validate) {
      return;
    }

    await router.maybePop<NeurogineExpenseModel>(
      NeurogineExpenseModel(
        id:
            repository.expense?.id ??
            clock.now().millisecondsSinceEpoch.toString(),
        name: repository.nameTextController.text,
        amount: int.parse(
          repository.amountTextController.text.replaceAll('.', ''),
        ),
        date: repository.dateTime ?? clock.now(),
      ),
    );
  }
}
