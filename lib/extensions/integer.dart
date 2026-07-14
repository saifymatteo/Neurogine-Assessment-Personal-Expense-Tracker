extension IntegerExtension on int {
  String toCurrency() => (this / 100).toStringAsFixed(2);
}
