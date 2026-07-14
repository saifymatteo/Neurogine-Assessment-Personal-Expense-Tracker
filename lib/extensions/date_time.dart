import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDisplayFull() => DateFormat.yMMMMEEEEd().format(this);
  String toDisplay() => DateFormat.yMMMMd().format(this);
}
