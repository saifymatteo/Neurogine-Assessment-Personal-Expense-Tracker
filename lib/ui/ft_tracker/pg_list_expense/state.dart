import '../../../lib.dart';

sealed class NeurogineHomeExpenseListState {}

final class NeurogineHomeExpenseListStateData
    extends NeurogineHomeExpenseListState {
  NeurogineHomeExpenseListStateData(this.expenses);

  final List<NeurogineExpenseModel> expenses;
}

final class NeurogineHomeExpenseListStateLoading
    extends NeurogineHomeExpenseListState {}

final class NeurogineHomeExpenseListStateError
    extends NeurogineHomeExpenseListState {
  NeurogineHomeExpenseListStateError(this.message);

  final String message;
}
