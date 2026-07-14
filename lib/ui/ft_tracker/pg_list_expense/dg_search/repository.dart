import 'package:flutter/material.dart';

class NeurogineSearchExpenseRepository extends ChangeNotifier {
  NeurogineSearchExpenseRepository({this.currentSearch}) {
    if (currentSearch != null) {
      searchTextController.text = currentSearch!;
    }
  }

  final String? currentSearch;

  // FOCUS NODES ---------------------------------------------------------------
  final searchNode = FocusNode();
  final submitButtonNode = FocusNode();

  // SEARCH FIELD -------------------------------------------------------------
  final searchTextController = TextEditingController();
  void searchOnChanged(String value) {
    _searchErrorText = null;
    notifyListeners();
  }

  String? _searchErrorText;
  String? get searchErrorText => _searchErrorText;

  // FUNCTIONS -----------------------------------------------------------------
  @override
  void dispose() {
    searchNode.dispose();
    submitButtonNode.dispose();

    searchTextController.dispose();

    super.dispose();
  }
}
