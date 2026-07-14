import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app.dart';
import 'lib.dart';

Future<void> main() async {
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter<NeurogineExpenseModel>(
    NeurogineExpenseModelHiveAdapter(),
  );

  runApp(const NeurogineApp());
}
