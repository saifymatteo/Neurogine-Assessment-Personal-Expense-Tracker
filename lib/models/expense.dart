import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@Freezed()
sealed class NeurogineExpenseModel with _$NeurogineExpenseModel {
  const factory NeurogineExpenseModel({
    required String id,
    required String name,

    /// Amount in cents
    required int amount,
    required DateTime date,
  }) = _NeurogineExpenseModel;

  const NeurogineExpenseModel._();

  factory NeurogineExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$NeurogineExpenseModelFromJson(json);

  String get amountDisplay => (amount / 100).toStringAsFixed(2);
}

class NeurogineExpenseModelHiveAdapter
    extends TypeAdapter<NeurogineExpenseModel> {
  @override
  final int typeId = 0;

  @override
  NeurogineExpenseModel read(BinaryReader reader) {
    final id = reader.read();
    final name = reader.read();
    final amount = reader.read();
    final date = reader.read();

    if (id is! String ||
        name is! String ||
        amount is! int ||
        date is! int) {
      throw Exception('Invalid data type for NeurogineExpenseModel');
    }

    return NeurogineExpenseModel(
      id: id,
      name: name,
      amount: amount,
      date: DateTime.fromMillisecondsSinceEpoch(date),
    );
  }

  @override
  void write(BinaryWriter writer, NeurogineExpenseModel obj) {
    writer
      ..write(obj.id)
      ..write(obj.name)
      ..write(obj.amount)
      ..write(obj.date.millisecondsSinceEpoch);
  }
}
