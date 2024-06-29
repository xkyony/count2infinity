import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see the counter max value {'5'}
Future<void> iSeeTheCounterMaxValue(WidgetTester tester, String value) async {
  final finder = find.byKey(const Key('counter_max_value'));
  final widget = tester.widget<Text>(finder);
  expect(widget.data, value);
}
