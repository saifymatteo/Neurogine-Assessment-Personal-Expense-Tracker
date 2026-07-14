import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../../../lib.dart';
import 'state.dart';

class NeurogineHomeExpenseSummaryRepository extends ChangeNotifier {
  NeurogineHomeExpenseSummaryState _state = NeurogineHomeExpenseSummaryStateLoading();
  NeurogineHomeExpenseSummaryState get state => _state;

  Box<NeurogineExpenseModel>? _hiveBox;

  String? _currentSearch;
  String? get currentSearch => _currentSearch;

  Future<void> initialise() async {
    try {
      final expenses = <NeurogineExpenseModel>[];

      _hiveBox = await Hive.openBox<NeurogineExpenseModel>('expenses');
      for (final item in _hiveBox?.values ?? <NeurogineExpenseModel>[]) {
        expenses.add(item);
      }

      _state = NeurogineHomeExpenseSummaryStateData(expenses);
    } catch (e) {
      _state = NeurogineHomeExpenseSummaryStateError(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
