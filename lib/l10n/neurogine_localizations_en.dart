// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'neurogine_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class NeurogineLocalizationsEn extends NeurogineLocalizations {
  NeurogineLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Personal Expense Tracker';

  @override
  String get dialogAddNewExpense => 'Add New Expense';

  @override
  String get dialogEditExpense => 'Edit Expense';

  @override
  String get dialogSearchExpenses => 'Search Expenses';

  @override
  String get tooltipAddNewExpense => 'Add new expense';

  @override
  String get tooltipGenerateExpenses => 'Generate new expenses';

  @override
  String get tooltipDeleteAllExpenses => 'Delete all expenses';

  @override
  String get tooltipSearchExpense => 'Search expenses';

  @override
  String get buttonSubmit => 'SUBMIT';
}
