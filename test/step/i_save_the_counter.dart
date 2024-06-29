import 'package:flutter_test/flutter_test.dart';

import 'i_save_the_current_counter_value.dart';

/// Usage: I save the counter
Future<void> iSaveTheCounter(WidgetTester tester) async {
  await iSaveTheCurrentCounterValue(tester);
}
