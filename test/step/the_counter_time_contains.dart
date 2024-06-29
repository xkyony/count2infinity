import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

/// Usage: the counter time contains {'2024-03-05 13:30'}
Future<void> theCounterTimeContains(WidgetTester tester, String value) async {
  final finder = find.byKey(const Key('counter_current_at'));
  final widget = tester.widget<Text>(finder);
  expect(widget.data, contains(value));
}
