import 'package:flutter_test/flutter_test.dart';

import 'i_tap_the_decrement_button.dart';

/// Usage: I decrement the counter {2} times
Future<void> iDecrementTheCounterTimes(WidgetTester tester, num times) async {
  for (int i = 0; i < times; i++) {
    await iTapTheDecrementButton(tester);
  }
}
