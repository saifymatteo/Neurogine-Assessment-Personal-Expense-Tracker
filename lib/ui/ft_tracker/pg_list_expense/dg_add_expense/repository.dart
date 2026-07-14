import 'package:flutter/material.dart';

import '../../../../lib.dart';

class NeurogineAddExpenseRepository extends ChangeNotifier {
  NeurogineAddExpenseRepository({this.expense}) {
    if (expense != null) {
      nameTextController.text = expense!.name;
      amountTextController.text = (expense!.amount / 100).toStringAsFixed(2);
      _dateTime = expense!.date;
    }
  }

  final NeurogineExpenseModel? expense;

  // FOCUS NODES ---------------------------------------------------------------
  final nameNode = FocusNode();
  final amountNode = FocusNode();
  final dateNode = FocusNode();
  final submitButtonNode = FocusNode();

  // NAME FIELD ----------------------------------------------------------------
  final nameTextController = TextEditingController();
  void nameOnChanged(String value) {
    _nameErrorText = null;
    notifyListeners();
  }

  String? _nameErrorText;
  String? get nameErrorText => _nameErrorText;

  // AMOUNT FIELD --------------------------------------------------------------
  final amountTextController = TextEditingController();
  void amountOnChanged(String value) {
    _amountErrorText = null;
    notifyListeners();
  }

  String? _amountErrorText;
  String? get amountErrorText => _amountErrorText;

  // DATETIME FIELD ------------------------------------------------------------
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  void dateTimeOnChanged(DateTime? value) {
    _dateTime = value;
    _dateTimeErrorText = null;
    notifyListeners();
  }

  String? _dateTimeErrorText;
  String? get dateTimeErrorText => _dateTimeErrorText;

  // FUNCTIONS -----------------------------------------------------------------
  bool validateAll() {
    try {
      if (nameTextController.text.isEmpty) {
        _nameErrorText = 'name is required';
        nameNode.requestFocus();
      }

      if (amountTextController.text.isEmpty) {
        _amountErrorText = 'amount is required';
        amountNode.requestFocus();
      }

      if (dateTime == null) {
        _dateTimeErrorText = 'date is required';
        dateNode.requestFocus();
      }

      final errors = [_nameErrorText, _amountErrorText, _dateTimeErrorText];
      if (errors.any((error) => error != null)) {
        return false;
      }

      return true;
    } finally {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    nameNode.dispose();
    amountNode.dispose();
    dateNode.dispose();
    submitButtonNode.dispose();

    nameTextController.dispose();
    amountTextController.dispose();

    super.dispose();
  }
}
