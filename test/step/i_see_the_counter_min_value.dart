import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see the counter min value {'-5'}
Future<void> iSeeTheCounterMinValue(WidgetTester tester, String value) async {
  final minValueFinder = find.byKey(const Key('counter_min_value'));
  // Ensure the text contains the expected min value
  final minValueText = tester.widget<Text>(minValueFinder).data;
  expect(minValueText, contains(value));
}
