// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NeurogineExpenseModel _$NeurogineExpenseModelFromJson(
  Map<String, dynamic> json,
) => _NeurogineExpenseModel(
  id: json['id'] as String,
  name: json['name'] as String,
  amount: (json['amount'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$NeurogineExpenseModelToJson(
  _NeurogineExpenseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'amount': instance.amount,
  'date': instance.date.toIso8601String(),
};
