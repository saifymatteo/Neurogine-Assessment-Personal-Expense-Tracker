import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../../../lib.dart';
import 'state.dart';

class NeurogineHomeExpenseListRepository extends ChangeNotifier {
  NeurogineHomeExpenseListState _state = NeurogineHomeExpenseListStateLoading();
  NeurogineHomeExpenseListState get state => _state;

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

      _state = NeurogineHomeExpenseListStateData(expenses);
    } catch (e) {
      _state = NeurogineHomeExpenseListStateError(e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> searchExpense(String search) async {
    try {
      _currentSearch = search;

      final expenses = _hiveBox?.values ?? [];
      final filtered = expenses.where((e) => e.name.contains(currentSearch!));

      _state = NeurogineHomeExpenseListStateData(filtered.toList());
    } catch (e) {
      _state = NeurogineHomeExpenseListStateError(e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> addExpense(NeurogineExpenseModel expense) async {
    try {
      await _hiveBox?.put(expense.id, expense);

      return initialise();
    } catch (e) {
      _state = NeurogineHomeExpenseListStateError(e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> updateExpense(NeurogineExpenseModel expense) async {
    try {
      await _hiveBox?.put(expense.id, expense);

      return initialise();
    } catch (e) {
      _state = NeurogineHomeExpenseListStateError(e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteExpense(NeurogineExpenseModel expense) async {
    try {
      await _hiveBox?.delete(expense.id);

      return initialise();
    } catch (e) {
      _state = NeurogineHomeExpenseListStateError(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
