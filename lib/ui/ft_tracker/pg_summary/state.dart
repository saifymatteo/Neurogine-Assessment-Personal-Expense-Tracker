import '../../../lib.dart';

sealed class NeurogineHomeExpenseSummaryState {}

final class NeurogineHomeExpenseSummaryStateData
    extends NeurogineHomeExpenseSummaryState {
  NeurogineHomeExpenseSummaryStateData(this.expenses);

  final List<NeurogineExpenseModel> expenses;
}

final class NeurogineHomeExpenseSummaryStateLoading
    extends NeurogineHomeExpenseSummaryState {}

final class NeurogineHomeExpenseSummaryStateError
    extends NeurogineHomeExpenseSummaryState {
  NeurogineHomeExpenseSummaryStateError(this.message);

  final String message;
}
