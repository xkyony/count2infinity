import 'package:flutter_test/flutter_test.dart';

import 'i_tap_the_increment_button.dart';

/// Usage: I increment the counter {2} times
Future<void> iIncrementTheCounterTimes(WidgetTester tester, int times) async {
  for (int i = 0; i < times; i++) {
    await iTapTheIncrementButton(tester);
  }
}
