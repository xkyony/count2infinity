import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see the counter value is {'5'}
Future<void> iSeeTheCounterValueIs(WidgetTester tester, String value) async {
  final finder = find.byKey(const Key('counter_value'));
  final widget = tester.widget<Text>(finder);
  expect(widget.data, value);
}
