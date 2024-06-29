import 'package:flutter_test/flutter_test.dart';

import 'i_tap_the_reset_button.dart';

/// Usage: I reset the counter
Future<void> iResetTheCounter(WidgetTester tester) async {
  await iTapTheResetButton(tester);
  
}
